module CTAMInterpreter where


-- Standard library imports
import Prelude hiding (take, drop, (!!))
import qualified Prelude as P (take, drop, (!!))
import Control.Monad (when)
import Data.Char (isDigit)
import Data.Array

-- HMTC module imports
import Name
import TAMCode
import PPTAMCode


import Stack0


data TAMState = TAMState {
    tsCode :: Array MTInt TAMInst,      -- TAM Code
    tsCdSz :: MTInt,                    -- Code size
    tsID   :: MTInt,
    tsSW   :: MTInt,                    -- SW (Switch status) : 0 mean do not switch thread, 1 mean switch
    tsPC   :: MTInt,                    -- PC (Program Counter): 0 <= tsPC <= tsCdSz
    tsLB   :: MTInt,                    -- LB (Local Base): 0 <= tsLB <= tsST
    tsST   :: MTInt,                    -- ST (Stack Top): 0 <= tsST <= stkSz
    tsTh   :: [ThreadState],
    tsStk  :: Stack
}

data ThreadState = ThreadState {
    thID   :: MTInt,
    thPC   :: MTInt,    -- PC (Program Counter): 0 <= tsPC <= tsCdSz
    thLB   :: MTInt,    -- LB (Local Base): 0 <= tsLB <= tsST
    thST   :: MTInt     -- ST (Stack Top): 0 <= tsST <= stkSz
}

switchThread :: TAMState -> TAMState
switchThread s@(TAMState {tsID = id, 
                          tsSW = sw,
                          tsPC = pc, 
                          tsLB = lb, 
                          tsST = st, 
                          tsTh = th,
                          tsStk = stk}) =
        if sw == 0 then s           -- check thread lock
        else if empty th then s     -- check whether there has other threads
        else
            s { tsID = thID h,
                tsPC = thPC h,
                tsLB = thLB h,
                tsST = thST h,
                tsTh = t ++ [ThreadState{thID = id,
                                         thPC = pc,
                                         thLB = lb,
                                         thST = st}]}
    where
        empty []    = True
        empty _     = False
        (h:t)       = th         
        
        
runTAM :: Bool -> [TAMInst] -> IO ()
runTAM trace code = rtAux 0 initTS
    where
        initTS = TAMState {
                     tsCode = array (0, cdSz - 1) (zip [0..] code),
                     tsCdSz = cdSz,
                     tsID   = 0,
                     tsSW   = 1,
                     tsPC   = 0,
                     tsLB   = 0,
                     tsST   = 0,
                     tsTh   = [],
                     tsStk  = initialStack}

        cdSz = toMTInt (length code)

        rtAux k s =
            if (k > 1000000) then error "stop!" else do
            let (i, s') = fetchInst s
            ms <- execute s' i
            case ms of
                Nothing  -> putStrLn "TAM Halted!"
                Just s'' -> do
                    -- due to the structure change, the trace function need to be modified, so hide it now
                    -- when trace (putStr (ppTAMInstState i (print s'')))
                    when trace (putStrLn $ "====================" ++ show (tsID s))
                    when trace (putStr (ppTAMInstState i []))
                    when trace (putStr ("\n" ++ show (print s) ++ "\n"))
                    when trace (putStrLn ("lb"++show (tsLB s)))
                    when trace (putStrLn ("st"++show (tsST s)))
                    rtAux (k+1) $ switchThread s''
                    where
                        print s = help (tsStk s)
        
fetchInst :: TAMState -> (TAMInst, TAMState)
fetchInst s@(TAMState {tsCode = code, tsCdSz = cdSz, tsPC = pc})
    | 0 <= pc && pc < cdSz = (code ! pc, s {tsPC = pc + 1})
    | otherwise            = (HALT, s)        

findLabel :: Name -> TAMState -> MTInt
findLabel l (TAMState {tsCode = code, tsCdSz = cdSz}) = flAux 0
    where
        flAux pc
            | pc < cdSz =
                case code ! pc of
                    Label l' | l == l' -> pc
                    _                  -> flAux (pc + 1)
            | otherwise = pc 

push :: MTInt -> TAMState -> TAMState
push n s@(TAMState {tsST = st,tsID = id, tsStk = stk})
    = s {tsST  = st + 1, tsStk = pushS n id stk}
    
    
pop :: TAMState -> Either String (MTInt, TAMState)
pop s@(TAMState {tsST = st, tsID = id,tsStk = stk}) = 
    case popS id stk of
        Just (topop,stk') -> Right(topop,s{tsST = st - 1, tsStk = stk'})
        Nothing           -> Left stkUFlw

(!!) :: [a] -> MTInt -> a
xs !! n = xs P.!! (fromMTInt n)


drop :: MTInt -> [a] -> [a]
drop n xs = P.drop (fromMTInt n) xs


take :: MTInt -> [a] -> [a]
take n xs = P.take (fromMTInt n) xs
        
execute :: TAMState -> TAMInst -> IO (Maybe TAMState)
-- execute = undefined        
execute s@(TAMState {tsID = id,
                     tsSW = sw,
                     tsPC = pc,
                     tsLB = lb, 
                     tsST = st,
                     tsTh = th,
                     tsStk = stk}) i = 
    case i of
        Label _     -> continue s
        LOADL n     -> continue (push n s)
        LOADCA l    -> continue (push (findLabel l s) s)
    
        -- -- more operation here
        LOAD a     -> readStkAddr a
        LOADA a    -> pushAddr a
        LOADI d    -> readStkInd d
        STORE a    -> writeStkAddr a
        STOREI d   -> writeStkInd d
        LOADLB m n -> pushBlk m n
        LOADIB n   -> readStkBlk n
        STOREIB n  -> writeStkBlk n
        
        -- -- There are still some thing to be done by pop
        -- -- The remind work is to stop some thread 
        -- -- when its definition is being released
        POP m n    -> squeeze m n
    
        ADD        -> binOp (+)
        SUB        -> binOp (-)
        MUL        -> binOp (*)
        DIV        -> binOp (div)
        NEG        -> unOp  negate
        LSS        -> binOp (\x y -> if x < y then 1 else 0)
        EQL        -> binOp (\x y -> if x == y then 1 else 0)
        GTR        -> binOp (\x y -> if x > y then 1 else 0)
        AND        -> binOp (\x y -> if x /= 0 && y /= 0 then 1 else 0)
        OR         -> binOp (\x y -> if x /= 0 || y /= 0 then 1 else 0)
        NOT        -> unOp  (\x -> if x /= 0 then 0 else 1)
        JUMP l     -> jump l s
        JUMPIFZ l  ->
            case pop s of
                Right (x, s') -> if x == 0 then jump l s' else continue s'
                Left msg      -> abort msg
        JUMPIFNZ l ->
            case pop s of
                Right (x, s') -> if x /= 0 then jump l s' else continue s'
                Left msg      -> abort msg
                
        CALL l -> 
            continue (s {tsPC  = findLabel l s,
                         tsLB  = st,
                         tsST  = st + 3,
                         tsStk = pushSN [tsPC s,lb,0] id stk})
        CALLI ->
                case ctStk of
                    (pc' : sl : stk') ->
                        continue (s {tsPC  = pc',
                                tsLB  = st - 2,
                                tsST  = st + 1,
                                tsStk = replaceStk id (tsPC s : lb : sl : stk') stk})
                    _ -> abort stkUFlw
                
        RETURN m n ->
            if st - lb < 3 then
                abort stkARCrrpt
            else if st < m + 3 + n then
                abort stkUFlw
            else -- There is a 3-word act. record and enough elems for return 
                case applyCtStk p id stk of
                Just r ->
                 continue (s {tsPC  = upc,
                              tsLB  = ulb,
                              tsST  = st - 3 - n,
                              tsStk = r})
                Nothing -> abort unknown
            where
                p arr = (take m arr ++ drop (m + 3 + n) arr)
                upc = fromJust $ readStkSingle (addrToIx (LB 2)) stk
                ulb = fromJust $ readStkSingle (addrToIx (LB 1)) stk
                
                
        PUTINT ->
            case pop s of
                Right (n, s') -> putStrLn (show n) >> continue s' 
                Left msg      -> abort msg
        PUTCHR ->
            case pop s of
                Right (n, s') -> putChar (toEnum (fromMTInt n)) >> continue s' 
                Left msg      -> abort msg
        GETINT -> do
            putStrLn "Enter integer: "
            i <- getLine
            let i' = read ('0' : takeWhile isDigit i)
            continue (push i' s)
        GETCHR -> do
            putStrLn "Enter character: "
            c <- getChar
            continue (push (toMTInt (fromEnum c)) s)
        HALT -> return Nothing

        
        -- thread operation here
        THREADSWITCHLOCK  -> continue (s {tsSW = 0})
        THREADSTART name   -> case ctStk of
                pc' : sl : id' : rstk    -> do
                    let newStk = generateNewStack stk id' [pc,lb,sl]
                    case newStk of
                        (Nothing,_) -> abort threadE
                        (Just sb,stk'') -> do
                            let newThr = ThreadState{
                                thID = id',
                                thLB = st - 3,
                                thPC = pc',
                                thST = sb + 3}
                            -- abort "???"
                            jump name (s{ tsStk = replaceStk id rstk stk'',
                                          tsTh  = (newThr : th),
                                          tsSW  = 1,
                                          tsST  = st - 3})
                _                       -> abort stkUFlw

        -- THREADCANCEL       -> case ctStk of
                -- id : rstk -> do
                    -- let newTh = filter (not.(p id)) th
                    -- continue s{tsStk = replaceStk id rstk stk,
                               -- tsTh = newTh,
                               -- tsSW = 1}
                -- _         -> abort stkUFlw
            -- where
                -- p id t = thID t == id
                
        -- THREADWAIT name    -> case ctStk of 
                -- id : rstk  ->
                    -- if (isRunning) then jump name s{tsStk = replaceStk id rstk stk,tsSW = 0}
                    -- else continue s{tsStk = replaceStk id rstk stk,tsSW = 1}
                -- _          -> abort stkUFlw
            -- where
                -- isRunning = elem id (map (thID) th)
                
        -- THREADLOCK name    -> case ctStk of
                -- value : rstk  -> return Nothing               
                -- _             -> abort stkUFlw
        -- THREADUNLOCK       -> return Nothing
        
        -- -- THREADHALT is used for non-main thread to halt itself
        -- -- THREADHALT
        -- -- SEMPOST            -> return Nothing
        -- -- SEMWAIT            -> return Nothing
        
        
    
    where
    
        ctStk = fromJust $ findStk id stk
        
        continue :: TAMState -> IO(Maybe TAMState)
        continue s  | checkOverflow id stk  = return (Just s)
                    | otherwise             = abort stkOFlw
                     
        abort :: String -> IO (Maybe TAMState)
        abort msg  = putStrLn msg
                    -- due to the structure change, the trace function need to be modified, so hide it now
                    -- >> putStrLn (ppTAMInstState i (ctStk(tsStk s)))
                     >> return Nothing
                    
        binOp :: (MTInt -> MTInt -> MTInt) -> IO(Maybe TAMState)
        binOp f = case binOpS f id stk of
            Just stk' -> continue (s {tsST = st -1,
                                      tsStk = stk'})
            Nothing   -> abort stkUFlw
            
        unOp :: (MTInt -> MTInt) -> IO(Maybe TAMState)
        unOp f = case unOpS f id stk of
            Just stk' -> continue (s {tsStk = stk'})
            Nothing   -> abort stkUFlw                     
        
        jump :: Name -> TAMState -> IO (Maybe TAMState)
        jump l s = continue (s {tsPC = findLabel l s})      

        -- addrToIx :: Addr -> MTInt
        -- addrToIx (SB d) = (st - 1) - d
        -- addrToIx (LB d) = (st - 1) - (lb + d)
        -- addrToIx (ST d) = -(1 + d)  

        addrToIx :: Addr -> MTInt
        addrToIx (SB d) = d
        addrToIx (LB d) = (lb + d)
        addrToIx (ST d) = (st - 1) + d  
        
        pushAddr :: Addr -> IO (Maybe TAMState)
        pushAddr a = continue (push (addr a) s)
            where
                addr (SB d) = d
                addr (LB d) = lb + d
                addr (ST d) = st + d

        readStkAddr :: Addr -> IO (Maybe TAMState)
        readStkAddr a = readStk 0 (addrToIx a) 1

        readStkInd :: MTInt -> IO (Maybe TAMState)
        readStkInd d =
                case ctStk of
                    a : _ -> readStk 1 (addrToIx (SB (a + d))) 1
                    _     -> abort stkUFlw
                
        readStkBlk :: MTInt -> IO (Maybe TAMState)
        readStkBlk n =
                case ctStk of
                    a : _ -> readStk 1 (addrToIx (SB a)) n
                    _     -> abort stkUFlw
                
        readStk :: MTInt -> MTInt -> MTInt -> IO (Maybe TAMState)
        readStk m i n
            | start < 0 || i >= st =
                abort stkDisp
            | st' > getStackMax id stk = 
                abort stkOFlw
            | otherwise = case xs of
                Just xs' -> continue (s {tsST = st', 
                            tsStk = pushSN xs' id stkD})
                Nothing  -> abort stkOFlw
                
            where
                start  = i - n + 1
                st'    = st + n - m
                xs     = readStkMultiple i n stk
                stkD   = fromJust $ popSW id m stk
                
    
        writeStkAddr :: Addr -> IO (Maybe TAMState)
        writeStkAddr a =
                case ctStk of
                    x : stk' -> writeStk 1 [x] (addrToIx a)
                    _        -> abort stkUFlw
                
        writeStkInd :: MTInt -> IO (Maybe TAMState)
        writeStkInd d =
                case ctStk of
                    a : x : _ -> writeStk 2 [x] (addrToIx (SB (a + d)))
                    _         -> abort stkUFlw
                
        writeStkBlk :: MTInt -> IO (Maybe TAMState)
        writeStkBlk n
            | an <= st =
                writeStk an block (addrToIx (SB a))
            | otherwise =
                abort stkUFlw
            where
                an = 1 + n
                a : block = take an ctStk

        writeStk :: MTInt -> [MTInt] -> MTInt -> IO (Maybe TAMState)
        writeStk n xs i
            | start < 0 || i >= st =
                abort stkDisp
            | st' < 0 =
                abort stkUFlw
            | otherwise = case newStkM of
                Just newStk -> case applyCtStk p id newStk of
                    Just r  -> continue (s {tsST  = st',tsStk = r})
                    Nothing -> abort unknown
                Nothing     -> abort stkOFlw
            where
                start   = i - fromIntegral (length xs) + 1
                st'     = st - n
                newStkM = writeStkMultiple i xs stk
                p arr = drop n arr
                
                
                
        pushBlk :: MTInt -> MTInt -> IO (Maybe TAMState)
        pushBlk m n
            | st' <= getStackMax id stk =
                continue (s {tsST = st', 
                             tsStk = 
                                pushSN (take n' (repeat m)) id stk})
            | otherwise =
                abort stkOFlw
            where
                n'  = max 0 n
                st' = st + n'   

        squeeze :: MTInt -> MTInt -> IO (Maybe TAMState)
        squeeze m n
            | m' + n' <= st =
                case applyCtStk p id stk of
                Just r ->
                    continue (s {tsST  = st - n',
                                 tsStk = r})
                Nothing -> abort unknown
            | otherwise = 
                abort stkUFlw
            where
                m' = max 0 m
                n' = max 0 n  
                p arr = take m' arr ++ drop (m' + n') arr
                     
-- Error messages                    
stkUFlw       = "Stack underflow!"
stkOFlw       = "Stack overflow!"
stkARCrrpt    = "Activation record corrupted!"
stkDisp       = "Displacement outside stack!"
                     
threadE       = "Thread already existed!"                  
threadN       = "Thread not existed!"
unknown       = "Undefined error!"
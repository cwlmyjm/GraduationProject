{-
******************************************************************************
*                                                                            *
*       Module:         RTAMInterpreter                                      *
*       Purpose:        New Triangle Abstract Machine (TAM) Interpreter      *
*                                                                            *
*                                                                            *
******************************************************************************
-}

module RTAMInterpreter where

-- Standard library imports
import Prelude hiding (take, drop, (!!))
import qualified Prelude as P (take, drop, (!!))
import Control.Monad (when)
import Data.Char (isDigit)
import Data.Array
import Data.Time.Clock


-- HMTC module imports
import Name
import TAMCode
import PPTAMCode
import Stack
import Memory
import MyRandom


-- Definition of thread status
data ThreadStatus = Runable | Running | Occupied | Sleep UTCTime | Dead deriving (Show,Eq)

-- Definition of thread state
data ThreadState = ThreadState {
    thID   :: MTInt,
    thSU   :: ThreadStatus,
    thPC   :: MTInt,
    thLB   :: MTInt,
    thST   :: MTInt,
    thStk  :: Stack
} deriving (Show,Eq)

-- Definition of new TAMState
data TAMState = TAMState {
    tsCode :: Array MTInt TAMInst, -- TAM Code
    tsCdSz :: MTInt,               -- Code Size
    tsCT   :: MTInt,               -- Thread ID counter
    
    tsID   :: MTInt,               -- Current Thread ID
    tsSU   :: ThreadStatus,        -- Current Thread Status
    tsPC   :: MTInt,               -- Current Thread Program Counter
    tsLB   :: MTInt,               -- Current Thread Local Base
    tsST   :: MTInt,               -- Current Thread Stack Top
    tsStk  :: Stack,               -- Current Thread Reference Table

    tsME   :: Memory,              -- Data Structure
    tsTH   :: [ThreadState]        -- Thread Table
} deriving (Show,Eq)

stkSz :: MTInt
stkSz = 10000

steps :: MTInt
steps = 100000000

(!!) :: [a] -> MTInt -> a
xs !! n = xs P.!! (fromMTInt n)

drop :: MTInt -> [a] -> [a]
drop n xs = P.drop (fromMTInt n) xs

take :: MTInt -> [a] -> [a]
take n xs = P.take (fromMTInt n) xs


-- Thread Context Switch
switchThread :: TAMState -> IO TAMState
switchThread s@(TAMState {tsID = id, 
                          tsSU = su,
                          tsPC = pc, 
                          tsLB = lb, 
                          tsST = st, 
                          tsStk = stk,
                          tsTH = th}) = do

            if su == Occupied then return s           -- check thread lock
            else do
                (h,t) <- switchThreadHelper (cThread:th)
                return $ s { tsID  = thID h,
                             tsPC  = thPC h,
                             tsLB  = thLB h,
                             tsST  = thST h,
                             tsSU  = thSU h,
                             tsStk = thStk h,
                             tsTH = t}
    where
        empty []    = True
        empty _     = False
        cThread     = ThreadState{thID = id,thPC = pc,thLB = lb,thST = st,thSU = su,thStk = stk}

-- Thread Context Switch Help Function
-- There has two method to select the next thread: random pick or execute in cirlcle
switchThreadHelper :: [ThreadState] -> IO (ThreadState,[ThreadState])
switchThreadHelper ths = do
    -- it is random to pick next thread
    ran <- drawInt 0 1000
    -- because the thread is added to head after runing,
    -- taking the last thread is meaning to run each thread one by one
    -- let ran = length ths - 1
    let index  = fromIntegral $ mod ran (length ths)
    let next   = ths!!index
    let res    = take index ths ++ drop (index + 1) ths
    case thSU next of
        Sleep time -> do
                    cTime <- getCurrentTime
                    if diffUTCTime cTime time > 0 then return (next{thSU = Running},res)
                    else switchThreadHelper ths
        Dead       -> switchThreadHelper res
        Runable    -> return (next{thSU = Running},res)
        Running    -> return (next,res)

        
-- | Run TAM code (interpreter, naive). Arguments:
--
-- (1) Tracing on (True) or off (False)
--
-- (2) Step Tracing on (True) or off (False)
--
-- (3) The TAM code to run
runTAM :: Bool -> Bool -> [TAMInst] -> IO ()
runTAM trace step code = rtAux 0 initTS
    where
        initTS = TAMState {
                     tsCode = array (0, cdSz - 1) (zip [0..] code),
                     tsCdSz = cdSz,
                     tsCT   = 0,     
                     
                     tsID   = 0,
                     tsSU   = Runable,
                     tsPC   = 0,
                     tsLB   = 0,
                     tsST   = 0,
                     tsStk  = [],
                     
                     tsME   = initM,
                     tsTH   = []}
     
        cdSz = toMTInt (length code)

        rtAux k s = do
            if (k > steps) then error ("\nStop at in instruction " ++ show k ++ "\n") else do
            let (i, s') = fetchInst s
            ms <- execute s' i
            case ms of
                Nothing  -> putStrLn "TAM Halted!"
                Just s'' -> do
                    when step  (getChar >> return())
                    when trace (viewTAMState s' i s'')
                    s''' <- switchThread s''
                    rtAux (k+1) s'''

-- This is used to print out TAMState                    
viewTAMState :: TAMState -> TAMInst -> TAMState -> IO()
viewTAMState s1 i s2 =
    do
        putStrLn $ "########################"
        putStrLn $ "stk: " ++ show (f (tsStk s1) (tsME s1))
        putStrLn $ "ins: " ++ show i    
        putStrLn $ "########################"
        putStrLn $ "ct: "  ++ show (tsCT s2)
        putStrLn $ "id: "  ++ show (tsID s2)
        putStrLn $ "su: "  ++ show (tsSU s2)
        putStrLn $ "pc: "  ++ show (tsPC s2)
        putStrLn $ "lb: "  ++ show (tsLB s2)
        putStrLn $ "st: "  ++ show (tsST s2)
        putStrLn $ "ref: " ++ show (tsStk s2)
        putStrLn $ "stk: " ++ show (f (tsStk s2) (tsME s2))
        putStrLn $ "me: "  ++ show (tsME s2)
        
    

-- Idea: treat the upper stack bound as "soft", only checking if exceeded
-- at the very last, in continue. Right now, not always checked, anyway, 
-- e.g. CALL.  
execute :: TAMState -> TAMInst -> IO (Maybe TAMState)        
execute s@(TAMState {tsID = id,
                     tsPC = pc,
                     tsLB = lb, 
                     tsST = st,
                     tsTH = th,
                     tsCT = ct,
                     tsStk = stk,
                     tsME = me}) i = 
    case i of
        Label _     -> continue (Right s)
        LOADL n     -> continue (push n s)
        LOADCA l    -> continue (push (findLabel l s) s)    
        LOAD a     -> readStkAddr a
        LOADA a    -> pushAddr a
        LOADI d    -> readStkInd d
        STORE a    -> writeStkAddr a
        STOREI d   -> writeStkInd d
        LOADLB m n -> pushBlk m n
        LOADIB n   -> readStkBlk n
        STOREIB n  -> writeStkBlk n
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
                Right (x, s') -> if x == 0 then jump l s' 
                                 else continueR s'
                Left msg      -> abort msg
        JUMPIFNZ l ->
            case pop s of
                Right (x, s') -> if x /= 0 then jump l s' 
                                 else continueR s'
                Left msg      -> abort msg
                
        -- Activation record:
        -- LB:     Static link, not currently used
        -- LB + 1: Dynamic link (old LB)
        -- LB + 2: Return adddress (old PC)
        CALL l -> 
            continue $ do
                s' <- pushN [tsPC s,lb,0] s
                return s'{tsPC  = findLabel l s,
                          tsLB  = st}
        CALLI ->
            case popN 2 s of
                Right (pc' : sl : _, s') -> continue $ do
                    s'' <- pushN [tsPC s,lb,sl] s'
                    return (s'' {tsPC  = pc',
                                 tsLB  = st - 2})
                Left err -> abort err
        RETURN m n ->
            if st - lb < 3 then
                abort stkARCrrpt
            else if st < m + 3 + n then
                abort stkUFlw
            else -- There is a 3-word act. record and enough elems for return
                continue $ do
                    nPC <- readValue (stk !! addrToIx (LB 2)) me
                    nLB <- readValue (stk !! addrToIx (LB 1)) me
                    me' <- releaseRefN toRel me
                    return (s{ tsST = st - 3 - n,
                               tsPC = nPC,
                               tsLB = nLB,
                               tsStk = take m stk ++ drop (m + 3 + n) stk,
                               tsME = me'})
                where
                    toRel = drop m (take (m+3+n) stk)
                    
        
        PUTINT ->
            case pop s of
                Right (n, s') -> putStrLn (show n) >> continueR s' 
                Left msg      -> abort msg
        PUTCHR ->
            case pop s of
                Right (n, s') -> putChar (toEnum (fromMTInt n)) >> continueR s' 
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
        THREADSWITCHLOCK  -> continueR (s {tsSU = Occupied})
        THREADSWITCHUNLOCK  -> continueR (s {tsSU = Running})
        THREADSTART name -> do
            case pop s of
                Right (idAdd , s') ->
                    case (writeValue (ref,id1) (tsME s') >>= 
                         (\me' -> addRefN (tsStk s') me')) of
                        Right me'' ->
                            jump name (s'{tsCT  = ct + 1,
                                          tsTH  = (newThr : th),
                                          tsSU  = Running,
                                          tsME  = me''})
                        Left err -> abort err
                    where
                        id1 = ct + 1
                        newThr = ThreadState{thID  = id1,
                                             thLB  = tsLB s',
                                             thPC  = tsPC s',
                                             thST  = tsST s',
                                             thStk = tsStk s',
                                             thSU  = Runable}
                        ref = tsStk s !! addrToIx (SB idAdd)
                Left err        -> abort err
   
        THREADCANCEL -> do
            case pop s of
                Right (id1,s')  -> do
                    if id1 == 0 then abort cancelMain
                    else if (id1 == id) then continue $ do
                        me' <- releaseRefN (tsStk s') (tsME s')
                        return s'{tsSU = Dead,tsST = 0,tsStk = [],tsME = me'}
                    else if (isRunning id1) then continue $ do
                        me' <- releaseRefN (concat $ map thStk $ toCancel id1) (tsME s')
                        return s'{tsTH = map (p id1) th,tsME = me'}
                    else abort $ threadNotE id1
                Left err        -> abort err
            where
                isRunning n  = elem n (map (thID) th)
                toCancel id2 = filter (\t -> thID t == id2) th
                p id2 t = if (thID t) == id2 then t{thSU = Dead,thStk = [],thST = 0} else t
                
   
        THREADWAIT name -> do
            case pop s of
                Right (id1,s') -> if (id == id1) then abort (waitSelf id)
                                 else if (isRunning id1) then jump name s'{tsSU = Running}
                                 else continueR s'{tsSU = Running}
                Left err        -> abort err
            where
                isRunning n = elem n (map (thID) th)
       
        
        THREADLOCK name -> do
            case popN 2 s of
                Right (val:add:_,s') -> 
                    if val == 0 then do
                        case writeValue (ref,1) (tsME s') of
                            Right me' -> continueR s'{tsSU = Running,tsME = me'}
                            Left err  -> abort err
                    else jump name s'{tsSU = Running}
                    where
                        ref = tsStk s !! addrToIx (SB add)
                Left err             -> abort err
                
                
        THREADUNLOCK -> do
            case popN 2 s of
                Right (val:add:_,s') ->
                    if val == 0 then continueR s'{tsSU = Running}
                    else do
                        case writeValue (ref,0) (tsME s') of
                            Right me' -> continueR s'{tsSU = Running,tsME = me'}
                            Left err  -> abort err
                    where
                        ref = tsStk s !! addrToIx (SB add) 
                Left err             -> abort err
                
        THREADHALT         -> continue $ do
                                me' <- releaseRefN stk me
                                return (s {tsSU = Dead,tsST = 0,tsStk = [],tsME = me'}) 
        THREADSLEEP        -> do
            case pop s of     
                Right (msec,s') -> do
                                cTime <- getCurrentTime
                                let wakeTime = addUTCTime ((fromIntegral msec) / 1000) cTime
                                continueR (s' {tsSU = Sleep wakeTime})
                Left err        -> abort err
  
                
    where
    
        continue :: Either String TAMState -> IO (Maybe TAMState)
        continue (Left err) = abort err
        continue (Right s)  | tsST s <= stkSz = return (Just s)
                            | otherwise       = abort stkOFlw

        continueR :: TAMState -> IO (Maybe TAMState)
        continueR = continue.Right
                            
        abort :: String -> IO (Maybe TAMState)
        abort msg  = putStrLn msg
                     >> putStrLn (ppTAMInstState i (tsStk s))
                     >> return Nothing
                     
        
        jump :: Name -> TAMState -> IO (Maybe TAMState)
        jump l s = continueR $ s{tsPC = findLabel l s}

        unOp :: (MTInt -> MTInt) -> IO (Maybe TAMState)
        unOp f = continue $ do
                    (m',s') <- unOpS f (me,stk)
                    return s{tsStk = s',tsME = m'}
                    
        binOp :: (MTInt -> MTInt -> MTInt) -> IO (Maybe TAMState)
        binOp f = continue $ do
                    (m',s') <- binOpS f (me,stk)
                    return s{tsST = st-1,tsStk = s',tsME = m'}

        squeeze :: MTInt -> MTInt -> IO (Maybe TAMState)
        squeeze m n
            | m' + n' <= st =
                continue $ do
                 me' <- releaseRefN toRel me
                 return (s {tsST  = st - n',
                            tsStk = take m' stk ++ drop (m' + n') stk,
                            tsME  = me'})
            | otherwise = abort stkUFlw
            where
                m' = max 0 m
                n' = max 0 n
                toRel = drop m' (take (m'+n') stk)

        addrToIx :: Addr -> MTInt
        addrToIx (SB d) = (st - 1) - d
        addrToIx (LB d) = (st - 1) - (lb + d)
        addrToIx (ST d) = -(1 + d)

        pushAddr :: Addr -> IO (Maybe TAMState)
        pushAddr a = continue (push (addr a) s)
            where
                addr (SB d) = d
                addr (LB d) = lb + d
                addr (ST d) = st + d

        writeStkAddr :: Addr -> IO (Maybe TAMState)
        writeStkAddr a =
            case stk of
                x : stk' -> writeStk 1 [x'] (addrToIx a)
                    where
                        x' = unSafeReadValue x me
                _        -> abort stkUFlw


        writeStkInd :: MTInt -> IO (Maybe TAMState)
        writeStkInd d =
            case stk of
                a : x : _ -> writeStk 2 [x'] (addrToIx (SB (a' + d)))
                    where
                        a' = unSafeReadValue a me
                        x' = unSafeReadValue x me
                _         -> abort stkUFlw
                

        writeStkBlk :: MTInt -> IO (Maybe TAMState)
        writeStkBlk n
            | an <= st =
                writeStk an block' (addrToIx (SB a'))
            | otherwise =
                abort stkUFlw
            where
                an = 1 + n
                a : block = take an stk
                a' = unSafeReadValue a me
                block' = map (flip unSafeReadValue me) block
                
        writeStk :: MTInt -> [MTInt] -> MTInt -> IO (Maybe TAMState)
        writeStk n xs i
            | start < 0 || i >= st =
                abort stkDisp
            | st' - n < 0 =
                abort stkUFlw
            | otherwise = continue $ do
                me' <- writeValueN p me
                me'' <- releaseRefN toRel me'
                return s{tsST  = st',
                         tsStk = drop n stk,
                         tsME  = me''}
            where
                start = i - fromIntegral (length xs) + 1
                adds  = drop start (take (i + 1) stk)
                toRel = take n stk
                p     = zip adds xs
                st'   = st - n
            

        pushBlk :: MTInt -> MTInt -> IO (Maybe TAMState)
        pushBlk m n
            | st' <= stkSz = continue(pushN toPush s)
            | otherwise    = abort stkOFlw
            where
                n'  = max 0 n
                st' = st + n'
                toPush = take n' (repeat m)

                
        readStkAddr :: Addr -> IO (Maybe TAMState)
        readStkAddr a = readStk 0 (addrToIx a) 1

        readStkInd :: MTInt -> IO (Maybe TAMState)
        readStkInd d =
            case stk of
                a : _ -> readStk 1 (addrToIx (SB (a' + d))) 1
                    where
                        a' = unSafeReadValue a me
                _     -> abort stkUFlw

        readStkBlk :: MTInt -> IO (Maybe TAMState)
        readStkBlk n =
            case stk of
                a : _ -> readStk 1 (addrToIx (SB a')) n
                    where
                        a' = unSafeReadValue a me
                _     -> abort stkUFlw

                
        readStk :: MTInt -> MTInt -> MTInt -> IO (Maybe TAMState)
        readStk m i n
            | start < 0 || i >= st =
                abort stkDisp
            | st' > stkSz = 
                abort stkOFlw
            | otherwise = continue $ do
                (_,s') <- popN m s
                pushN vals s'
            where
                start = i - n + 1
                st'   = st + n - m
                adds  = take n (drop start stk)
                vals  = map (flip unSafeReadValue me) adds

-- If label not found, returns PC just beyond end of code. Attempting to
-- fetch an instruction outside the defined code segment yields HALT,
-- so machine will then stop.
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
            
-- Push without check on upper bound.
push :: MTInt -> TAMState -> Either String TAMState
push n state@(TAMState{tsST = st,tsStk = s,tsME = m})
    = case pushS n (m,s) of
        Left err      -> Left err
        Right (m',s') -> Right $ state{tsST  = st+1,
                                       tsStk = s',
                                       tsME  = m'}
                               
pushN :: [MTInt] -> TAMState -> Either String TAMState
pushN ns state@(TAMState{tsST = st,tsStk = s,tsME = m})
    = case pushSN ns (m,s) of
        Left err    -> Left err
        Right (m',s') -> Right $ state{tsST  = st+mLength ns,
                                       tsStk = s',
                                       tsME  = m'}
                                 
pop :: TAMState -> Either String (MTInt,TAMState)
pop state@(TAMState{tsST = st,tsStk = s,tsME = m})
    = case popS (m,s) of
        Left err            -> Left err
        Right (val,(m',s')) -> Right $ 
                                (val,state{tsST  = st-1,
                                           tsStk = s',
                                           tsME  = m'})
                                   
popN :: MTInt -> TAMState -> Either String ([MTInt],TAMState)
popN n state@(TAMState{tsST = st,tsStk = s,tsME = m})
    = case popSN n (m,s) of
        Left err             -> Left err
        Right (vals,(m',s')) -> Right $ 
                                (vals,state{tsST  = st-n,
                                            tsStk = s',
                                            tsME  = m'})                   

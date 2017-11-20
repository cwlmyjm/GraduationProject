module Stack0 where

-- This file defined stack and its related function

import Type (MTInt)

stackSize :: MTInt
stackSize = 5000

blockSize :: MTInt
blockSize = 500

initialStack :: Stack
initialStack = Stack{
    stkS = [(0,[])],
    thRecs = [(0,0)]
}


data Stack = Stack {
    stkS    :: [(MTInt,[MTInt])],
    thRecs  :: [(MTInt,MTInt)]
} deriving Show

calcStkTop :: MTInt -> MTInt
calcStkTop 0    = 5000
calcStkTop inp  = inp + 500

generateNewStack :: Stack -> MTInt -> [MTInt] -> (Maybe MTInt,Stack)
generateNewStack stk thId init = if checkThreadId stk thId 
                                    then (Nothing,stk)
                                 else   
                                         (Just newSB,
                                          stk{stkS = newStks,
                                              thRecs = newRecs})
    where
        newSB = getAvailableSpace stk
        newStks = (newSB,init):stkS stk
        newRecs = (thId,newSB):thRecs stk
    
getAvailableSpace :: Stack -> MTInt
getAvailableSpace stk = compare sbs avs
    where
        sbs = snd $ unzip $ thRecs stk
        avs = 0:[5000,5000+blockSize..]
        compare a (b:bs) = if elem b a then compare a bs else b
                                
                                
checkThreadId :: Stack -> MTInt -> Bool
checkThreadId stk id = elem id ids
    where
        ids = fst $ unzip $ thRecs stk


pushS :: MTInt -> MTInt -> Stack -> Stack
pushS n tId stk@(Stack {stkS = stks,thRecs = th}) 
    = stk {stkS = update tarSB (n:tarStk) stks}
    where
        tarSB  = fromJust $ lookup tId th
        tarStk = fromJust $ lookup tarSB stks

pushSN :: [MTInt] -> MTInt -> Stack -> Stack
pushSN [] _ stk = stk
pushSN (v:vs) id stk = 
    pushS v id (pushSN vs id stk)
        
fromJust :: Maybe a -> a
fromJust (Just a) = a
fromJust (Nothing) = error "Not a just"
           
    
popS :: MTInt -> Stack -> Maybe (MTInt,Stack)
popS tId stk@(Stack {stkS = stks,thRecs = th})
    = case tarStk of
        v : vs -> Just $
                  (v,stk {stkS = update tarSB vs stks})
        _      -> Nothing
    where
        tarSB  = fromJust $ lookup tId th
        tarStk = fromJust $ lookup tarSB stks

popSW :: MTInt -> MTInt -> Stack -> Maybe Stack
popSW id 0 stk = Just stk
popSW id n stk = case popS id stk of
        Just (_,stk') -> popSW id (n-1) stk'  
        Nothing -> Nothing

binOpS :: (MTInt -> MTInt -> MTInt) -> MTInt -> Stack -> Maybe Stack
binOpS f tId stk@(Stack {stkS = stks,thRecs = th}) = 
    case tarStk of
        y : x : stk' -> Just $ 
                        stk {stkS = update tarSB (f x y : stk') stks}
        _            -> Nothing
    where
        tarSB  = fromJust $ lookup tId th
        tarStk = fromJust $ lookup tarSB stks
        
        
unOpS :: (MTInt -> MTInt) -> MTInt -> Stack -> Maybe Stack
unOpS f tId stk@(Stack {stkS = stks,thRecs = th}) =
    case tarStk of
        x : stk' -> Just $ 
                    stk {stkS = update tarSB (f x : stk') stks}
        _        -> Nothing
    where
        tarSB  = fromJust $ lookup tId th
        tarStk = fromJust $ lookup tarSB stks
        

readStkSingle :: MTInt -> Stack -> Maybe MTInt
readStkSingle i stk@(Stack {stkS = stks,thRecs = th}) =
    case tarStk of
        Just a -> Just ((reverse a)!! (fromMTInt $ q i))
        Nothing -> Nothing
    where 
        p index = if index < 5000 then 0 else (div index 500) * 500
        q index = if index < 5000 then index else mod index 500
        tarStk  = lookup (p i) stks
   
readStkMultiple :: MTInt -> MTInt -> Stack -> Maybe [MTInt]
readStkMultiple i n stk =
    mapM (flip readStkSingle stk) indexs
    where
        indexs = take (fromMTInt n) [i,i+1..]
  

-- writeStkSingle function write value v at address i
-- return Maybe Stack, if fail to write, return Nothing
writeStkSingle :: MTInt -> MTInt -> Stack -> Maybe Stack
writeStkSingle i v stk@(Stack {stkS = stks,thRecs = th}) =
    case tarStk of
        Just a  -> Just $ stk {stkS = 
                   update (p i) (replace i v a) stks}
        Nothing -> Nothing
    where
        p index = if index < 5000 then 0 else (div index 500) * 500
        q index = if index < 5000 then index else mod index 500
        tarStk  = lookup (p i) stks
        
    
-- writeStkMultiple function write values vs, start at address i
-- return Maybe Stack, if fail to write, return Nothing
writeStkMultiple :: MTInt -> [MTInt] -> Stack -> Maybe Stack
writeStkMultiple _ []     stk = Just stk
writeStkMultiple i (v:vs) stk = case writeStkMultiple (i+1) vs stk of
    Just stk' -> writeStkSingle i v stk'
    Nothing   -> Nothing
  

update :: Eq a => a -> b -> [(a,b)] -> [(a,b)]
update va vb []           = []
update va vb ((va',vb'):vs) = if va == va' then (va,vb):vs
                            else (va',vb'):update va vb vs
    
replaceStk :: MTInt -> [MTInt] -> Stack -> Stack 
replaceStk id toR stk@(Stack{stkS = stks,thRecs = th}) = 
    stk{stkS = update tarSB toR stks}
    where
        tarSB  = fromJust $ lookup id th
        tarStk = fromJust $ lookup tarSB stks
 
 
replace :: MTInt -> a -> [a] -> [a]
replace n a b = reverse $ replaceH n a (reverse b)
    
replaceH :: MTInt -> a -> [a] -> [a]
replaceH 0 a (b:bs) = a:bs
replaceH n a (b:bs) = b:(replaceH (n-1) a bs)
    
            
toMTInt :: Int -> MTInt
toMTInt n = fromIntegral n


fromMTInt :: MTInt -> Int
fromMTInt n = fromIntegral n


-- return true if not overflow
checkOverflow :: MTInt -> Stack -> Bool
checkOverflow tId s@(Stack {stkS = stks,thRecs = th}) 
    = fromMTInt tarSB + length tarStk <= fromMTInt(calcStkTop tarSB) 
      where
        tarSB  = fromJust $ lookup tId th
        tarStk = fromJust $ lookup tarSB stks
  
findStk :: MTInt -> Stack -> Maybe [MTInt]
findStk id stk = 
    case tarSB of
        Just sb -> lookup sb (stkS stk)
        Nothing -> Nothing
    where
        tarSB = lookup id (thRecs stk)
    
    
getStackMax :: MTInt -> Stack -> MTInt
getStackMax id stk = calcStkTop tarSB
    where
        tarSB = fromJust $ lookup id (thRecs stk)
    
    
applyCtStk :: ([MTInt] -> [MTInt]) -> MTInt -> Stack -> Maybe Stack
applyCtStk f id stk@(Stack {stkS = stks,thRecs = th}) =
    case tarStk of
        Just tarStk' -> Just $ replaceStk id (f tarStk') stk
        Nothing      -> Nothing
    where
        tarSB  = fromJust $ lookup id th
        tarStk = lookup tarSB stks

help :: Stack -> [MTInt]
help stk@(Stack {stkS = s}) = kk s
 where
    kk [] = []
    kk ((a1,a2):as) = a2 ++ [a1,4399] ++ kk as
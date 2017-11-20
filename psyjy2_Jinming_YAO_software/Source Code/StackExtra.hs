module StackExtra where

import Stack
import Type (MTInt)
import Data.Maybe(fromJust)







sample = Stack {
    stkS = [],
    thRecs = [],
    thRels = [((3,1),5200),((1,0),50),((2,0),70)]
}

calcStkBase :: MTInt -> MTInt
calcStkBase index = if index < 5000 then 0 else (div index 500) * 500

-- checkValid id index = True if the value is in the stack, False not
checkValid :: MTInt -> MTInt -> Stack -> Maybe Bool
checkValid 0  index stk = Just True
checkValid id index stk@(Stack {thRecs = th,thRels = re}) =
    case f1 id of
        Nothing -> Nothing
        Just validTop -> if index > validTop then Just False 
                       else if index >= calcStkBase validTop then Just True
                       else checkValid fatherID index stk
    where
        f0 id0 = let rel = fst $ unzip re in
                 let rel' = zip (fst $ unzip rel) rel in lookup id0 rel'
               
        f1 id0 = case f0 id0 of
                    Nothing -> Nothing
                    Just s  -> lookup s re
        
        fatherID = case f0 id of
                    Nothing     -> error "???"
                    Just (c,f)  -> f 

                    
-- updateValid id index, update the valid top for related thread
updateValid :: MTInt -> MTInt -> Stack -> Stack
updateValid id index stk@(Stack {thRels = re}) = 
    stk {thRels = map p re}
    where
        p ((c,f),i) = ((c,f),if f == id then min i index else i)


addValid :: MTInt -> MTInt -> MTInt -> Stack -> Stack
addValid c f index stk@(Stack {thRels = re}) =
    stk {thRels = ((c,f),index):re}
    
    
    
                    
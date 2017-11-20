{-
******************************************************************************
*                                                                            *
*       Module:         Memory                                               *
*       Purpose:        Reference Table Of Reference Stack Model             *
*                                                                            *
*                                                                            *
******************************************************************************
-}

module Stack where

import Memory
import Type (MTInt)

-- Definition of Stack 
type Stack = [MTInt]

-- Initial stack
initS :: Stack
initS = []

-- This function is used to push value(val) to Stack
pushS :: MTInt -> (Memory,Stack) -> Either String (Memory,Stack)
pushS val (m,s)
    = if isFull1 m then
        Left "Run out of Memory"
      else
        writeValue (ind,val) md >>= (\m' -> Right $ (m',ind:s))
    where
        (ind,md) = gSingle m
   
-- This function is the multiple version of pushS   
pushSN :: [MTInt] -> (Memory,Stack) -> Either String (Memory,Stack)
pushSN [] ms = Right ms
pushSN vals@(v1:vs) (m,s)
    = if isFull2 (mLength vals) m then
        Left "Run out of Memory"
      else
        pushSN vs (m,s) >>= pushS v1

-- This function is used to pop value from Stack
popS :: (Memory,Stack) -> Either String (MTInt,(Memory,Stack))
popS (m,s)
    = case s of
        add : adds -> 
            readValue add m >>= 
            (\val -> (releaseRef add m >>=
            (\m'  -> Right(val,(m',adds)))))
        _          -> Left  $ stkUFlw

-- This function is the multiple version of popS         
popSN :: MTInt -> (Memory,Stack) -> Either String ([MTInt],(Memory,Stack))
popSN 0 ms = Right ([],ms)
popSN 1 ms = popS ms >>= (\(val,nms) -> Right([val],nms))
popSN n ms = popS ms >>= 
            (\(val,nms)   -> popSN (n-1) nms >>= 
            (\(vals,nms') -> Right (val:vals,nms')))

binOpS :: (MTInt -> MTInt -> MTInt) -> (Memory,Stack) -> Either String (Memory,Stack)
binOpS f (m,s) =
    case s of
        a1 : a2 : adds -> do
            v1 <- readValue a1 m
            v2 <- readValue a2 m
            let v3 = f v2 v1
            m' <- writeValue (a2,v3) m
            m'' <- releaseRef a1 m'
            return (m'',tail s)    
        _              -> Left  $ stkOFlw

unOpS :: (MTInt -> MTInt) -> (Memory,Stack) -> Either String (Memory,Stack)
unOpS f (m,s) =
    case s of
        a1 : adds -> do
            v1 <- readValue a1 m
            let v2 = f v1
            m' <- writeValue (a1,v2) m
            return (m',s)    
        _         -> Left  $ stkOFlw
            

f :: Stack -> Memory -> Stack
f [] _ = []
f (s:ss) me = unSafeReadValue s me : f ss me
             
-- Error messages                    
stkUFlw       = "Stack underflow!"
stkOFlw       = "Stack overflow!"
stkARCrrpt    = "Activation record corrupted!"
stkDisp       = "Displacement outside stack!"

threadNotE id = "Thread " ++ show id ++ " not existed!"
threadMiss id = "Machine error: Cannot find thread " ++ show id ++ "in relation table!"
stkNotFind id = "Machine error: Cannot find thread " ++ show id ++ "'s stack!"
accessFree    = "Try to access value which has been released!"
waitSelf id   = "Thread " ++ show id ++ " waits for itself!"
cancelMain    = "Main thread cannot be canceled!"

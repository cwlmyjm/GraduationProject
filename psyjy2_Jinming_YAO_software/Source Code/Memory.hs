{-
******************************************************************************
*                                                                            *
*       Module:         Memory                                               *
*       Purpose:        Data Structure Of Reference Stack Model              *
*                                                                            *
*                                                                            *
******************************************************************************
-}

module Memory where

import Prelude hiding(lookup)
import Data.HashMap.Strict

import Type (MTInt)

-- Definition of Memory 
data Memory = Memory{
                mIndex :: MTInt,
                mData  :: HashMap MTInt (MTInt,MTInt)
                } deriving (Show,Eq)

memorySize :: MTInt
memorySize = 10000

-- This function is used to move memory counter to next cell in circle
memoryMove :: MTInt -> MTInt
memoryMove n = mod (n+1) memorySize

-- Initial Memory
initM :: Memory
initM = Memory {mIndex = 0,mData = empty}
   
-- This function is used to generate a new cell and return its reference index   
gSingle :: Memory -> (MTInt,Memory)
gSingle m@(Memory{mIndex = mi,mData = md})
    = case lookup mi md of
        Nothing -> (mi,m{mIndex = memoryMove mi,mData = insert mi (1,0) md})
        Just _  -> gSingle m{mIndex = memoryMove mi}
                
-- This function is the multiple version of gSingle,
-- generate n cells and return their reference indexes
gMultiple :: Memory -> MTInt -> ([MTInt],Memory)
gMultiple m 0 = ([],m)
gMultiple m n = (ind:inds,md')
    where
        (ind,md) = gSingle m
        (inds,md') = gMultiple md (n-1)

-- Check whether the memory is full        
isFull :: Memory -> Bool
isFull = isFull2 0

-- Check whether the memory is full after add one element
isFull1 :: Memory -> Bool
isFull1 = isFull2 1

-- Check whether the memory is full after add n elements
isFull2 :: MTInt -> Memory -> Bool
isFull2 n m = memorySize <= (mSize(mData m)) + n
        
-- Write value (val) to specific index(ind) in Memory(m),
-- If write successful, return new Memory
-- Else return error message
writeValue :: (MTInt,MTInt) -> Memory -> Either String Memory
writeValue (ind,val) m@(Memory{mIndex = mi,mData = md})
    = case lookup ind md of
        Nothing      -> Left  $ "No reference for address " ++ show ind ++ " in memory!1"
        Just _       -> Right $ m{mData = adjust (\(x,y) -> (x,val)) ind md}

-- This function is the multiple version of writeValue,
-- write n values
writeValueN :: [(MTInt,MTInt)] -> Memory -> Either String Memory
writeValueN [] m = Right m
writeValueN (p:ps) m = writeValue p m >>= writeValueN ps        

-- Read value from Memory(m) at specific index(ind)
-- If read successful, return the value
-- Else return error message
readValue :: MTInt -> Memory -> Either String MTInt
readValue ind m@(Memory{mData = md})
    = case lookup ind md of
        Nothing      -> Left  $ "No reference for address " ++ show ind ++ " in memory!2"
        Just (_,val) -> Right $ val
        
-- This is unsafte read function, 
-- which is used for some situation readValue is not suitable.
unSafeReadValue :: MTInt -> Memory -> MTInt
unSafeReadValue ind m@(Memory{mData = md})
    = case lookup ind md of
        Nothing -> error "Catch it!"
        Just (_,val) -> val
        
-- This function is the multiple version of readValue,
-- read n values        
readValueN :: [MTInt] -> Memory -> Either String [MTInt]
readValueN inds m = mapM (flip readValue m) inds

-- This function is used to release reference(ind) in Memory(mem)
-- If successful, return new Memory,
-- Else return error message
releaseRef :: MTInt -> Memory -> Either String Memory
releaseRef ind m@(Memory{mData = md})
    = case lookup ind md of
        Nothing      -> Left  $ "No reference for address " ++ show ind ++ " in memory!3"
        Just (r,_)   -> Right $ if r == 1 then m{mIndex = ind,mData = delete ind md} 
                                else m{mData = adjust (\(x,y) -> (x-1,y)) ind md}
                                
-- This function is the multiple version of releaseRef,
-- release n references                                 
releaseRefN :: [MTInt] -> Memory -> Either String Memory
releaseRefN [] m = Right m
releaseRefN (ind:inds) m = releaseRef ind m >>= releaseRefN inds
  
-- This function is used to add reference(ind) in Memory(mem)
-- If successful, return new Memory,
-- Else return error message 
addRef :: MTInt -> Memory -> Either String Memory
addRef ind m@(Memory{mData = md})
    = case lookup ind md of
        Nothing      -> Left  $ "No reference for address " ++ show ind ++ " in memory!4"
        Just (r,_)   -> Right $ m{mData = adjust (\(x,y) -> (x+1,y)) ind md}
        
-- This function is the multiple version of addRef,
-- add n references          
addRefN :: [MTInt] -> Memory -> Either String Memory
addRefN [] m = Right m
addRefN (ind:inds) m = addRef ind m >>= addRefN inds

fromMTInt :: MTInt -> Int
fromMTInt n = fromIntegral n

toMTInt :: Int -> MTInt
toMTInt n = fromIntegral n

mSize :: HashMap k v -> MTInt
mSize = toMTInt.size

mLength :: [a] -> MTInt
mLength = toMTInt.length

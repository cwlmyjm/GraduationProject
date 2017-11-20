{-# OPTIONS_GHC -w #-}
-- | Parser for TAM code

module TAMCodeParser (
    parseTC             -- :: String -> DF [TAMInst]
) where

-- Standard library imports
import Data.Char (isDigit, isAlpha, isAlphaNum)

-- HMTC module imports
import SrcPos
import Diagnostics
import Name
import Type (MTInt, isMTInt)
import ParseMonad
import TAMCode
import PPTAMCode
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn 
	= HappyTerminal ((Token, SrcPos))
	| HappyErrorToken Int
	| HappyAbsSyn4 ([TAMInst])
	| HappyAbsSyn6 (TAMInst)
	| HappyAbsSyn8 (Name)
	| HappyAbsSyn9 (Addr)
	| HappyAbsSyn10 (MTInt)

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m = 
	   Int 
	-> ((Token, SrcPos))
	-> HappyState ((Token, SrcPos)) (HappyStk HappyAbsSyn -> m HappyAbsSyn)
	-> [HappyState ((Token, SrcPos)) (HappyStk HappyAbsSyn -> m HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> m HappyAbsSyn
-}

action_0,
 action_1,
 action_2,
 action_3,
 action_4,
 action_5,
 action_6,
 action_7,
 action_8,
 action_9,
 action_10,
 action_11,
 action_12,
 action_13,
 action_14,
 action_15,
 action_16,
 action_17,
 action_18,
 action_19,
 action_20,
 action_21,
 action_22,
 action_23,
 action_24,
 action_25,
 action_26,
 action_27,
 action_28,
 action_29,
 action_30,
 action_31,
 action_32,
 action_33,
 action_34,
 action_35,
 action_36,
 action_37,
 action_38,
 action_39,
 action_40,
 action_41,
 action_42,
 action_43,
 action_44,
 action_45,
 action_46,
 action_47,
 action_48,
 action_49,
 action_50,
 action_51,
 action_52,
 action_53,
 action_54,
 action_55,
 action_56,
 action_57,
 action_58,
 action_59,
 action_60,
 action_61,
 action_62,
 action_63,
 action_64,
 action_65,
 action_66,
 action_67,
 action_68,
 action_69,
 action_70,
 action_71,
 action_72,
 action_73,
 action_74,
 action_75,
 action_76,
 action_77,
 action_78,
 action_79,
 action_80,
 action_81,
 action_82,
 action_83,
 action_84,
 action_85,
 action_86,
 action_87,
 action_88,
 action_89,
 action_90,
 action_91 :: () => Int -> ({-HappyReduction (P) = -}
	   Int 
	-> ((Token, SrcPos))
	-> HappyState ((Token, SrcPos)) (HappyStk HappyAbsSyn -> (P) HappyAbsSyn)
	-> [HappyState ((Token, SrcPos)) (HappyStk HappyAbsSyn -> (P) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> (P) HappyAbsSyn)

happyReduce_1,
 happyReduce_2,
 happyReduce_3,
 happyReduce_4,
 happyReduce_5,
 happyReduce_6,
 happyReduce_7,
 happyReduce_8,
 happyReduce_9,
 happyReduce_10,
 happyReduce_11,
 happyReduce_12,
 happyReduce_13,
 happyReduce_14,
 happyReduce_15,
 happyReduce_16,
 happyReduce_17,
 happyReduce_18,
 happyReduce_19,
 happyReduce_20,
 happyReduce_21,
 happyReduce_22,
 happyReduce_23,
 happyReduce_24,
 happyReduce_25,
 happyReduce_26,
 happyReduce_27,
 happyReduce_28,
 happyReduce_29,
 happyReduce_30,
 happyReduce_31,
 happyReduce_32,
 happyReduce_33,
 happyReduce_34,
 happyReduce_35,
 happyReduce_36,
 happyReduce_37,
 happyReduce_38,
 happyReduce_39,
 happyReduce_40,
 happyReduce_41,
 happyReduce_42,
 happyReduce_43,
 happyReduce_44,
 happyReduce_45,
 happyReduce_46,
 happyReduce_47,
 happyReduce_48,
 happyReduce_49,
 happyReduce_50,
 happyReduce_51,
 happyReduce_52,
 happyReduce_53,
 happyReduce_54,
 happyReduce_55,
 happyReduce_56,
 happyReduce_57,
 happyReduce_58 :: () => ({-HappyReduction (P) = -}
	   Int 
	-> ((Token, SrcPos))
	-> HappyState ((Token, SrcPos)) (HappyStk HappyAbsSyn -> (P) HappyAbsSyn)
	-> [HappyState ((Token, SrcPos)) (HappyStk HappyAbsSyn -> (P) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> (P) HappyAbsSyn)

action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_2
action_0 _ = happyReduce_2

action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 (23) = happyShift action_7
action_2 (24) = happyShift action_8
action_2 (25) = happyShift action_9
action_2 (26) = happyShift action_10
action_2 (27) = happyShift action_11
action_2 (28) = happyShift action_12
action_2 (29) = happyShift action_13
action_2 (30) = happyShift action_14
action_2 (31) = happyShift action_15
action_2 (32) = happyShift action_16
action_2 (33) = happyShift action_17
action_2 (34) = happyShift action_18
action_2 (35) = happyShift action_19
action_2 (36) = happyShift action_20
action_2 (37) = happyShift action_21
action_2 (38) = happyShift action_22
action_2 (39) = happyShift action_23
action_2 (40) = happyShift action_24
action_2 (41) = happyShift action_25
action_2 (42) = happyShift action_26
action_2 (43) = happyShift action_27
action_2 (44) = happyShift action_28
action_2 (45) = happyShift action_29
action_2 (46) = happyShift action_30
action_2 (47) = happyShift action_31
action_2 (48) = happyShift action_32
action_2 (49) = happyShift action_33
action_2 (50) = happyShift action_34
action_2 (51) = happyShift action_35
action_2 (52) = happyShift action_36
action_2 (53) = happyShift action_37
action_2 (54) = happyShift action_38
action_2 (55) = happyShift action_39
action_2 (56) = happyShift action_40
action_2 (57) = happyShift action_41
action_2 (58) = happyShift action_42
action_2 (59) = happyShift action_43
action_2 (60) = happyShift action_44
action_2 (61) = happyShift action_45
action_2 (62) = happyShift action_46
action_2 (63) = happyShift action_47
action_2 (64) = happyShift action_48
action_2 (66) = happyShift action_49
action_2 (6) = happyGoto action_4
action_2 (7) = happyGoto action_5
action_2 (8) = happyGoto action_6
action_2 _ = happyReduce_1

action_3 (67) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_3

action_5 _ = happyReduce_4

action_6 (17) = happyShift action_77
action_6 _ = happyFail

action_7 (18) = happyShift action_66
action_7 (19) = happyShift action_67
action_7 (65) = happyShift action_55
action_7 (12) = happyGoto action_76
action_7 (13) = happyGoto action_64
action_7 (14) = happyGoto action_65
action_7 _ = happyFail

action_8 (66) = happyShift action_49
action_8 (8) = happyGoto action_75
action_8 _ = happyFail

action_9 (15) = happyShift action_71
action_9 (9) = happyGoto action_74
action_9 _ = happyFail

action_10 (15) = happyShift action_71
action_10 (9) = happyGoto action_73
action_10 _ = happyFail

action_11 (18) = happyShift action_66
action_11 (19) = happyShift action_67
action_11 (65) = happyShift action_55
action_11 (10) = happyGoto action_72
action_11 (12) = happyGoto action_69
action_11 (13) = happyGoto action_64
action_11 (14) = happyGoto action_65
action_11 _ = happyFail

action_12 (15) = happyShift action_71
action_12 (9) = happyGoto action_70
action_12 _ = happyFail

action_13 (18) = happyShift action_66
action_13 (19) = happyShift action_67
action_13 (65) = happyShift action_55
action_13 (10) = happyGoto action_68
action_13 (12) = happyGoto action_69
action_13 (13) = happyGoto action_64
action_13 (14) = happyGoto action_65
action_13 _ = happyFail

action_14 (18) = happyShift action_66
action_14 (19) = happyShift action_67
action_14 (65) = happyShift action_55
action_14 (12) = happyGoto action_63
action_14 (13) = happyGoto action_64
action_14 (14) = happyGoto action_65
action_14 _ = happyFail

action_15 (65) = happyShift action_55
action_15 (11) = happyGoto action_62
action_15 (14) = happyGoto action_54
action_15 _ = happyFail

action_16 (65) = happyShift action_55
action_16 (11) = happyGoto action_61
action_16 (14) = happyGoto action_54
action_16 _ = happyFail

action_17 (65) = happyShift action_55
action_17 (11) = happyGoto action_60
action_17 (14) = happyGoto action_54
action_17 _ = happyFail

action_18 _ = happyReduce_17

action_19 _ = happyReduce_18

action_20 _ = happyReduce_19

action_21 _ = happyReduce_20

action_22 _ = happyReduce_21

action_23 _ = happyReduce_22

action_24 _ = happyReduce_23

action_25 _ = happyReduce_24

action_26 _ = happyReduce_25

action_27 _ = happyReduce_26

action_28 _ = happyReduce_27

action_29 (66) = happyShift action_49
action_29 (8) = happyGoto action_59
action_29 _ = happyFail

action_30 (66) = happyShift action_49
action_30 (8) = happyGoto action_58
action_30 _ = happyFail

action_31 (66) = happyShift action_49
action_31 (8) = happyGoto action_57
action_31 _ = happyFail

action_32 (66) = happyShift action_49
action_32 (8) = happyGoto action_56
action_32 _ = happyFail

action_33 _ = happyReduce_32

action_34 (65) = happyShift action_55
action_34 (11) = happyGoto action_53
action_34 (14) = happyGoto action_54
action_34 _ = happyFail

action_35 _ = happyReduce_34

action_36 _ = happyReduce_35

action_37 _ = happyReduce_36

action_38 _ = happyReduce_37

action_39 _ = happyReduce_38

action_40 _ = happyReduce_39

action_41 _ = happyReduce_40

action_42 (66) = happyShift action_49
action_42 (8) = happyGoto action_52
action_42 _ = happyFail

action_43 _ = happyReduce_42

action_44 (66) = happyShift action_49
action_44 (8) = happyGoto action_51
action_44 _ = happyFail

action_45 (66) = happyShift action_49
action_45 (8) = happyGoto action_50
action_45 _ = happyFail

action_46 _ = happyReduce_45

action_47 _ = happyReduce_46

action_48 _ = happyReduce_47

action_49 _ = happyReduce_48

action_50 _ = happyReduce_44

action_51 _ = happyReduce_43

action_52 _ = happyReduce_41

action_53 (65) = happyShift action_55
action_53 (11) = happyGoto action_85
action_53 (14) = happyGoto action_54
action_53 _ = happyFail

action_54 _ = happyReduce_53

action_55 _ = happyReduce_58

action_56 _ = happyReduce_31

action_57 _ = happyReduce_30

action_58 _ = happyReduce_29

action_59 _ = happyReduce_28

action_60 (65) = happyShift action_55
action_60 (11) = happyGoto action_84
action_60 (14) = happyGoto action_54
action_60 _ = happyFail

action_61 _ = happyReduce_15

action_62 _ = happyReduce_14

action_63 (65) = happyShift action_55
action_63 (11) = happyGoto action_83
action_63 (14) = happyGoto action_54
action_63 _ = happyFail

action_64 _ = happyReduce_55

action_65 _ = happyReduce_54

action_66 (65) = happyShift action_82
action_66 _ = happyFail

action_67 (65) = happyShift action_81
action_67 _ = happyFail

action_68 _ = happyReduce_12

action_69 _ = happyReduce_52

action_70 _ = happyReduce_11

action_71 (20) = happyShift action_78
action_71 (21) = happyShift action_79
action_71 (22) = happyShift action_80
action_71 _ = happyFail

action_72 _ = happyReduce_10

action_73 _ = happyReduce_9

action_74 _ = happyReduce_8

action_75 _ = happyReduce_7

action_76 _ = happyReduce_6

action_77 _ = happyReduce_5

action_78 (18) = happyShift action_66
action_78 (19) = happyShift action_67
action_78 (13) = happyGoto action_88
action_78 _ = happyFail

action_79 (18) = happyShift action_66
action_79 (19) = happyShift action_67
action_79 (13) = happyGoto action_87
action_79 _ = happyFail

action_80 (18) = happyShift action_66
action_80 (19) = happyShift action_67
action_80 (13) = happyGoto action_86
action_80 _ = happyFail

action_81 _ = happyReduce_57

action_82 _ = happyReduce_56

action_83 _ = happyReduce_13

action_84 _ = happyReduce_16

action_85 _ = happyReduce_33

action_86 (16) = happyShift action_91
action_86 _ = happyFail

action_87 (16) = happyShift action_90
action_87 _ = happyFail

action_88 (16) = happyShift action_89
action_88 _ = happyFail

action_89 _ = happyReduce_49

action_90 _ = happyReduce_50

action_91 _ = happyReduce_51

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (reverse happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_0  5 happyReduction_2
happyReduction_2  =  HappyAbsSyn4
		 ([]
	)

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_2 : happy_var_1
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  5 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_2 : happy_var_1
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  6 happyReduction_5
happyReduction_5 _
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (Label happy_var_1
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  7 happyReduction_6
happyReduction_6 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (LOADL happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  7 happyReduction_7
happyReduction_7 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (LOADCA happy_var_2
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  7 happyReduction_8
happyReduction_8 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (LOAD happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  7 happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (LOADA happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  7 happyReduction_10
happyReduction_10 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (LOADI happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  7 happyReduction_11
happyReduction_11 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (STORE happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  7 happyReduction_12
happyReduction_12 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (STOREI happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  7 happyReduction_13
happyReduction_13 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (LOADLB happy_var_2 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  7 happyReduction_14
happyReduction_14 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (LOADIB happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  7 happyReduction_15
happyReduction_15 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (STOREIB happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  7 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (POP happy_var_2 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  7 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn6
		 (ADD
	)

happyReduce_18 = happySpecReduce_1  7 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn6
		 (SUB
	)

happyReduce_19 = happySpecReduce_1  7 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn6
		 (MUL
	)

happyReduce_20 = happySpecReduce_1  7 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn6
		 (DIV
	)

happyReduce_21 = happySpecReduce_1  7 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn6
		 (NEG
	)

happyReduce_22 = happySpecReduce_1  7 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn6
		 (LSS
	)

happyReduce_23 = happySpecReduce_1  7 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn6
		 (EQL
	)

happyReduce_24 = happySpecReduce_1  7 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn6
		 (GTR
	)

happyReduce_25 = happySpecReduce_1  7 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn6
		 (AND
	)

happyReduce_26 = happySpecReduce_1  7 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn6
		 (OR
	)

happyReduce_27 = happySpecReduce_1  7 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn6
		 (NOT
	)

happyReduce_28 = happySpecReduce_2  7 happyReduction_28
happyReduction_28 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (JUMP happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  7 happyReduction_29
happyReduction_29 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (JUMPIFZ happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_2  7 happyReduction_30
happyReduction_30 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (JUMPIFNZ happy_var_2
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_2  7 happyReduction_31
happyReduction_31 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (CALL happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  7 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn6
		 (CALLI
	)

happyReduce_33 = happySpecReduce_3  7 happyReduction_33
happyReduction_33 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (RETURN happy_var_2 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  7 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn6
		 (PUTINT
	)

happyReduce_35 = happySpecReduce_1  7 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn6
		 (PUTCHR
	)

happyReduce_36 = happySpecReduce_1  7 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn6
		 (GETINT
	)

happyReduce_37 = happySpecReduce_1  7 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn6
		 (GETCHR
	)

happyReduce_38 = happySpecReduce_1  7 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn6
		 (HALT
	)

happyReduce_39 = happySpecReduce_1  7 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn6
		 (THREADSWITCHLOCK
	)

happyReduce_40 = happySpecReduce_1  7 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn6
		 (THREADSWITCHUNLOCK
	)

happyReduce_41 = happySpecReduce_2  7 happyReduction_41
happyReduction_41 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (THREADSTART happy_var_2
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  7 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn6
		 (THREADCANCEL
	)

happyReduce_43 = happySpecReduce_2  7 happyReduction_43
happyReduction_43 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (THREADWAIT happy_var_2
	)
happyReduction_43 _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_2  7 happyReduction_44
happyReduction_44 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (THREADLOCK happy_var_2
	)
happyReduction_44 _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  7 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn6
		 (THREADUNLOCK
	)

happyReduce_46 = happySpecReduce_1  7 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn6
		 (THREADHALT
	)

happyReduce_47 = happySpecReduce_1  7 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn6
		 (THREADSLEEP
	)

happyReduce_48 = happySpecReduce_1  8 happyReduction_48
happyReduction_48 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn8
		 (tspIdName happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happyReduce 4 9 happyReduction_49
happyReduction_49 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (SB happy_var_3
	) `HappyStk` happyRest

happyReduce_50 = happyReduce 4 9 happyReduction_50
happyReduction_50 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (LB happy_var_3
	) `HappyStk` happyRest

happyReduce_51 = happyReduce 4 9 happyReduction_51
happyReduction_51 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (ST happy_var_3
	) `HappyStk` happyRest

happyReduce_52 = happySpecReduce_1  10 happyReduction_52
happyReduction_52 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_1  11 happyReduction_53
happyReduction_53 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  12 happyReduction_54
happyReduction_54 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  12 happyReduction_55
happyReduction_55 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happyMonadReduce 2 13 happyReduction_56
happyReduction_56 ((HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest) tk
	 = happyThen (( toMTInt (tspLIVal happy_var_2))
	) (\r -> happyReturn (HappyAbsSyn10 r))

happyReduce_57 = happyMonadReduce 2 13 happyReduction_57
happyReduction_57 ((HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest) tk
	 = happyThen (( toMTInt (-(tspLIVal happy_var_2)))
	) (\r -> happyReturn (HappyAbsSyn10 r))

happyReduce_58 = happyMonadReduce 1 14 happyReduction_58
happyReduction_58 ((HappyTerminal happy_var_1) `HappyStk`
	happyRest) tk
	 = happyThen (( toMTInt (tspLIVal happy_var_1))
	) (\r -> happyReturn (HappyAbsSyn10 r))

happyNewToken action sts stk
	= scanner(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	(T_EOF, _) -> action 67 67 tk (HappyState action) sts stk;
	(T_LBrk, happy_dollar_dollar) -> cont 15;
	(T_RBrk, happy_dollar_dollar) -> cont 16;
	(T_Colon, happy_dollar_dollar) -> cont 17;
	(T_Plus, happy_dollar_dollar) -> cont 18;
	(T_Minus, happy_dollar_dollar) -> cont 19;
	(T_SB, happy_dollar_dollar) -> cont 20;
	(T_LB, happy_dollar_dollar) -> cont 21;
	(T_ST, happy_dollar_dollar) -> cont 22;
	(T_LOADL, happy_dollar_dollar) -> cont 23;
	(T_LOADCA, happy_dollar_dollar) -> cont 24;
	(T_LOAD, happy_dollar_dollar) -> cont 25;
	(T_LOADA, happy_dollar_dollar) -> cont 26;
	(T_LOADI, happy_dollar_dollar) -> cont 27;
	(T_STORE, happy_dollar_dollar) -> cont 28;
	(T_STOREI, happy_dollar_dollar) -> cont 29;
	(T_LOADLB, happy_dollar_dollar) -> cont 30;
	(T_LOADIB, happy_dollar_dollar) -> cont 31;
	(T_STOREIB, happy_dollar_dollar) -> cont 32;
	(T_POP, happy_dollar_dollar) -> cont 33;
	(T_ADD, happy_dollar_dollar) -> cont 34;
	(T_SUB, happy_dollar_dollar) -> cont 35;
	(T_MUL, happy_dollar_dollar) -> cont 36;
	(T_DIV, happy_dollar_dollar) -> cont 37;
	(T_NEG, happy_dollar_dollar) -> cont 38;
	(T_LSS, happy_dollar_dollar) -> cont 39;
	(T_EQL, happy_dollar_dollar) -> cont 40;
	(T_GTR, happy_dollar_dollar) -> cont 41;
	(T_AND, happy_dollar_dollar) -> cont 42;
	(T_OR, happy_dollar_dollar) -> cont 43;
	(T_NOT, happy_dollar_dollar) -> cont 44;
	(T_JUMP, happy_dollar_dollar) -> cont 45;
	(T_JUMPIFZ, happy_dollar_dollar) -> cont 46;
	(T_JUMPIFNZ, happy_dollar_dollar) -> cont 47;
	(T_CALL, happy_dollar_dollar) -> cont 48;
	(T_CALLI, happy_dollar_dollar) -> cont 49;
	(T_RETURN, happy_dollar_dollar) -> cont 50;
	(T_PUTINT, happy_dollar_dollar) -> cont 51;
	(T_PUTCHR, happy_dollar_dollar) -> cont 52;
	(T_GETINT, happy_dollar_dollar) -> cont 53;
	(T_GETCHR, happy_dollar_dollar) -> cont 54;
	(T_HALT, happy_dollar_dollar) -> cont 55;
	(T_THREADSWITCHLOCK,   happy_dollar_dollar) -> cont 56;
	(T_THREADSWITCHUNLOCK, happy_dollar_dollar) -> cont 57;
	(T_THREADSTART,        happy_dollar_dollar) -> cont 58;
	(T_THREADCANCEL,       happy_dollar_dollar) -> cont 59;
	(T_THREADWAIT,         happy_dollar_dollar) -> cont 60;
	(T_THREADLOCK,         happy_dollar_dollar) -> cont 61;
	(T_THREADUNLOCK,       happy_dollar_dollar) -> cont 62;
	(T_THREADHALT,         happy_dollar_dollar) -> cont 63;
	(T_THREADSLEEP,        happy_dollar_dollar) -> cont 64;
	(T_LitInt {}, _) -> cont 65;
	(T_Id {}, _) -> cont 66;
	_ -> happyError' tk
	})

happyError_ 67 tk = happyError' tk
happyError_ _ tk = happyError' tk

happyThen :: () => P a -> (a -> P b) -> P b
happyThen = (>>=)
happyReturn :: () => a -> P a
happyReturn = (return)
happyThen1 = happyThen
happyReturn1 :: () => a -> P a
happyReturn1 = happyReturn
happyError' :: () => ((Token, SrcPos)) -> P a
happyError' tk = (\token -> happyError) tk

parseAux = happySomeParser where
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


happyError :: P a
happyError = failP "Parse error"


toMTInt :: Integer -> P MTInt
toMTInt n =
    if isMTInt n then
        return (fromInteger n)
    else
        failP ("The integer " ++ show n
               ++ " is outside the MiniTriangle range.")


-- | Parses a TAM program, building a list of TAM instructions if successful.

parseTC :: String -> DF [TAMInst]
parseTC = runP parseAux


-- Token type for TAM code

data Token
    -- Graphical tokens
    = T_LBrk      -- "["
    | T_RBrk      -- "]"
    | T_Colon     -- ":"
    | T_Plus      -- "+"
    | T_Minus     -- "-"

    -- Registers
    | T_SB
    | T_LB
    | T_ST

    -- Instructions
    | T_LOADL
    | T_LOADCA
    | T_LOAD
    | T_LOADA
    | T_LOADI
    | T_STORE
    | T_STOREI
    | T_LOADLB
    | T_LOADIB
    | T_STOREIB
    | T_POP
    | T_ADD
    | T_SUB
    | T_MUL
    | T_DIV
    | T_NEG
    | T_LSS
    | T_EQL
    | T_GTR
    | T_AND
    | T_OR
    | T_NOT
    | T_JUMP
    | T_JUMPIFZ
    | T_JUMPIFNZ
    | T_CALL
    | T_CALLI
    | T_RETURN
    | T_PUTINT
    | T_PUTCHR
    | T_GETINT
    | T_GETCHR
	| T_THREADSWITCHLOCK
    | T_THREADSWITCHUNLOCK
    | T_THREADSTART    
    | T_THREADCANCEL
    | T_THREADWAIT
    | T_THREADLOCK
    | T_THREADUNLOCK
    | T_THREADHALT
    | T_THREADSLEEP
    | T_HALT

    -- Tokens with variable spellings
    | T_LitInt {liVal :: Integer}
    | T_Id     {idName :: Name}

    -- End Of File marker
    | T_EOF
    deriving (Eq, Show)


-- Projection functions for pairs of token and source position.

tspSrcPos :: (Token,SrcPos) -> SrcPos
tspSrcPos = snd


tspLIVal :: (Token,SrcPos) -> Integer
tspLIVal (T_LitInt {liVal = n}, _) = n
tspLIVal _ = parserErr "tspLIVal" "Not a LitInt"


tspIdName :: (Token,SrcPos) -> Name
tspIdName (T_Id {idName = nm}, _) = nm
tspIdName _ = parserErr "tspIdName" "Not an Id"


tabWidth :: Int
tabWidth = 8


nextTabStop :: Int -> Int
nextTabStop n = n + (tabWidth - (n-1) `mod` tabWidth)


-- TAM code scanner

scanner :: ((Token, SrcPos) -> P a) -> P a
scanner cont = P $ scan
    where
        -- scan :: Int -> Int -> String -> D a
        -- End Of File
        scan l c []         = retTkn T_EOF l c c []
        -- Skip white space and comments, including handling various
        -- line ending conventions (NL, CR+NL, NL+CR) gracefully.
        scan l c ('\n' : s) = scan (l + 1) 1 s
        scan l c ('\r' : s) = scan l 1 s
        scan l c ('\t' : s) = scan l (nextTabStop c) s
        scan l c (' ' : s)  = scan l (c + 1) s
        scan l c (';' : s)  = scan l c (dropWhile (/='\n') s)
        -- Scan graphical tokens
        scan l c ('[' : s)  = retTkn T_LBrk l c (c + 1) s
        scan l c (']' : s)  = retTkn T_RBrk l c (c + 1) s
        scan l c (':' : s)  = retTkn T_Colon l c (c + 1) s
        scan l c ('+' : s)  = retTkn T_Plus l c (c + 1) s
        scan l c ('-' : s)  = retTkn T_Minus l c (c + 1) s
        -- Scan numeric literals, dentifiers, and instructions
        scan l c (x : s) | isDigit x      = scanLitInt l c x s
                         | isIdStartChr x = scanIdOrKwd l c x s
                         | otherwise = do
                                emitErrD (SrcPos l c)
                                         ("Lexical error: Illegal character "
                                           ++ show x  ++ " (discarded)")
                                scan l (c + 1) s

        -- scanLitInt :: Int -> Int -> Char -> String -> D a
        -- Note: We cannot check that the scanned integer literal fits
        -- in an MTInt already here as that would rule out -2^31.
        scanLitInt l c x s = retTkn (T_LitInt (read (x : tail))) l c c' s'
            where
                (tail, s') = span isDigit s
                c'         = c + 1 + length tail

        -- scanIdOrKwd :: Int -> Int -> Char -> String -> D a
        scanIdOrKwd l c x s = retTkn (mkIdOrKwd (x : tail)) l c c' s'
            where
                (tail, s') = span isIdChr s
                c'         = c + 1 + length tail

        mkIdOrKwd :: String -> Token
        mkIdOrKwd "SB"       = T_SB
        mkIdOrKwd "LB"       = T_LB
        mkIdOrKwd "ST"       = T_ST
        mkIdOrKwd "LOADL"    = T_LOADL
        mkIdOrKwd "LOADCA"   = T_LOADCA
        mkIdOrKwd "LOAD"     = T_LOAD
        mkIdOrKwd "LOADA"    = T_LOADA
        mkIdOrKwd "LOADI"    = T_LOADI
        mkIdOrKwd "STORE"    = T_STORE
        mkIdOrKwd "STOREI"   = T_STOREI
        mkIdOrKwd "LOADLB"   = T_LOADLB
        mkIdOrKwd "LOADIB"   = T_LOADIB
        mkIdOrKwd "STOREIB"  = T_STOREIB
        mkIdOrKwd "POP"      = T_POP
        mkIdOrKwd "ADD"      = T_ADD
        mkIdOrKwd "SUB"      = T_SUB
        mkIdOrKwd "MUL"      = T_MUL
        mkIdOrKwd "DIV"      = T_DIV
        mkIdOrKwd "NEG"      = T_NEG
        mkIdOrKwd "LSS"      = T_LSS
        mkIdOrKwd "EQL"      = T_EQL
        mkIdOrKwd "GTR"      = T_GTR
        mkIdOrKwd "AND"      = T_AND
        mkIdOrKwd "OR"       = T_OR
        mkIdOrKwd "NOT"      = T_NOT
        mkIdOrKwd "JUMP"     = T_JUMP
        mkIdOrKwd "JUMPIFZ"  = T_JUMPIFZ
        mkIdOrKwd "JUMPIFNZ" = T_JUMPIFNZ
        mkIdOrKwd "CALL"     = T_CALL
        mkIdOrKwd "CALLI"    = T_CALLI
        mkIdOrKwd "RETURN"   = T_RETURN
        mkIdOrKwd "PUTINT"   = T_PUTINT
        mkIdOrKwd "PUTCHR"   = T_PUTCHR
        mkIdOrKwd "GETINT"   = T_GETINT
        mkIdOrKwd "GETCHR"   = T_GETCHR
        mkIdOrKwd "HALT"     = T_HALT
        mkIdOrKwd "THREADSWITCHLOCK"    = T_THREADSWITCHLOCK
        mkIdOrKwd "THREADSWITCHUNLOCK"  = T_THREADSWITCHUNLOCK
        mkIdOrKwd "THREADSTART"         = T_THREADSTART    
        mkIdOrKwd "THREADCANCEL"        = T_THREADCANCEL
        mkIdOrKwd "THREADWAIT"          = T_THREADWAIT
        mkIdOrKwd "THREADLOCK"          = T_THREADLOCK
        mkIdOrKwd "THREADUNLOCK"        = T_THREADUNLOCK
        mkIdOrKwd "THREADHALT"          = T_THREADHALT
        mkIdOrKwd "THREADSLEEP"         = T_THREADSLEEP
        mkIdOrKwd name       = T_Id {idName = name}

        -- Return token, position of token, updated position, and remaning
        -- input. We assume tnat no MiniTriangle token span multiple
        -- lines. Hence only one line number argument is needed.
        -- retTkn :: Token -> Int -> Int -> Int -> String -> D a
        retTkn t l c c' = unP (cont (t, SrcPos {spLine = l, spCol = c})) l c'


isIdChr :: Char -> Bool
isIdChr c = isAlphaNum c || c == '#' || c == '$' || c == '@' || c == '_'


isIdStartChr :: Char -> Bool
isIdStartChr c = isAlpha c || c == '#' || c == '$' || c == '@' || c == '_'


-- Test utility. Attempts to parse the given string input and,
-- if successful, pretty-prints the resulting AST.

testTCParser :: String -> IO ()
testTCParser s = do
    putStrLn "Diagnostics:"
    mapM_ (putStrLn . ppDMsg) (snd result)
    putStrLn ""
    case fst result of
        Just is -> do
            putStrLn "TAM Code:"
            putStrLn (ppTAMCode is)
        Nothing ->
            putStrLn "Parsing produced no result."
    putStrLn ""
    where
        result :: (Maybe [TAMInst], [DMsg])
        result = runDF (parseTC s)


-- Internal error reporting

parserErr :: String -> String -> a
parserErr = internalError "TAMCodeParser"
{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 9 "<command-line>" #-}
{-# LINE 1 "G:\\GitHub\\haskell-platform\\build\\ghc-bindist\\local\\lib/include\\ghcversion.h" #-}

















{-# LINE 9 "<command-line>" #-}
{-# LINE 1 "templates\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates\\GenericTemplate.hs" #-}

{-# LINE 46 "templates\\GenericTemplate.hs" #-}








{-# LINE 67 "templates\\GenericTemplate.hs" #-}

{-# LINE 77 "templates\\GenericTemplate.hs" #-}

{-# LINE 86 "templates\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates\\GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 256 "templates\\GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 322 "templates\\GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.

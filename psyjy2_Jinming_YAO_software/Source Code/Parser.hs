{-# OPTIONS_GHC -w #-}
-- | MiniTriangle parser

module Parser (
    parse,              -- :: String -> DF AST
    testParser          -- :: String -> IO ()
) where

-- HMTC module imports
import SrcPos
import Diagnostics
import Name
import Token
import AST
import PPAST
import ParseMonad
import Scanner
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn t17 t19 t21 t24
	= HappyTerminal ((Token, SrcPos))
	| HappyErrorToken Int
	| HappyAbsSyn4 (AST)
	| HappyAbsSyn5 ([Command])
	| HappyAbsSyn6 (Command)
	| HappyAbsSyn7 (Maybe Command)
	| HappyAbsSyn8 ([(Expression, Command)])
	| HappyAbsSyn9 ([Expression])
	| HappyAbsSyn11 (Expression)
	| HappyAbsSyn17 t17
	| HappyAbsSyn19 t19
	| HappyAbsSyn21 t21
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 ([(Name, Expression)])
	| HappyAbsSyn27 ((Name, Expression))
	| HappyAbsSyn28 ([Declaration])
	| HappyAbsSyn29 (Declaration)
	| HappyAbsSyn30 ([ArgDecl])
	| HappyAbsSyn32 (ArgDecl)
	| HappyAbsSyn33 (TypeDenoter)
	| HappyAbsSyn34 ([(Name, TypeDenoter)])
	| HappyAbsSyn36 ((Name, TypeDenoter))

action_0 (50) = happyShift action_4
action_0 (57) = happyShift action_5
action_0 (59) = happyShift action_6
action_0 (62) = happyShift action_7
action_0 (66) = happyShift action_8
action_0 (67) = happyShift action_9
action_0 (68) = happyShift action_10
action_0 (69) = happyShift action_11
action_0 (70) = happyShift action_12
action_0 (71) = happyShift action_13
action_0 (74) = happyShift action_14
action_0 (4) = happyGoto action_15
action_0 (6) = happyGoto action_2
action_0 (13) = happyGoto action_3
action_0 _ = happyFail

action_1 (50) = happyShift action_4
action_1 (57) = happyShift action_5
action_1 (59) = happyShift action_6
action_1 (62) = happyShift action_7
action_1 (66) = happyShift action_8
action_1 (67) = happyShift action_9
action_1 (68) = happyShift action_10
action_1 (69) = happyShift action_11
action_1 (70) = happyShift action_12
action_1 (71) = happyShift action_13
action_1 (74) = happyShift action_14
action_1 (6) = happyGoto action_2
action_1 (13) = happyGoto action_3
action_1 _ = happyFail

action_2 _ = happyReduce_1

action_3 (37) = happyShift action_43
action_3 (39) = happyShift action_44
action_3 (44) = happyShift action_45
action_3 (47) = happyShift action_46
action_3 _ = happyFail

action_4 (50) = happyShift action_4
action_4 (57) = happyShift action_5
action_4 (59) = happyShift action_6
action_4 (62) = happyShift action_7
action_4 (66) = happyShift action_8
action_4 (67) = happyShift action_9
action_4 (68) = happyShift action_10
action_4 (69) = happyShift action_11
action_4 (70) = happyShift action_12
action_4 (71) = happyShift action_13
action_4 (74) = happyShift action_14
action_4 (5) = happyGoto action_41
action_4 (6) = happyGoto action_42
action_4 (13) = happyGoto action_3
action_4 _ = happyFail

action_5 (37) = happyShift action_26
action_5 (39) = happyShift action_27
action_5 (41) = happyShift action_28
action_5 (72) = happyShift action_29
action_5 (73) = happyShift action_30
action_5 (74) = happyShift action_14
action_5 (76) = happyShift action_31
action_5 (89) = happyShift action_32
action_5 (11) = happyGoto action_40
action_5 (12) = happyGoto action_22
action_5 (13) = happyGoto action_23
action_5 (23) = happyGoto action_24
action_5 (24) = happyGoto action_25
action_5 _ = happyFail

action_6 (51) = happyShift action_36
action_6 (56) = happyShift action_37
action_6 (61) = happyShift action_38
action_6 (65) = happyShift action_39
action_6 (28) = happyGoto action_34
action_6 (29) = happyGoto action_35
action_6 _ = happyFail

action_7 (50) = happyShift action_4
action_7 (57) = happyShift action_5
action_7 (59) = happyShift action_6
action_7 (62) = happyShift action_7
action_7 (66) = happyShift action_8
action_7 (67) = happyShift action_9
action_7 (68) = happyShift action_10
action_7 (69) = happyShift action_11
action_7 (70) = happyShift action_12
action_7 (71) = happyShift action_13
action_7 (74) = happyShift action_14
action_7 (6) = happyGoto action_33
action_7 (13) = happyGoto action_3
action_7 _ = happyFail

action_8 (37) = happyShift action_26
action_8 (39) = happyShift action_27
action_8 (41) = happyShift action_28
action_8 (72) = happyShift action_29
action_8 (73) = happyShift action_30
action_8 (74) = happyShift action_14
action_8 (76) = happyShift action_31
action_8 (89) = happyShift action_32
action_8 (11) = happyGoto action_21
action_8 (12) = happyGoto action_22
action_8 (13) = happyGoto action_23
action_8 (23) = happyGoto action_24
action_8 (24) = happyGoto action_25
action_8 _ = happyFail

action_9 (37) = happyShift action_20
action_9 _ = happyFail

action_10 (37) = happyShift action_19
action_10 _ = happyFail

action_11 (37) = happyShift action_18
action_11 _ = happyFail

action_12 (37) = happyShift action_17
action_12 _ = happyFail

action_13 (37) = happyShift action_16
action_13 _ = happyFail

action_14 _ = happyReduce_40

action_15 (90) = happyAccept
action_15 _ = happyFail

action_16 (74) = happyShift action_14
action_16 (13) = happyGoto action_100
action_16 _ = happyFail

action_17 (74) = happyShift action_14
action_17 (13) = happyGoto action_99
action_17 _ = happyFail

action_18 (37) = happyShift action_26
action_18 (39) = happyShift action_27
action_18 (41) = happyShift action_28
action_18 (72) = happyShift action_29
action_18 (73) = happyShift action_30
action_18 (74) = happyShift action_14
action_18 (76) = happyShift action_31
action_18 (89) = happyShift action_32
action_18 (11) = happyGoto action_98
action_18 (12) = happyGoto action_22
action_18 (13) = happyGoto action_23
action_18 (23) = happyGoto action_24
action_18 (24) = happyGoto action_25
action_18 _ = happyFail

action_19 (37) = happyShift action_26
action_19 (39) = happyShift action_27
action_19 (41) = happyShift action_28
action_19 (72) = happyShift action_29
action_19 (73) = happyShift action_30
action_19 (74) = happyShift action_14
action_19 (76) = happyShift action_31
action_19 (89) = happyShift action_32
action_19 (11) = happyGoto action_97
action_19 (12) = happyGoto action_22
action_19 (13) = happyGoto action_23
action_19 (23) = happyGoto action_24
action_19 (24) = happyGoto action_25
action_19 _ = happyFail

action_20 (37) = happyShift action_26
action_20 (39) = happyShift action_27
action_20 (41) = happyShift action_28
action_20 (72) = happyShift action_29
action_20 (73) = happyShift action_30
action_20 (74) = happyShift action_14
action_20 (76) = happyShift action_31
action_20 (89) = happyShift action_32
action_20 (11) = happyGoto action_96
action_20 (12) = happyGoto action_22
action_20 (13) = happyGoto action_23
action_20 (23) = happyGoto action_24
action_20 (24) = happyGoto action_25
action_20 _ = happyFail

action_21 (49) = happyShift action_64
action_21 (52) = happyShift action_95
action_21 (75) = happyShift action_66
action_21 (76) = happyShift action_67
action_21 (77) = happyShift action_68
action_21 (78) = happyShift action_69
action_21 (79) = happyShift action_70
action_21 (80) = happyShift action_71
action_21 (81) = happyShift action_72
action_21 (82) = happyShift action_73
action_21 (83) = happyShift action_74
action_21 (84) = happyShift action_75
action_21 (85) = happyShift action_76
action_21 (86) = happyShift action_77
action_21 (87) = happyShift action_78
action_21 (88) = happyShift action_79
action_21 (14) = happyGoto action_55
action_21 (15) = happyGoto action_56
action_21 (16) = happyGoto action_57
action_21 (17) = happyGoto action_58
action_21 (18) = happyGoto action_59
action_21 (19) = happyGoto action_60
action_21 (20) = happyGoto action_61
action_21 (21) = happyGoto action_62
action_21 (22) = happyGoto action_63
action_21 _ = happyFail

action_22 _ = happyReduce_24

action_23 (37) = happyShift action_94
action_23 (39) = happyShift action_44
action_23 (44) = happyShift action_45
action_23 _ = happyReduce_34

action_24 (37) = happyShift action_26
action_24 (39) = happyShift action_27
action_24 (41) = happyShift action_28
action_24 (72) = happyShift action_29
action_24 (73) = happyShift action_30
action_24 (74) = happyShift action_14
action_24 (76) = happyShift action_31
action_24 (89) = happyShift action_32
action_24 (12) = happyGoto action_93
action_24 (13) = happyGoto action_23
action_24 (23) = happyGoto action_24
action_24 (24) = happyGoto action_25
action_24 _ = happyFail

action_25 _ = happyReduce_60

action_26 (37) = happyShift action_26
action_26 (39) = happyShift action_27
action_26 (41) = happyShift action_28
action_26 (72) = happyShift action_29
action_26 (73) = happyShift action_30
action_26 (74) = happyShift action_14
action_26 (76) = happyShift action_31
action_26 (89) = happyShift action_32
action_26 (11) = happyGoto action_92
action_26 (12) = happyGoto action_22
action_26 (13) = happyGoto action_23
action_26 (23) = happyGoto action_24
action_26 (24) = happyGoto action_25
action_26 _ = happyFail

action_27 (37) = happyShift action_26
action_27 (39) = happyShift action_27
action_27 (41) = happyShift action_28
action_27 (72) = happyShift action_29
action_27 (73) = happyShift action_30
action_27 (74) = happyShift action_14
action_27 (76) = happyShift action_31
action_27 (89) = happyShift action_32
action_27 (9) = happyGoto action_91
action_27 (10) = happyGoto action_51
action_27 (11) = happyGoto action_52
action_27 (12) = happyGoto action_22
action_27 (13) = happyGoto action_23
action_27 (23) = happyGoto action_24
action_27 (24) = happyGoto action_25
action_27 _ = happyReduce_20

action_28 (74) = happyShift action_90
action_28 (25) = happyGoto action_87
action_28 (26) = happyGoto action_88
action_28 (27) = happyGoto action_89
action_28 _ = happyReduce_63

action_29 _ = happyReduce_32

action_30 _ = happyReduce_33

action_31 _ = happyReduce_62

action_32 _ = happyReduce_61

action_33 (64) = happyShift action_86
action_33 _ = happyFail

action_34 (58) = happyShift action_85
action_34 _ = happyFail

action_35 (45) = happyShift action_84
action_35 _ = happyReduce_68

action_36 (74) = happyShift action_83
action_36 _ = happyFail

action_37 (74) = happyShift action_82
action_37 _ = happyFail

action_38 (74) = happyShift action_81
action_38 _ = happyFail

action_39 (74) = happyShift action_80
action_39 _ = happyFail

action_40 (49) = happyShift action_64
action_40 (63) = happyShift action_65
action_40 (75) = happyShift action_66
action_40 (76) = happyShift action_67
action_40 (77) = happyShift action_68
action_40 (78) = happyShift action_69
action_40 (79) = happyShift action_70
action_40 (80) = happyShift action_71
action_40 (81) = happyShift action_72
action_40 (82) = happyShift action_73
action_40 (83) = happyShift action_74
action_40 (84) = happyShift action_75
action_40 (85) = happyShift action_76
action_40 (86) = happyShift action_77
action_40 (87) = happyShift action_78
action_40 (88) = happyShift action_79
action_40 (14) = happyGoto action_55
action_40 (15) = happyGoto action_56
action_40 (16) = happyGoto action_57
action_40 (17) = happyGoto action_58
action_40 (18) = happyGoto action_59
action_40 (19) = happyGoto action_60
action_40 (20) = happyGoto action_61
action_40 (21) = happyGoto action_62
action_40 (22) = happyGoto action_63
action_40 _ = happyFail

action_41 (55) = happyShift action_54
action_41 _ = happyFail

action_42 (45) = happyShift action_53
action_42 _ = happyReduce_2

action_43 (37) = happyShift action_26
action_43 (39) = happyShift action_27
action_43 (41) = happyShift action_28
action_43 (72) = happyShift action_29
action_43 (73) = happyShift action_30
action_43 (74) = happyShift action_14
action_43 (76) = happyShift action_31
action_43 (89) = happyShift action_32
action_43 (9) = happyGoto action_50
action_43 (10) = happyGoto action_51
action_43 (11) = happyGoto action_52
action_43 (12) = happyGoto action_22
action_43 (13) = happyGoto action_23
action_43 (23) = happyGoto action_24
action_43 (24) = happyGoto action_25
action_43 _ = happyReduce_20

action_44 (37) = happyShift action_26
action_44 (39) = happyShift action_27
action_44 (41) = happyShift action_28
action_44 (72) = happyShift action_29
action_44 (73) = happyShift action_30
action_44 (74) = happyShift action_14
action_44 (76) = happyShift action_31
action_44 (89) = happyShift action_32
action_44 (11) = happyGoto action_49
action_44 (12) = happyGoto action_22
action_44 (13) = happyGoto action_23
action_44 (23) = happyGoto action_24
action_44 (24) = happyGoto action_25
action_44 _ = happyFail

action_45 (74) = happyShift action_48
action_45 _ = happyFail

action_46 (37) = happyShift action_26
action_46 (39) = happyShift action_27
action_46 (41) = happyShift action_28
action_46 (72) = happyShift action_29
action_46 (73) = happyShift action_30
action_46 (74) = happyShift action_14
action_46 (76) = happyShift action_31
action_46 (89) = happyShift action_32
action_46 (11) = happyGoto action_47
action_46 (12) = happyGoto action_22
action_46 (13) = happyGoto action_23
action_46 (23) = happyGoto action_24
action_46 (24) = happyGoto action_25
action_46 _ = happyFail

action_47 (49) = happyShift action_64
action_47 (75) = happyShift action_66
action_47 (76) = happyShift action_67
action_47 (77) = happyShift action_68
action_47 (78) = happyShift action_69
action_47 (79) = happyShift action_70
action_47 (80) = happyShift action_71
action_47 (81) = happyShift action_72
action_47 (82) = happyShift action_73
action_47 (83) = happyShift action_74
action_47 (84) = happyShift action_75
action_47 (85) = happyShift action_76
action_47 (86) = happyShift action_77
action_47 (87) = happyShift action_78
action_47 (88) = happyShift action_79
action_47 (14) = happyGoto action_55
action_47 (15) = happyGoto action_56
action_47 (16) = happyGoto action_57
action_47 (17) = happyGoto action_58
action_47 (18) = happyGoto action_59
action_47 (19) = happyGoto action_60
action_47 (20) = happyGoto action_61
action_47 (21) = happyGoto action_62
action_47 (22) = happyGoto action_63
action_47 _ = happyReduce_4

action_48 _ = happyReduce_42

action_49 (40) = happyShift action_131
action_49 (49) = happyShift action_64
action_49 (75) = happyShift action_66
action_49 (76) = happyShift action_67
action_49 (77) = happyShift action_68
action_49 (78) = happyShift action_69
action_49 (79) = happyShift action_70
action_49 (80) = happyShift action_71
action_49 (81) = happyShift action_72
action_49 (82) = happyShift action_73
action_49 (83) = happyShift action_74
action_49 (84) = happyShift action_75
action_49 (85) = happyShift action_76
action_49 (86) = happyShift action_77
action_49 (87) = happyShift action_78
action_49 (88) = happyShift action_79
action_49 (14) = happyGoto action_55
action_49 (15) = happyGoto action_56
action_49 (16) = happyGoto action_57
action_49 (17) = happyGoto action_58
action_49 (18) = happyGoto action_59
action_49 (19) = happyGoto action_60
action_49 (20) = happyGoto action_61
action_49 (21) = happyGoto action_62
action_49 (22) = happyGoto action_63
action_49 _ = happyFail

action_50 (38) = happyShift action_130
action_50 _ = happyFail

action_51 _ = happyReduce_21

action_52 (43) = happyShift action_129
action_52 (49) = happyShift action_64
action_52 (75) = happyShift action_66
action_52 (76) = happyShift action_67
action_52 (77) = happyShift action_68
action_52 (78) = happyShift action_69
action_52 (79) = happyShift action_70
action_52 (80) = happyShift action_71
action_52 (81) = happyShift action_72
action_52 (82) = happyShift action_73
action_52 (83) = happyShift action_74
action_52 (84) = happyShift action_75
action_52 (85) = happyShift action_76
action_52 (86) = happyShift action_77
action_52 (87) = happyShift action_78
action_52 (88) = happyShift action_79
action_52 (14) = happyGoto action_55
action_52 (15) = happyGoto action_56
action_52 (16) = happyGoto action_57
action_52 (17) = happyGoto action_58
action_52 (18) = happyGoto action_59
action_52 (19) = happyGoto action_60
action_52 (20) = happyGoto action_61
action_52 (21) = happyGoto action_62
action_52 (22) = happyGoto action_63
action_52 _ = happyReduce_22

action_53 (50) = happyShift action_4
action_53 (57) = happyShift action_5
action_53 (59) = happyShift action_6
action_53 (62) = happyShift action_7
action_53 (66) = happyShift action_8
action_53 (67) = happyShift action_9
action_53 (68) = happyShift action_10
action_53 (69) = happyShift action_11
action_53 (70) = happyShift action_12
action_53 (71) = happyShift action_13
action_53 (74) = happyShift action_14
action_53 (5) = happyGoto action_128
action_53 (6) = happyGoto action_42
action_53 (13) = happyGoto action_3
action_53 _ = happyFail

action_54 _ = happyReduce_15

action_55 (37) = happyShift action_26
action_55 (39) = happyShift action_27
action_55 (41) = happyShift action_28
action_55 (72) = happyShift action_29
action_55 (73) = happyShift action_30
action_55 (74) = happyShift action_14
action_55 (76) = happyShift action_31
action_55 (89) = happyShift action_32
action_55 (11) = happyGoto action_127
action_55 (12) = happyGoto action_22
action_55 (13) = happyGoto action_23
action_55 (23) = happyGoto action_24
action_55 (24) = happyGoto action_25
action_55 _ = happyFail

action_56 (37) = happyShift action_26
action_56 (39) = happyShift action_27
action_56 (41) = happyShift action_28
action_56 (72) = happyShift action_29
action_56 (73) = happyShift action_30
action_56 (74) = happyShift action_14
action_56 (76) = happyShift action_31
action_56 (89) = happyShift action_32
action_56 (11) = happyGoto action_126
action_56 (12) = happyGoto action_22
action_56 (13) = happyGoto action_23
action_56 (23) = happyGoto action_24
action_56 (24) = happyGoto action_25
action_56 _ = happyFail

action_57 (37) = happyShift action_26
action_57 (39) = happyShift action_27
action_57 (41) = happyShift action_28
action_57 (72) = happyShift action_29
action_57 (73) = happyShift action_30
action_57 (74) = happyShift action_14
action_57 (76) = happyShift action_31
action_57 (89) = happyShift action_32
action_57 (11) = happyGoto action_125
action_57 (12) = happyGoto action_22
action_57 (13) = happyGoto action_23
action_57 (23) = happyGoto action_24
action_57 (24) = happyGoto action_25
action_57 _ = happyFail

action_58 _ = happyReduce_45

action_59 (37) = happyShift action_26
action_59 (39) = happyShift action_27
action_59 (41) = happyShift action_28
action_59 (72) = happyShift action_29
action_59 (73) = happyShift action_30
action_59 (74) = happyShift action_14
action_59 (76) = happyShift action_31
action_59 (89) = happyShift action_32
action_59 (11) = happyGoto action_124
action_59 (12) = happyGoto action_22
action_59 (13) = happyGoto action_23
action_59 (23) = happyGoto action_24
action_59 (24) = happyGoto action_25
action_59 _ = happyFail

action_60 _ = happyReduce_52

action_61 (37) = happyShift action_26
action_61 (39) = happyShift action_27
action_61 (41) = happyShift action_28
action_61 (72) = happyShift action_29
action_61 (73) = happyShift action_30
action_61 (74) = happyShift action_14
action_61 (76) = happyShift action_31
action_61 (89) = happyShift action_32
action_61 (11) = happyGoto action_123
action_61 (12) = happyGoto action_22
action_61 (13) = happyGoto action_23
action_61 (23) = happyGoto action_24
action_61 (24) = happyGoto action_25
action_61 _ = happyFail

action_62 _ = happyReduce_55

action_63 (37) = happyShift action_26
action_63 (39) = happyShift action_27
action_63 (41) = happyShift action_28
action_63 (72) = happyShift action_29
action_63 (73) = happyShift action_30
action_63 (74) = happyShift action_14
action_63 (76) = happyShift action_31
action_63 (89) = happyShift action_32
action_63 (11) = happyGoto action_122
action_63 (12) = happyGoto action_22
action_63 (13) = happyGoto action_23
action_63 (23) = happyGoto action_24
action_63 (24) = happyGoto action_25
action_63 _ = happyFail

action_64 (37) = happyShift action_26
action_64 (39) = happyShift action_27
action_64 (41) = happyShift action_28
action_64 (72) = happyShift action_29
action_64 (73) = happyShift action_30
action_64 (74) = happyShift action_14
action_64 (76) = happyShift action_31
action_64 (89) = happyShift action_32
action_64 (11) = happyGoto action_121
action_64 (12) = happyGoto action_22
action_64 (13) = happyGoto action_23
action_64 (23) = happyGoto action_24
action_64 (24) = happyGoto action_25
action_64 _ = happyFail

action_65 (50) = happyShift action_4
action_65 (57) = happyShift action_5
action_65 (59) = happyShift action_6
action_65 (62) = happyShift action_7
action_65 (66) = happyShift action_8
action_65 (67) = happyShift action_9
action_65 (68) = happyShift action_10
action_65 (69) = happyShift action_11
action_65 (70) = happyShift action_12
action_65 (71) = happyShift action_13
action_65 (74) = happyShift action_14
action_65 (6) = happyGoto action_120
action_65 (13) = happyGoto action_3
action_65 _ = happyFail

action_66 _ = happyReduce_53

action_67 _ = happyReduce_54

action_68 _ = happyReduce_56

action_69 _ = happyReduce_57

action_70 _ = happyReduce_58

action_71 _ = happyReduce_59

action_72 _ = happyReduce_46

action_73 _ = happyReduce_47

action_74 _ = happyReduce_48

action_75 _ = happyReduce_49

action_76 _ = happyReduce_50

action_77 _ = happyReduce_51

action_78 _ = happyReduce_44

action_79 _ = happyReduce_43

action_80 (46) = happyShift action_119
action_80 _ = happyFail

action_81 (37) = happyShift action_118
action_81 _ = happyFail

action_82 (37) = happyShift action_117
action_82 _ = happyFail

action_83 (46) = happyShift action_116
action_83 _ = happyFail

action_84 (51) = happyShift action_36
action_84 (56) = happyShift action_37
action_84 (61) = happyShift action_38
action_84 (65) = happyShift action_39
action_84 (28) = happyGoto action_115
action_84 (29) = happyGoto action_35
action_84 _ = happyFail

action_85 (50) = happyShift action_4
action_85 (57) = happyShift action_5
action_85 (59) = happyShift action_6
action_85 (62) = happyShift action_7
action_85 (66) = happyShift action_8
action_85 (67) = happyShift action_9
action_85 (68) = happyShift action_10
action_85 (69) = happyShift action_11
action_85 (70) = happyShift action_12
action_85 (71) = happyShift action_13
action_85 (74) = happyShift action_14
action_85 (6) = happyGoto action_114
action_85 (13) = happyGoto action_3
action_85 _ = happyFail

action_86 (37) = happyShift action_26
action_86 (39) = happyShift action_27
action_86 (41) = happyShift action_28
action_86 (72) = happyShift action_29
action_86 (73) = happyShift action_30
action_86 (74) = happyShift action_14
action_86 (76) = happyShift action_31
action_86 (89) = happyShift action_32
action_86 (11) = happyGoto action_113
action_86 (12) = happyGoto action_22
action_86 (13) = happyGoto action_23
action_86 (23) = happyGoto action_24
action_86 (24) = happyGoto action_25
action_86 _ = happyFail

action_87 (42) = happyShift action_112
action_87 _ = happyFail

action_88 _ = happyReduce_64

action_89 (43) = happyShift action_111
action_89 _ = happyReduce_65

action_90 (48) = happyShift action_110
action_90 _ = happyFail

action_91 (40) = happyShift action_109
action_91 _ = happyFail

action_92 (38) = happyShift action_108
action_92 (49) = happyShift action_64
action_92 (75) = happyShift action_66
action_92 (76) = happyShift action_67
action_92 (77) = happyShift action_68
action_92 (78) = happyShift action_69
action_92 (79) = happyShift action_70
action_92 (80) = happyShift action_71
action_92 (81) = happyShift action_72
action_92 (82) = happyShift action_73
action_92 (83) = happyShift action_74
action_92 (84) = happyShift action_75
action_92 (85) = happyShift action_76
action_92 (86) = happyShift action_77
action_92 (87) = happyShift action_78
action_92 (88) = happyShift action_79
action_92 (14) = happyGoto action_55
action_92 (15) = happyGoto action_56
action_92 (16) = happyGoto action_57
action_92 (17) = happyGoto action_58
action_92 (18) = happyGoto action_59
action_92 (19) = happyGoto action_60
action_92 (20) = happyGoto action_61
action_92 (21) = happyGoto action_62
action_92 (22) = happyGoto action_63
action_92 _ = happyFail

action_93 _ = happyReduce_35

action_94 (37) = happyShift action_26
action_94 (39) = happyShift action_27
action_94 (41) = happyShift action_28
action_94 (72) = happyShift action_29
action_94 (73) = happyShift action_30
action_94 (74) = happyShift action_14
action_94 (76) = happyShift action_31
action_94 (89) = happyShift action_32
action_94 (9) = happyGoto action_107
action_94 (10) = happyGoto action_51
action_94 (11) = happyGoto action_52
action_94 (12) = happyGoto action_22
action_94 (13) = happyGoto action_23
action_94 (23) = happyGoto action_24
action_94 (24) = happyGoto action_25
action_94 _ = happyReduce_20

action_95 (50) = happyShift action_4
action_95 (57) = happyShift action_5
action_95 (59) = happyShift action_6
action_95 (62) = happyShift action_7
action_95 (66) = happyShift action_8
action_95 (67) = happyShift action_9
action_95 (68) = happyShift action_10
action_95 (69) = happyShift action_11
action_95 (70) = happyShift action_12
action_95 (71) = happyShift action_13
action_95 (74) = happyShift action_14
action_95 (6) = happyGoto action_106
action_95 (13) = happyGoto action_3
action_95 _ = happyFail

action_96 (43) = happyShift action_105
action_96 (49) = happyShift action_64
action_96 (75) = happyShift action_66
action_96 (76) = happyShift action_67
action_96 (77) = happyShift action_68
action_96 (78) = happyShift action_69
action_96 (79) = happyShift action_70
action_96 (80) = happyShift action_71
action_96 (81) = happyShift action_72
action_96 (82) = happyShift action_73
action_96 (83) = happyShift action_74
action_96 (84) = happyShift action_75
action_96 (85) = happyShift action_76
action_96 (86) = happyShift action_77
action_96 (87) = happyShift action_78
action_96 (88) = happyShift action_79
action_96 (14) = happyGoto action_55
action_96 (15) = happyGoto action_56
action_96 (16) = happyGoto action_57
action_96 (17) = happyGoto action_58
action_96 (18) = happyGoto action_59
action_96 (19) = happyGoto action_60
action_96 (20) = happyGoto action_61
action_96 (21) = happyGoto action_62
action_96 (22) = happyGoto action_63
action_96 _ = happyFail

action_97 (38) = happyShift action_104
action_97 (49) = happyShift action_64
action_97 (75) = happyShift action_66
action_97 (76) = happyShift action_67
action_97 (77) = happyShift action_68
action_97 (78) = happyShift action_69
action_97 (79) = happyShift action_70
action_97 (80) = happyShift action_71
action_97 (81) = happyShift action_72
action_97 (82) = happyShift action_73
action_97 (83) = happyShift action_74
action_97 (84) = happyShift action_75
action_97 (85) = happyShift action_76
action_97 (86) = happyShift action_77
action_97 (87) = happyShift action_78
action_97 (88) = happyShift action_79
action_97 (14) = happyGoto action_55
action_97 (15) = happyGoto action_56
action_97 (16) = happyGoto action_57
action_97 (17) = happyGoto action_58
action_97 (18) = happyGoto action_59
action_97 (19) = happyGoto action_60
action_97 (20) = happyGoto action_61
action_97 (21) = happyGoto action_62
action_97 (22) = happyGoto action_63
action_97 _ = happyFail

action_98 (38) = happyShift action_103
action_98 (49) = happyShift action_64
action_98 (75) = happyShift action_66
action_98 (76) = happyShift action_67
action_98 (77) = happyShift action_68
action_98 (78) = happyShift action_69
action_98 (79) = happyShift action_70
action_98 (80) = happyShift action_71
action_98 (81) = happyShift action_72
action_98 (82) = happyShift action_73
action_98 (83) = happyShift action_74
action_98 (84) = happyShift action_75
action_98 (85) = happyShift action_76
action_98 (86) = happyShift action_77
action_98 (87) = happyShift action_78
action_98 (88) = happyShift action_79
action_98 (14) = happyGoto action_55
action_98 (15) = happyGoto action_56
action_98 (16) = happyGoto action_57
action_98 (17) = happyGoto action_58
action_98 (18) = happyGoto action_59
action_98 (19) = happyGoto action_60
action_98 (20) = happyGoto action_61
action_98 (21) = happyGoto action_62
action_98 (22) = happyGoto action_63
action_98 _ = happyFail

action_99 (38) = happyShift action_102
action_99 (39) = happyShift action_44
action_99 (44) = happyShift action_45
action_99 _ = happyFail

action_100 (38) = happyShift action_101
action_100 (39) = happyShift action_44
action_100 (44) = happyShift action_45
action_100 _ = happyFail

action_101 _ = happyReduce_14

action_102 _ = happyReduce_13

action_103 _ = happyReduce_12

action_104 _ = happyReduce_11

action_105 (50) = happyShift action_4
action_105 (57) = happyShift action_5
action_105 (59) = happyShift action_6
action_105 (62) = happyShift action_7
action_105 (66) = happyShift action_8
action_105 (67) = happyShift action_9
action_105 (68) = happyShift action_10
action_105 (69) = happyShift action_11
action_105 (70) = happyShift action_12
action_105 (71) = happyShift action_13
action_105 (74) = happyShift action_14
action_105 (6) = happyGoto action_151
action_105 (13) = happyGoto action_3
action_105 _ = happyFail

action_106 _ = happyReduce_7

action_107 (38) = happyShift action_150
action_107 _ = happyFail

action_108 _ = happyReduce_39

action_109 _ = happyReduce_37

action_110 (37) = happyShift action_26
action_110 (39) = happyShift action_27
action_110 (41) = happyShift action_28
action_110 (72) = happyShift action_29
action_110 (73) = happyShift action_30
action_110 (74) = happyShift action_14
action_110 (76) = happyShift action_31
action_110 (89) = happyShift action_32
action_110 (11) = happyGoto action_149
action_110 (12) = happyGoto action_22
action_110 (13) = happyGoto action_23
action_110 (23) = happyGoto action_24
action_110 (24) = happyGoto action_25
action_110 _ = happyFail

action_111 (74) = happyShift action_90
action_111 (25) = happyGoto action_148
action_111 (26) = happyGoto action_88
action_111 (27) = happyGoto action_89
action_111 _ = happyReduce_63

action_112 _ = happyReduce_38

action_113 (49) = happyShift action_64
action_113 (75) = happyShift action_66
action_113 (76) = happyShift action_67
action_113 (77) = happyShift action_68
action_113 (78) = happyShift action_69
action_113 (79) = happyShift action_70
action_113 (80) = happyShift action_71
action_113 (81) = happyShift action_72
action_113 (82) = happyShift action_73
action_113 (83) = happyShift action_74
action_113 (84) = happyShift action_75
action_113 (85) = happyShift action_76
action_113 (86) = happyShift action_77
action_113 (87) = happyShift action_78
action_113 (88) = happyShift action_79
action_113 (14) = happyGoto action_55
action_113 (15) = happyGoto action_56
action_113 (16) = happyGoto action_57
action_113 (17) = happyGoto action_58
action_113 (18) = happyGoto action_59
action_113 (19) = happyGoto action_60
action_113 (20) = happyGoto action_61
action_113 (21) = happyGoto action_62
action_113 (22) = happyGoto action_63
action_113 _ = happyReduce_8

action_114 _ = happyReduce_9

action_115 _ = happyReduce_69

action_116 (41) = happyShift action_137
action_116 (74) = happyShift action_138
action_116 (33) = happyGoto action_147
action_116 _ = happyFail

action_117 (58) = happyShift action_142
action_117 (60) = happyShift action_143
action_117 (65) = happyShift action_144
action_117 (74) = happyShift action_145
action_117 (30) = happyGoto action_146
action_117 (31) = happyGoto action_140
action_117 (32) = happyGoto action_141
action_117 _ = happyReduce_75

action_118 (58) = happyShift action_142
action_118 (60) = happyShift action_143
action_118 (65) = happyShift action_144
action_118 (74) = happyShift action_145
action_118 (30) = happyGoto action_139
action_118 (31) = happyGoto action_140
action_118 (32) = happyGoto action_141
action_118 _ = happyReduce_75

action_119 (41) = happyShift action_137
action_119 (74) = happyShift action_138
action_119 (33) = happyGoto action_136
action_119 _ = happyFail

action_120 (54) = happyShift action_135
action_120 (8) = happyGoto action_134
action_120 _ = happyReduce_18

action_121 (46) = happyShift action_133
action_121 (49) = happyShift action_64
action_121 (75) = happyShift action_66
action_121 (76) = happyShift action_67
action_121 (77) = happyShift action_68
action_121 (78) = happyShift action_69
action_121 (79) = happyShift action_70
action_121 (80) = happyShift action_71
action_121 (81) = happyShift action_72
action_121 (82) = happyShift action_73
action_121 (83) = happyShift action_74
action_121 (84) = happyShift action_75
action_121 (85) = happyShift action_76
action_121 (86) = happyShift action_77
action_121 (87) = happyShift action_78
action_121 (88) = happyShift action_79
action_121 (14) = happyGoto action_55
action_121 (15) = happyGoto action_56
action_121 (16) = happyGoto action_57
action_121 (17) = happyGoto action_58
action_121 (18) = happyGoto action_59
action_121 (19) = happyGoto action_60
action_121 (20) = happyGoto action_61
action_121 (21) = happyGoto action_62
action_121 (22) = happyGoto action_63
action_121 _ = happyFail

action_122 (79) = happyShift action_70
action_122 (80) = happyShift action_71
action_122 (14) = happyGoto action_55
action_122 (15) = happyGoto action_56
action_122 (16) = happyGoto action_57
action_122 (17) = happyGoto action_58
action_122 (18) = happyGoto action_59
action_122 (19) = happyGoto action_60
action_122 (20) = happyGoto action_61
action_122 (21) = happyGoto action_62
action_122 (22) = happyGoto action_63
action_122 _ = happyReduce_31

action_123 (79) = happyShift action_70
action_123 (80) = happyShift action_71
action_123 (14) = happyGoto action_55
action_123 (15) = happyGoto action_56
action_123 (16) = happyGoto action_57
action_123 (17) = happyGoto action_58
action_123 (18) = happyGoto action_59
action_123 (19) = happyGoto action_60
action_123 (20) = happyGoto action_61
action_123 (21) = happyGoto action_62
action_123 (22) = happyGoto action_63
action_123 _ = happyReduce_30

action_124 (77) = happyShift action_68
action_124 (78) = happyShift action_69
action_124 (79) = happyShift action_70
action_124 (80) = happyShift action_71
action_124 (14) = happyGoto action_55
action_124 (15) = happyGoto action_56
action_124 (16) = happyGoto action_57
action_124 (17) = happyGoto action_58
action_124 (18) = happyGoto action_59
action_124 (19) = happyGoto action_60
action_124 (20) = happyGoto action_61
action_124 (21) = happyGoto action_62
action_124 (22) = happyGoto action_63
action_124 _ = happyReduce_29

action_125 (75) = happyShift action_66
action_125 (76) = happyShift action_67
action_125 (77) = happyShift action_68
action_125 (78) = happyShift action_69
action_125 (79) = happyShift action_70
action_125 (80) = happyShift action_71
action_125 (81) = happyFail
action_125 (82) = happyFail
action_125 (83) = happyFail
action_125 (84) = happyFail
action_125 (85) = happyFail
action_125 (86) = happyFail
action_125 (14) = happyGoto action_55
action_125 (15) = happyGoto action_56
action_125 (16) = happyGoto action_57
action_125 (17) = happyGoto action_58
action_125 (18) = happyGoto action_59
action_125 (19) = happyGoto action_60
action_125 (20) = happyGoto action_61
action_125 (21) = happyGoto action_62
action_125 (22) = happyGoto action_63
action_125 _ = happyReduce_28

action_126 (75) = happyShift action_66
action_126 (76) = happyShift action_67
action_126 (77) = happyShift action_68
action_126 (78) = happyShift action_69
action_126 (79) = happyShift action_70
action_126 (80) = happyShift action_71
action_126 (81) = happyShift action_72
action_126 (82) = happyShift action_73
action_126 (83) = happyShift action_74
action_126 (84) = happyShift action_75
action_126 (85) = happyShift action_76
action_126 (86) = happyShift action_77
action_126 (14) = happyGoto action_55
action_126 (15) = happyGoto action_56
action_126 (16) = happyGoto action_57
action_126 (17) = happyGoto action_58
action_126 (18) = happyGoto action_59
action_126 (19) = happyGoto action_60
action_126 (20) = happyGoto action_61
action_126 (21) = happyGoto action_62
action_126 (22) = happyGoto action_63
action_126 _ = happyReduce_27

action_127 (75) = happyShift action_66
action_127 (76) = happyShift action_67
action_127 (77) = happyShift action_68
action_127 (78) = happyShift action_69
action_127 (79) = happyShift action_70
action_127 (80) = happyShift action_71
action_127 (81) = happyShift action_72
action_127 (82) = happyShift action_73
action_127 (83) = happyShift action_74
action_127 (84) = happyShift action_75
action_127 (85) = happyShift action_76
action_127 (86) = happyShift action_77
action_127 (87) = happyShift action_78
action_127 (14) = happyGoto action_55
action_127 (15) = happyGoto action_56
action_127 (16) = happyGoto action_57
action_127 (17) = happyGoto action_58
action_127 (18) = happyGoto action_59
action_127 (19) = happyGoto action_60
action_127 (20) = happyGoto action_61
action_127 (21) = happyGoto action_62
action_127 (22) = happyGoto action_63
action_127 _ = happyReduce_26

action_128 _ = happyReduce_3

action_129 (37) = happyShift action_26
action_129 (39) = happyShift action_27
action_129 (41) = happyShift action_28
action_129 (72) = happyShift action_29
action_129 (73) = happyShift action_30
action_129 (74) = happyShift action_14
action_129 (76) = happyShift action_31
action_129 (89) = happyShift action_32
action_129 (9) = happyGoto action_132
action_129 (10) = happyGoto action_51
action_129 (11) = happyGoto action_52
action_129 (12) = happyGoto action_22
action_129 (13) = happyGoto action_23
action_129 (23) = happyGoto action_24
action_129 (24) = happyGoto action_25
action_129 _ = happyReduce_20

action_130 _ = happyReduce_5

action_131 _ = happyReduce_41

action_132 _ = happyReduce_23

action_133 (37) = happyShift action_26
action_133 (39) = happyShift action_27
action_133 (41) = happyShift action_28
action_133 (72) = happyShift action_29
action_133 (73) = happyShift action_30
action_133 (74) = happyShift action_14
action_133 (76) = happyShift action_31
action_133 (89) = happyShift action_32
action_133 (11) = happyGoto action_170
action_133 (12) = happyGoto action_22
action_133 (13) = happyGoto action_23
action_133 (23) = happyGoto action_24
action_133 (24) = happyGoto action_25
action_133 _ = happyFail

action_134 (53) = happyShift action_169
action_134 (7) = happyGoto action_168
action_134 _ = happyReduce_16

action_135 (37) = happyShift action_26
action_135 (39) = happyShift action_27
action_135 (41) = happyShift action_28
action_135 (72) = happyShift action_29
action_135 (73) = happyShift action_30
action_135 (74) = happyShift action_14
action_135 (76) = happyShift action_31
action_135 (89) = happyShift action_32
action_135 (11) = happyGoto action_167
action_135 (12) = happyGoto action_22
action_135 (13) = happyGoto action_23
action_135 (23) = happyGoto action_24
action_135 (24) = happyGoto action_25
action_135 _ = happyFail

action_136 (39) = happyShift action_153
action_136 (47) = happyShift action_166
action_136 _ = happyReduce_71

action_137 (74) = happyShift action_165
action_137 (34) = happyGoto action_162
action_137 (35) = happyGoto action_163
action_137 (36) = happyGoto action_164
action_137 _ = happyReduce_86

action_138 _ = happyReduce_83

action_139 (38) = happyShift action_161
action_139 _ = happyFail

action_140 _ = happyReduce_76

action_141 (43) = happyShift action_160
action_141 _ = happyReduce_77

action_142 (74) = happyShift action_159
action_142 _ = happyFail

action_143 (74) = happyShift action_158
action_143 _ = happyFail

action_144 (74) = happyShift action_157
action_144 _ = happyFail

action_145 (46) = happyShift action_156
action_145 _ = happyFail

action_146 (38) = happyShift action_155
action_146 _ = happyFail

action_147 (39) = happyShift action_153
action_147 (48) = happyShift action_154
action_147 _ = happyFail

action_148 _ = happyReduce_66

action_149 (49) = happyShift action_64
action_149 (75) = happyShift action_66
action_149 (76) = happyShift action_67
action_149 (77) = happyShift action_68
action_149 (78) = happyShift action_69
action_149 (79) = happyShift action_70
action_149 (80) = happyShift action_71
action_149 (81) = happyShift action_72
action_149 (82) = happyShift action_73
action_149 (83) = happyShift action_74
action_149 (84) = happyShift action_75
action_149 (85) = happyShift action_76
action_149 (86) = happyShift action_77
action_149 (87) = happyShift action_78
action_149 (88) = happyShift action_79
action_149 (14) = happyGoto action_55
action_149 (15) = happyGoto action_56
action_149 (16) = happyGoto action_57
action_149 (17) = happyGoto action_58
action_149 (18) = happyGoto action_59
action_149 (19) = happyGoto action_60
action_149 (20) = happyGoto action_61
action_149 (21) = happyGoto action_62
action_149 (22) = happyGoto action_63
action_149 _ = happyReduce_67

action_150 _ = happyReduce_36

action_151 (38) = happyShift action_152
action_151 _ = happyFail

action_152 _ = happyReduce_10

action_153 (72) = happyShift action_185
action_153 _ = happyFail

action_154 (37) = happyShift action_26
action_154 (39) = happyShift action_27
action_154 (41) = happyShift action_28
action_154 (72) = happyShift action_29
action_154 (73) = happyShift action_30
action_154 (74) = happyShift action_14
action_154 (76) = happyShift action_31
action_154 (89) = happyShift action_32
action_154 (11) = happyGoto action_184
action_154 (12) = happyGoto action_22
action_154 (13) = happyGoto action_23
action_154 (23) = happyGoto action_24
action_154 (24) = happyGoto action_25
action_154 _ = happyFail

action_155 (46) = happyShift action_183
action_155 _ = happyFail

action_156 (41) = happyShift action_137
action_156 (74) = happyShift action_138
action_156 (33) = happyGoto action_182
action_156 _ = happyFail

action_157 (46) = happyShift action_181
action_157 _ = happyFail

action_158 (46) = happyShift action_180
action_158 _ = happyFail

action_159 (46) = happyShift action_179
action_159 _ = happyFail

action_160 (58) = happyShift action_142
action_160 (60) = happyShift action_143
action_160 (65) = happyShift action_144
action_160 (74) = happyShift action_145
action_160 (31) = happyGoto action_178
action_160 (32) = happyGoto action_141
action_160 _ = happyFail

action_161 (50) = happyShift action_4
action_161 (57) = happyShift action_5
action_161 (59) = happyShift action_6
action_161 (62) = happyShift action_7
action_161 (66) = happyShift action_8
action_161 (67) = happyShift action_9
action_161 (68) = happyShift action_10
action_161 (69) = happyShift action_11
action_161 (70) = happyShift action_12
action_161 (71) = happyShift action_13
action_161 (74) = happyShift action_14
action_161 (6) = happyGoto action_177
action_161 (13) = happyGoto action_3
action_161 _ = happyFail

action_162 (42) = happyShift action_176
action_162 _ = happyFail

action_163 _ = happyReduce_87

action_164 (43) = happyShift action_175
action_164 _ = happyReduce_88

action_165 (46) = happyShift action_174
action_165 _ = happyFail

action_166 (37) = happyShift action_26
action_166 (39) = happyShift action_27
action_166 (41) = happyShift action_28
action_166 (72) = happyShift action_29
action_166 (73) = happyShift action_30
action_166 (74) = happyShift action_14
action_166 (76) = happyShift action_31
action_166 (89) = happyShift action_32
action_166 (11) = happyGoto action_173
action_166 (12) = happyGoto action_22
action_166 (13) = happyGoto action_23
action_166 (23) = happyGoto action_24
action_166 (24) = happyGoto action_25
action_166 _ = happyFail

action_167 (49) = happyShift action_64
action_167 (63) = happyShift action_172
action_167 (75) = happyShift action_66
action_167 (76) = happyShift action_67
action_167 (77) = happyShift action_68
action_167 (78) = happyShift action_69
action_167 (79) = happyShift action_70
action_167 (80) = happyShift action_71
action_167 (81) = happyShift action_72
action_167 (82) = happyShift action_73
action_167 (83) = happyShift action_74
action_167 (84) = happyShift action_75
action_167 (85) = happyShift action_76
action_167 (86) = happyShift action_77
action_167 (87) = happyShift action_78
action_167 (88) = happyShift action_79
action_167 (14) = happyGoto action_55
action_167 (15) = happyGoto action_56
action_167 (16) = happyGoto action_57
action_167 (17) = happyGoto action_58
action_167 (18) = happyGoto action_59
action_167 (19) = happyGoto action_60
action_167 (20) = happyGoto action_61
action_167 (21) = happyGoto action_62
action_167 (22) = happyGoto action_63
action_167 _ = happyFail

action_168 _ = happyReduce_6

action_169 (50) = happyShift action_4
action_169 (57) = happyShift action_5
action_169 (59) = happyShift action_6
action_169 (62) = happyShift action_7
action_169 (66) = happyShift action_8
action_169 (67) = happyShift action_9
action_169 (68) = happyShift action_10
action_169 (69) = happyShift action_11
action_169 (70) = happyShift action_12
action_169 (71) = happyShift action_13
action_169 (74) = happyShift action_14
action_169 (6) = happyGoto action_171
action_169 (13) = happyGoto action_3
action_169 _ = happyFail

action_170 (49) = happyShift action_64
action_170 (75) = happyShift action_66
action_170 (76) = happyShift action_67
action_170 (77) = happyShift action_68
action_170 (78) = happyShift action_69
action_170 (79) = happyShift action_70
action_170 (80) = happyShift action_71
action_170 (81) = happyShift action_72
action_170 (82) = happyShift action_73
action_170 (83) = happyShift action_74
action_170 (84) = happyShift action_75
action_170 (85) = happyShift action_76
action_170 (86) = happyShift action_77
action_170 (87) = happyShift action_78
action_170 (88) = happyShift action_79
action_170 (14) = happyGoto action_55
action_170 (15) = happyGoto action_56
action_170 (16) = happyGoto action_57
action_170 (17) = happyGoto action_58
action_170 (18) = happyGoto action_59
action_170 (19) = happyGoto action_60
action_170 (20) = happyGoto action_61
action_170 (21) = happyGoto action_62
action_170 (22) = happyGoto action_63
action_170 _ = happyReduce_25

action_171 _ = happyReduce_17

action_172 (50) = happyShift action_4
action_172 (57) = happyShift action_5
action_172 (59) = happyShift action_6
action_172 (62) = happyShift action_7
action_172 (66) = happyShift action_8
action_172 (67) = happyShift action_9
action_172 (68) = happyShift action_10
action_172 (69) = happyShift action_11
action_172 (70) = happyShift action_12
action_172 (71) = happyShift action_13
action_172 (74) = happyShift action_14
action_172 (6) = happyGoto action_193
action_172 (13) = happyGoto action_3
action_172 _ = happyFail

action_173 (49) = happyShift action_64
action_173 (75) = happyShift action_66
action_173 (76) = happyShift action_67
action_173 (77) = happyShift action_68
action_173 (78) = happyShift action_69
action_173 (79) = happyShift action_70
action_173 (80) = happyShift action_71
action_173 (81) = happyShift action_72
action_173 (82) = happyShift action_73
action_173 (83) = happyShift action_74
action_173 (84) = happyShift action_75
action_173 (85) = happyShift action_76
action_173 (86) = happyShift action_77
action_173 (87) = happyShift action_78
action_173 (88) = happyShift action_79
action_173 (14) = happyGoto action_55
action_173 (15) = happyGoto action_56
action_173 (16) = happyGoto action_57
action_173 (17) = happyGoto action_58
action_173 (18) = happyGoto action_59
action_173 (19) = happyGoto action_60
action_173 (20) = happyGoto action_61
action_173 (21) = happyGoto action_62
action_173 (22) = happyGoto action_63
action_173 _ = happyReduce_72

action_174 (41) = happyShift action_137
action_174 (74) = happyShift action_138
action_174 (33) = happyGoto action_192
action_174 _ = happyFail

action_175 (74) = happyShift action_165
action_175 (35) = happyGoto action_191
action_175 (36) = happyGoto action_164
action_175 _ = happyFail

action_176 _ = happyReduce_85

action_177 _ = happyReduce_74

action_178 _ = happyReduce_78

action_179 (41) = happyShift action_137
action_179 (74) = happyShift action_138
action_179 (33) = happyGoto action_190
action_179 _ = happyFail

action_180 (41) = happyShift action_137
action_180 (74) = happyShift action_138
action_180 (33) = happyGoto action_189
action_180 _ = happyFail

action_181 (41) = happyShift action_137
action_181 (74) = happyShift action_138
action_181 (33) = happyGoto action_188
action_181 _ = happyFail

action_182 (39) = happyShift action_153
action_182 _ = happyReduce_79

action_183 (41) = happyShift action_137
action_183 (74) = happyShift action_138
action_183 (33) = happyGoto action_187
action_183 _ = happyFail

action_184 (49) = happyShift action_64
action_184 (75) = happyShift action_66
action_184 (76) = happyShift action_67
action_184 (77) = happyShift action_68
action_184 (78) = happyShift action_69
action_184 (79) = happyShift action_70
action_184 (80) = happyShift action_71
action_184 (81) = happyShift action_72
action_184 (82) = happyShift action_73
action_184 (83) = happyShift action_74
action_184 (84) = happyShift action_75
action_184 (85) = happyShift action_76
action_184 (86) = happyShift action_77
action_184 (87) = happyShift action_78
action_184 (88) = happyShift action_79
action_184 (14) = happyGoto action_55
action_184 (15) = happyGoto action_56
action_184 (16) = happyGoto action_57
action_184 (17) = happyGoto action_58
action_184 (18) = happyGoto action_59
action_184 (19) = happyGoto action_60
action_184 (20) = happyGoto action_61
action_184 (21) = happyGoto action_62
action_184 (22) = happyGoto action_63
action_184 _ = happyReduce_70

action_185 (40) = happyShift action_186
action_185 _ = happyFail

action_186 _ = happyReduce_84

action_187 (39) = happyShift action_153
action_187 (48) = happyShift action_195
action_187 _ = happyFail

action_188 (39) = happyShift action_153
action_188 _ = happyReduce_82

action_189 (39) = happyShift action_153
action_189 _ = happyReduce_81

action_190 (39) = happyShift action_153
action_190 _ = happyReduce_80

action_191 _ = happyReduce_89

action_192 (39) = happyShift action_153
action_192 _ = happyReduce_90

action_193 (54) = happyShift action_135
action_193 (8) = happyGoto action_194
action_193 _ = happyReduce_18

action_194 _ = happyReduce_19

action_195 (37) = happyShift action_26
action_195 (39) = happyShift action_27
action_195 (41) = happyShift action_28
action_195 (72) = happyShift action_29
action_195 (73) = happyShift action_30
action_195 (74) = happyShift action_14
action_195 (76) = happyShift action_31
action_195 (89) = happyShift action_32
action_195 (11) = happyGoto action_196
action_195 (12) = happyGoto action_22
action_195 (13) = happyGoto action_23
action_195 (23) = happyGoto action_24
action_195 (24) = happyGoto action_25
action_195 _ = happyFail

action_196 (49) = happyShift action_64
action_196 (75) = happyShift action_66
action_196 (76) = happyShift action_67
action_196 (77) = happyShift action_68
action_196 (78) = happyShift action_69
action_196 (79) = happyShift action_70
action_196 (80) = happyShift action_71
action_196 (81) = happyShift action_72
action_196 (82) = happyShift action_73
action_196 (83) = happyShift action_74
action_196 (84) = happyShift action_75
action_196 (85) = happyShift action_76
action_196 (86) = happyShift action_77
action_196 (87) = happyShift action_78
action_196 (88) = happyShift action_79
action_196 (14) = happyGoto action_55
action_196 (15) = happyGoto action_56
action_196 (16) = happyGoto action_57
action_196 (17) = happyGoto action_58
action_196 (18) = happyGoto action_59
action_196 (19) = happyGoto action_60
action_196 (20) = happyGoto action_61
action_196 (21) = happyGoto action_62
action_196 (22) = happyGoto action_63
action_196 _ = happyReduce_73

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (AST happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 : happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  6 happyReduction_4
happyReduction_4 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (CmdAssign {caVar = happy_var_1, caVal=happy_var_3, cmdSrcPos = srcPos happy_var_1}
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happyReduce 4 6 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CmdCall {ccProc = happy_var_1, ccArgs = happy_var_3, cmdSrcPos = srcPos happy_var_1}
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 6 6 happyReduction_6
happyReduction_6 ((HappyAbsSyn7  happy_var_6) `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	(HappyTerminal ((If, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CmdIf {ciCondThens = (happy_var_2,happy_var_4) : happy_var_5, ciMbElse = happy_var_6, cmdSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 4 6 happyReduction_7
happyReduction_7 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	(HappyTerminal ((While, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CmdWhile {cwCond = happy_var_2, cwBody = happy_var_4, cmdSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 4 6 happyReduction_8
happyReduction_8 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	(HappyTerminal ((Repeat, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CmdRepeat {crBody = happy_var_2, crCond = happy_var_4, cmdSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 4 6 happyReduction_9
happyReduction_9 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn28  happy_var_2) `HappyStk`
	(HappyTerminal ((Let, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CmdLet {clDecls = happy_var_2, clBody = happy_var_4, cmdSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 6 6 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal ((ThreadStart, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CmdThreadStart {ctsId = happy_var_3, ctsCmds = happy_var_5, cmdSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 4 6 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal ((ThreadCancel, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CmdThreadCancel {ctcId = happy_var_3, cmdSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 4 6 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal ((ThreadWait, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CmdThreadWait {ctwId = happy_var_3, cmdSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 6 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal ((ThreadLock, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CmdThreadLock {ctlLock = happy_var_3, cmdSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 4 6 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal ((ThreadUnlock, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CmdThreadUnlock {ctuUnlock = happy_var_3, cmdSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_3  6 happyReduction_15
happyReduction_15 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (if length happy_var_2 == 1 then
              head happy_var_2
          else
              CmdSeq {csCmds = happy_var_2, cmdSrcPos = srcPos happy_var_2}
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_0  7 happyReduction_16
happyReduction_16  =  HappyAbsSyn7
		 (Nothing
	)

happyReduce_17 = happySpecReduce_2  7 happyReduction_17
happyReduction_17 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Just happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_0  8 happyReduction_18
happyReduction_18  =  HappyAbsSyn8
		 ([]
	)

happyReduce_19 = happyReduce 5 8 happyReduction_19
happyReduction_19 ((HappyAbsSyn8  happy_var_5) `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 ((happy_var_2,happy_var_4) : happy_var_5
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_0  9 happyReduction_20
happyReduction_20  =  HappyAbsSyn9
		 ([]
	)

happyReduce_21 = happySpecReduce_1  9 happyReduction_21
happyReduction_21 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  10 happyReduction_22
happyReduction_22 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  10 happyReduction_23
happyReduction_23 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  11 happyReduction_24
happyReduction_24 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happyReduce 5 11 happyReduction_25
happyReduction_25 ((HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (ExpCond {ecCond    = happy_var_1,
                   ecTrue    = happy_var_3,
                   ecFalse   = happy_var_5,
                   expSrcPos = srcPos happy_var_1}
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_3  11 happyReduction_26
happyReduction_26 (HappyAbsSyn11  happy_var_3)
	(HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpApp {eaFun     = happy_var_2,
                  eaArgs    = [happy_var_1,happy_var_3],
                  expSrcPos = srcPos happy_var_1}
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  11 happyReduction_27
happyReduction_27 (HappyAbsSyn11  happy_var_3)
	(HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpApp {eaFun     = happy_var_2,
                  eaArgs    = [happy_var_1,happy_var_3],
                  expSrcPos = srcPos happy_var_1}
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  11 happyReduction_28
happyReduction_28 (HappyAbsSyn11  happy_var_3)
	(HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpApp {eaFun     = happy_var_2,
                  eaArgs    = [happy_var_1,happy_var_3],
                  expSrcPos = srcPos happy_var_1}
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  11 happyReduction_29
happyReduction_29 (HappyAbsSyn11  happy_var_3)
	(HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpApp {eaFun     = happy_var_2,
                  eaArgs    = [happy_var_1,happy_var_3],
                  expSrcPos = srcPos happy_var_1}
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  11 happyReduction_30
happyReduction_30 (HappyAbsSyn11  happy_var_3)
	(HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpApp {eaFun     = happy_var_2,
                  eaArgs    = [happy_var_1,happy_var_3],
                  expSrcPos = srcPos happy_var_1}
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  11 happyReduction_31
happyReduction_31 (HappyAbsSyn11  happy_var_3)
	(HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpApp {eaFun     = happy_var_2,
                  eaArgs    = [happy_var_1,happy_var_3],
                  expSrcPos = srcPos happy_var_1}
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  12 happyReduction_32
happyReduction_32 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn11
		 (ExpLitInt {eliVal = tspLIVal happy_var_1, expSrcPos = tspSrcPos happy_var_1}
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  12 happyReduction_33
happyReduction_33 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn11
		 (ExpLitChr {elcVal = tspLCVal happy_var_1, expSrcPos = tspSrcPos happy_var_1}
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  12 happyReduction_34
happyReduction_34 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_2  12 happyReduction_35
happyReduction_35 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpApp {eaFun = happy_var_1, eaArgs = [happy_var_2], expSrcPos = srcPos happy_var_1}
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happyReduce 4 12 happyReduction_36
happyReduction_36 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (ExpApp {eaFun = happy_var_1, eaArgs = happy_var_3, expSrcPos = srcPos happy_var_1}
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_3  12 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn9  happy_var_2)
	(HappyTerminal ((LBrk, happy_var_1)))
	 =  HappyAbsSyn11
		 (ExpAry {eaElts = happy_var_2, expSrcPos = happy_var_1}
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  12 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn25  happy_var_2)
	(HappyTerminal ((LBrc, happy_var_1)))
	 =  HappyAbsSyn11
		 (ExpRcd {erFldDefs = happy_var_2, expSrcPos = happy_var_1}
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  12 happyReduction_39
happyReduction_39 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  13 happyReduction_40
happyReduction_40 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn11
		 (ExpVar {evVar = tspIdName happy_var_1, expSrcPos = tspSrcPos happy_var_1}
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happyReduce 4 13 happyReduction_41
happyReduction_41 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (ExpIx {eiAry = happy_var_1, eiIx = happy_var_3, expSrcPos = srcPos happy_var_1}
	) `HappyStk` happyRest

happyReduce_42 = happySpecReduce_3  13 happyReduction_42
happyReduction_42 (HappyTerminal happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpPrj {epRcd = happy_var_1, epFld = tspIdName happy_var_3, expSrcPos = srcPos happy_var_1}
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  14 happyReduction_43
happyReduction_43 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn11
		 (mkExpVarBinOp happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  15 happyReduction_44
happyReduction_44 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn11
		 (mkExpVarBinOp happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  16 happyReduction_45
happyReduction_45 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn11
		 (mkExpVarBinOp happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  17 happyReduction_46
happyReduction_46 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  17 happyReduction_47
happyReduction_47 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  17 happyReduction_48
happyReduction_48 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  17 happyReduction_49
happyReduction_49 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_1  17 happyReduction_50
happyReduction_50 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_50 _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  17 happyReduction_51
happyReduction_51 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  18 happyReduction_52
happyReduction_52 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn11
		 (mkExpVarBinOp happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_1  19 happyReduction_53
happyReduction_53 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  19 happyReduction_54
happyReduction_54 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  20 happyReduction_55
happyReduction_55 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn11
		 (mkExpVarBinOp happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  21 happyReduction_56
happyReduction_56 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  21 happyReduction_57
happyReduction_57 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  21 happyReduction_58
happyReduction_58 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  22 happyReduction_59
happyReduction_59 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn11
		 (mkExpVarBinOp happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  23 happyReduction_60
happyReduction_60 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn11
		 (mkExpVarUnOp happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  24 happyReduction_61
happyReduction_61 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn24
		 (happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  24 happyReduction_62
happyReduction_62 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn24
		 (happy_var_1
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_0  25 happyReduction_63
happyReduction_63  =  HappyAbsSyn25
		 ([]
	)

happyReduce_64 = happySpecReduce_1  25 happyReduction_64
happyReduction_64 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  26 happyReduction_65
happyReduction_65 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn25
		 ([happy_var_1]
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  26 happyReduction_66
happyReduction_66 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1 : happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  27 happyReduction_67
happyReduction_67 (HappyAbsSyn11  happy_var_3)
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn27
		 ((tspIdName happy_var_1, happy_var_3)
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  28 happyReduction_68
happyReduction_68 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 ([happy_var_1]
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  28 happyReduction_69
happyReduction_69 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (happy_var_1 : happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happyReduce 6 29 happyReduction_70
happyReduction_70 ((HappyAbsSyn11  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn33  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	(HappyTerminal ((Const, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn29
		 (DeclConst {dcConst = tspIdName happy_var_2, dcType = happy_var_4, dcVal = happy_var_6,
                     declSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_71 = happyReduce 4 29 happyReduction_71
happyReduction_71 ((HappyAbsSyn33  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	(HappyTerminal ((Var, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn29
		 (DeclVar {dvVar = tspIdName happy_var_2, dvType = happy_var_4, dvMbVal = Nothing,
          declSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_72 = happyReduce 6 29 happyReduction_72
happyReduction_72 ((HappyAbsSyn11  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn33  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	(HappyTerminal ((Var, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn29
		 (DeclVar {dvVar = tspIdName happy_var_2, dvType = happy_var_4, dvMbVal = Just happy_var_6,
          declSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_73 = happyReduce 9 29 happyReduction_73
happyReduction_73 ((HappyAbsSyn11  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn33  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn30  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	(HappyTerminal ((Fun, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn29
		 (DeclFun {dfFun = tspIdName happy_var_2, dfArgDecls = happy_var_4, dfType = happy_var_7,
                   dfBody = happy_var_9, declSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_74 = happyReduce 6 29 happyReduction_74
happyReduction_74 ((HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn30  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	(HappyTerminal ((Proc, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn29
		 (DeclProc {dpProc = tspIdName happy_var_2, dpArgDecls = happy_var_4, dpBody = happy_var_6,
                    declSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_75 = happySpecReduce_0  30 happyReduction_75
happyReduction_75  =  HappyAbsSyn30
		 ([]
	)

happyReduce_76 = happySpecReduce_1  30 happyReduction_76
happyReduction_76 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (happy_var_1
	)
happyReduction_76 _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_1  31 happyReduction_77
happyReduction_77 (HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn30
		 ([happy_var_1]
	)
happyReduction_77 _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_3  31 happyReduction_78
happyReduction_78 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn30
		 (happy_var_1 : happy_var_3
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_3  32 happyReduction_79
happyReduction_79 (HappyAbsSyn33  happy_var_3)
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn32
		 (ArgDecl {adArg = tspIdName happy_var_1, adArgMode = ByValue, adType = happy_var_3,
                   adSrcPos = tspSrcPos happy_var_1}
	)
happyReduction_79 _ _ _  = notHappyAtAll 

happyReduce_80 = happyReduce 4 32 happyReduction_80
happyReduction_80 ((HappyAbsSyn33  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	(HappyTerminal ((In, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn32
		 (ArgDecl {adArg = tspIdName happy_var_2, adArgMode = ByRefIn, adType = happy_var_4,
                   adSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_81 = happyReduce 4 32 happyReduction_81
happyReduction_81 ((HappyAbsSyn33  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	(HappyTerminal ((Out, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn32
		 (ArgDecl {adArg = tspIdName happy_var_2, adArgMode = ByRefOut, adType = happy_var_4,
                   adSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_82 = happyReduce 4 32 happyReduction_82
happyReduction_82 ((HappyAbsSyn33  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	(HappyTerminal ((Var, happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn32
		 (ArgDecl {adArg = tspIdName happy_var_2, adArgMode = ByRefVar, adType = happy_var_4,
                   adSrcPos = happy_var_1}
	) `HappyStk` happyRest

happyReduce_83 = happySpecReduce_1  33 happyReduction_83
happyReduction_83 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn33
		 (TDBaseType { tdbtName = tspIdName happy_var_1, tdSrcPos = tspSrcPos happy_var_1 }
	)
happyReduction_83 _  = notHappyAtAll 

happyReduce_84 = happyReduce 4 33 happyReduction_84
happyReduction_84 (_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn33  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn33
		 (TDArray { tdaEltType = happy_var_1, tdaSize = tspLIVal happy_var_3,
                    tdSrcPos = srcPos happy_var_1 }
	) `HappyStk` happyRest

happyReduce_85 = happySpecReduce_3  33 happyReduction_85
happyReduction_85 _
	(HappyAbsSyn34  happy_var_2)
	(HappyTerminal ((LBrc, happy_var_1)))
	 =  HappyAbsSyn33
		 (TDRecord { tdrFldTypes = happy_var_2, tdSrcPos = happy_var_1 }
	)
happyReduction_85 _ _ _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_0  34 happyReduction_86
happyReduction_86  =  HappyAbsSyn34
		 ([]
	)

happyReduce_87 = happySpecReduce_1  34 happyReduction_87
happyReduction_87 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (happy_var_1
	)
happyReduction_87 _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_1  35 happyReduction_88
happyReduction_88 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn34
		 ([happy_var_1]
	)
happyReduction_88 _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_3  35 happyReduction_89
happyReduction_89 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn34
		 (happy_var_1 : happy_var_3
	)
happyReduction_89 _ _ _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_3  36 happyReduction_90
happyReduction_90 (HappyAbsSyn33  happy_var_3)
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn36
		 ((tspIdName happy_var_1, happy_var_3)
	)
happyReduction_90 _ _ _  = notHappyAtAll 

happyNewToken action sts stk
	= scanner(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	(EOF, _) -> action 90 90 tk (HappyState action) sts stk;
	(LPar, happy_dollar_dollar) -> cont 37;
	(RPar, happy_dollar_dollar) -> cont 38;
	(LBrk, happy_dollar_dollar) -> cont 39;
	(RBrk, happy_dollar_dollar) -> cont 40;
	(LBrc, happy_dollar_dollar) -> cont 41;
	(RBrc, happy_dollar_dollar) -> cont 42;
	(Comma, happy_dollar_dollar) -> cont 43;
	(Period, happy_dollar_dollar) -> cont 44;
	(Semicol, happy_dollar_dollar) -> cont 45;
	(Colon, happy_dollar_dollar) -> cont 46;
	(ColEq, happy_dollar_dollar) -> cont 47;
	(Equals, happy_dollar_dollar) -> cont 48;
	(Cond, happy_dollar_dollar) -> cont 49;
	(Begin, happy_dollar_dollar) -> cont 50;
	(Const, happy_dollar_dollar) -> cont 51;
	(Do, happy_dollar_dollar) -> cont 52;
	(Else, happy_dollar_dollar) -> cont 53;
	(Elsif, happy_dollar_dollar) -> cont 54;
	(End, happy_dollar_dollar) -> cont 55;
	(Fun, happy_dollar_dollar) -> cont 56;
	(If, happy_dollar_dollar) -> cont 57;
	(In, happy_dollar_dollar) -> cont 58;
	(Let, happy_dollar_dollar) -> cont 59;
	(Out, happy_dollar_dollar) -> cont 60;
	(Proc, happy_dollar_dollar) -> cont 61;
	(Repeat, happy_dollar_dollar) -> cont 62;
	(Then, happy_dollar_dollar) -> cont 63;
	(Until, happy_dollar_dollar) -> cont 64;
	(Var, happy_dollar_dollar) -> cont 65;
	(While, happy_dollar_dollar) -> cont 66;
	(ThreadStart, happy_dollar_dollar) -> cont 67;
	(ThreadCancel, happy_dollar_dollar) -> cont 68;
	(ThreadWait, happy_dollar_dollar) -> cont 69;
	(ThreadLock, happy_dollar_dollar) -> cont 70;
	(ThreadUnlock, happy_dollar_dollar) -> cont 71;
	(LitInt {}, _) -> cont 72;
	(LitChr {}, _) -> cont 73;
	(Id {}, _) -> cont 74;
	(Op {opName="+"},   _) -> cont 75;
	(Op {opName="-"},   _) -> cont 76;
	(Op {opName="*"},   _) -> cont 77;
	(Op {opName="/"},   _) -> cont 78;
	(Op {opName="%"},   _) -> cont 79;
	(Op {opName="^"},   _) -> cont 80;
	(Op {opName="<"},   _) -> cont 81;
	(Op {opName="<="},  _) -> cont 82;
	(Op {opName="=="},  _) -> cont 83;
	(Op {opName="!="},  _) -> cont 84;
	(Op {opName=">="},  _) -> cont 85;
	(Op {opName=">"},   _) -> cont 86;
	(Op {opName="&&"},  _) -> cont 87;
	(Op {opName="||"},  _) -> cont 88;
	(Op {opName="!"},   _) -> cont 89;
	_ -> happyError' tk
	})

happyError_ 90 tk = happyError' tk
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


-- | Parses a MiniTriangle program, building an AST representation of it
-- if successful.

parse :: String -> DF AST
parse = runP parseAux


-- Projection functions for pairs of token and source position.

tspSrcPos :: (Token,SrcPos) -> SrcPos
tspSrcPos = snd


tspLIVal :: (Token,SrcPos) -> Integer
tspLIVal (LitInt {liVal = n}, _) = n
tspLIVal _ = parserErr "tspLIVal" "Not a LitInt"


tspLCVal :: (Token,SrcPos) -> Char
tspLCVal (LitChr {lcVal = c}, _) = c
tspLCVal _ = parserErr "tspLCVal" "Not a LitChr"


tspIdName :: (Token,SrcPos) -> Name
tspIdName (Id {idName = nm}, _) = nm
tspIdName _ = parserErr "tspIdName" "Not an Id"


tspOpName :: (Token,SrcPos) -> Name
tspOpName (Op {opName = nm}, _) = nm
tspOpName _ = parserErr "tspOpName" "Not an Op"


-- Helper functions for building ASTs.

-- Builds ExpVar from pair of Binary Operator Token and SrcPos.
mkExpVarBinOp :: (Token,SrcPos) -> Expression
mkExpVarBinOp otsp =
    ExpVar {evVar = tspOpName otsp, expSrcPos = tspSrcPos otsp}


-- Builds ExpVar from pair of Unary Operator Token and SrcPos.
-- As a special case, the unary operator "-" is substituted for the name
-- "neg" to avoid confusion with the binary operator "-" later.
mkExpVarUnOp :: (Token,SrcPos) -> Expression
mkExpVarUnOp otsp =
    ExpVar {evVar = nm, expSrcPos = tspSrcPos otsp}
    where
        onm = tspOpName otsp
        nm  = if onm == "-" then "neg" else onm


-- | Test utility. Attempts to parse the given string input and,
-- if successful, pretty-prints the resulting AST.

testParser :: String -> IO ()
testParser s = do
    putStrLn "Diagnostics:"
    mapM_ (putStrLn . ppDMsg) (snd result)
    putStrLn ""
    case fst result of
        Just ast -> do
                        putStrLn "AST:"
                        putStrLn (ppAST ast)
        Nothing -> putStrLn "Parsing produced no result."
    putStrLn ""
    where
        result :: (Maybe AST, [DMsg])
        result = runDF (parse s)


parserErr :: String -> String -> a
parserErr = internalError "Parser"
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

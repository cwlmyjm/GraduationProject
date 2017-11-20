module MyTAMCode where

import TAMInterpreter
import TAMCode

a = [    GETINT,
         LOADL 1,
     Label "loop",
         LOAD(SB 0),
         LOAD(SB 1),
         LSS,
         JUMPIFNZ "halt",
         LOAD(SB 1),
         PUTINT,
         LOADL 1,
         ADD,
         JUMP "loop",
     Label "halt",
         HALT]


b = [    LOADL 0,
         GETINT,
         CALL "fac",
         PUTINT,
         HALT,
     Label "fac",
         LOAD (LB (-1)),
         LOADL 1,
         GTR,
         JUMPIFNZ "1",
         LOADL 1,
         JUMP "2",
     Label "1",
         LOAD (LB (-1)),
         LOAD (LB (-1)),
         LOADL 1,
         SUB,
         CALL "fac",
         MUL,
     Label "2",
         RETURN 1 1]
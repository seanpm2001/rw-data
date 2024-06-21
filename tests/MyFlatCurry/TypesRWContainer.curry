module MyFlatCurry.TypesRWContainer where

import MyFlatCurry.Types
import MyFlatCurry.ReadWriteBaseContainer
import System.IO

instance ReadWrite Prog where
  readRW strs r0 = (Prog a' b' c' d' e',r5)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
      (c',r3) = readRW strs r2
      (d',r4) = readRW strs r3
      (e',r5) = readRW strs r4

  showRW params strs0 (Prog a' b' c' d' e') =
    (strs5,show1 . (show2 . (show3 . (show4 . show5))))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
      (strs3,show3) = showRW params strs2 c'
      (strs4,show4) = showRW params strs3 d'
      (strs5,show5) = showRW params strs4 e'

  writeRW params h (Prog a' b' c' d' e') strs =
    (((writeRW params h a' strs >>= writeRW params h b')
       >>= writeRW params h c')
      >>= writeRW params h d')
     >>= writeRW params h e'

  typeOf _ = monoRWType "Prog"

instance ReadWrite Visibility where
  readRW strs ('0' : r0) = (Public,r0)
  readRW strs ('1' : r0) = (Private,r0)

  showRW params strs0 Public = (strs0,showChar '0')
  showRW params strs0 Private = (strs0,showChar '1')

  writeRW params h Public strs = hPutChar h '0' >> return strs
  writeRW params h Private strs = hPutChar h '1' >> return strs

  typeOf _ = monoRWType "Visibility"

instance ReadWrite TypeDecl where
  readRW strs ('0' : r0) = (Type a' b' c' d',r4)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
      (c',r3) = readRW strs r2
      (d',r4) = readRW strs r3
  readRW strs ('1' : r0) = (TypeSyn a' b' c' d',r4)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
      (c',r3) = readRW strs r2
      (d',r4) = readRW strs r3
  readRW strs ('2' : r0) = (TypeNew a' b' c' d',r4)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
      (c',r3) = readRW strs r2
      (d',r4) = readRW strs r3

  showRW params strs0 (Type a' b' c' d') =
    (strs4,showChar '0' . (show1 . (show2 . (show3 . show4))))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
      (strs3,show3) = showRW params strs2 c'
      (strs4,show4) = showRW params strs3 d'
  showRW params strs0 (TypeSyn a' b' c' d') =
    (strs4,showChar '1' . (show1 . (show2 . (show3 . show4))))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
      (strs3,show3) = showRW params strs2 c'
      (strs4,show4) = showRW params strs3 d'
  showRW params strs0 (TypeNew a' b' c' d') =
    (strs4,showChar '2' . (show1 . (show2 . (show3 . show4))))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
      (strs3,show3) = showRW params strs2 c'
      (strs4,show4) = showRW params strs3 d'

  writeRW params h (Type a' b' c' d') strs =
    hPutChar h '0'
     >> (((writeRW params h a' strs >>= writeRW params h b')
           >>= writeRW params h c')
          >>= writeRW params h d')
  writeRW params h (TypeSyn a' b' c' d') strs =
    hPutChar h '1'
     >> (((writeRW params h a' strs >>= writeRW params h b')
           >>= writeRW params h c')
          >>= writeRW params h d')
  writeRW params h (TypeNew a' b' c' d') strs =
    hPutChar h '2'
     >> (((writeRW params h a' strs >>= writeRW params h b')
           >>= writeRW params h c')
          >>= writeRW params h d')

  typeOf _ = monoRWType "TypeDecl"

instance ReadWrite ConsDecl where
  readRW strs r0 = (Cons a' b' c' d',r4)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
      (c',r3) = readRW strs r2
      (d',r4) = readRW strs r3

  showRW params strs0 (Cons a' b' c' d') =
    (strs4,show1 . (show2 . (show3 . show4)))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
      (strs3,show3) = showRW params strs2 c'
      (strs4,show4) = showRW params strs3 d'

  writeRW params h (Cons a' b' c' d') strs =
    ((writeRW params h a' strs >>= writeRW params h b')
      >>= writeRW params h c')
     >>= writeRW params h d'

  typeOf _ = monoRWType "ConsDecl"

instance ReadWrite NewConsDecl where
  readRW strs r0 = (NewCons a' b' c',r3)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
      (c',r3) = readRW strs r2

  showRW params strs0 (NewCons a' b' c') = (strs3,show1 . (show2 . show3))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
      (strs3,show3) = showRW params strs2 c'

  writeRW params h (NewCons a' b' c') strs =
    (writeRW params h a' strs >>= writeRW params h b') >>= writeRW params h c'

  typeOf _ = monoRWType "NewConsDecl"

instance ReadWrite TypeExpr where
  readRW strs ('0' : r0) = (TVar a',r1)
    where
      (a',r1) = readRW strs r0
  readRW strs ('1' : r0) = (FuncType a' b',r2)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
  readRW strs ('2' : r0) = (TCons a' b',r2)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
  readRW strs ('3' : r0) = (ForallType a' b',r2)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1

  showRW params strs0 (TVar a') = (strs1,showChar '0' . show1)
    where
      (strs1,show1) = showRW params strs0 a'
  showRW params strs0 (FuncType a' b') =
    (strs2,showChar '1' . (show1 . show2))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
  showRW params strs0 (TCons a' b') = (strs2,showChar '2' . (show1 . show2))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
  showRW params strs0 (ForallType a' b') =
    (strs2,showChar '3' . (show1 . show2))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'

  writeRW params h (TVar a') strs = hPutChar h '0' >> writeRW params h a' strs
  writeRW params h (FuncType a' b') strs =
    hPutChar h '1' >> (writeRW params h a' strs >>= writeRW params h b')
  writeRW params h (TCons a' b') strs =
    hPutChar h '2' >> (writeRW params h a' strs >>= writeRW params h b')
  writeRW params h (ForallType a' b') strs =
    hPutChar h '3' >> (writeRW params h a' strs >>= writeRW params h b')

  typeOf _ = monoRWType "TypeExpr"

instance ReadWrite Kind where
  readRW strs ('0' : r0) = (KStar,r0)
  readRW strs ('1' : r0) = (KArrow a' b',r2)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1

  showRW params strs0 KStar = (strs0,showChar '0')
  showRW params strs0 (KArrow a' b') = (strs2,showChar '1' . (show1 . show2))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'

  writeRW params h KStar strs = hPutChar h '0' >> return strs
  writeRW params h (KArrow a' b') strs =
    hPutChar h '1' >> (writeRW params h a' strs >>= writeRW params h b')

  typeOf _ = monoRWType "Kind"

instance ReadWrite OpDecl where
  readRW strs r0 = (Op a' b' c',r3)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
      (c',r3) = readRW strs r2

  showRW params strs0 (Op a' b' c') = (strs3,show1 . (show2 . show3))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
      (strs3,show3) = showRW params strs2 c'

  writeRW params h (Op a' b' c') strs =
    (writeRW params h a' strs >>= writeRW params h b') >>= writeRW params h c'

  typeOf _ = monoRWType "OpDecl"

instance ReadWrite Fixity where
  readRW strs ('0' : r0) = (InfixOp,r0)
  readRW strs ('1' : r0) = (InfixlOp,r0)
  readRW strs ('2' : r0) = (InfixrOp,r0)

  showRW params strs0 InfixOp = (strs0,showChar '0')
  showRW params strs0 InfixlOp = (strs0,showChar '1')
  showRW params strs0 InfixrOp = (strs0,showChar '2')

  writeRW params h InfixOp strs = hPutChar h '0' >> return strs
  writeRW params h InfixlOp strs = hPutChar h '1' >> return strs
  writeRW params h InfixrOp strs = hPutChar h '2' >> return strs

  typeOf _ = monoRWType "Fixity"

instance ReadWrite FuncDecl where
  readRW strs r0 = (Func a' b' c' d' e',r5)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
      (c',r3) = readRW strs r2
      (d',r4) = readRW strs r3
      (e',r5) = readRW strs r4

  showRW params strs0 (Func a' b' c' d' e') =
    (strs5,show1 . (show2 . (show3 . (show4 . show5))))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
      (strs3,show3) = showRW params strs2 c'
      (strs4,show4) = showRW params strs3 d'
      (strs5,show5) = showRW params strs4 e'

  writeRW params h (Func a' b' c' d' e') strs =
    (((writeRW params h a' strs >>= writeRW params h b')
       >>= writeRW params h c')
      >>= writeRW params h d')
     >>= writeRW params h e'

  typeOf _ = monoRWType "FuncDecl"

instance ReadWrite Rule where
  readRW strs ('0' : r0) = (Rule a' b',r2)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
  readRW strs ('1' : r0) = (External a',r1)
    where
      (a',r1) = readRW strs r0

  showRW params strs0 (Rule a' b') = (strs2,showChar '0' . (show1 . show2))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
  showRW params strs0 (External a') = (strs1,showChar '1' . show1)
    where
      (strs1,show1) = showRW params strs0 a'

  writeRW params h (Rule a' b') strs =
    hPutChar h '0' >> (writeRW params h a' strs >>= writeRW params h b')
  writeRW params h (External a') strs =
    hPutChar h '1' >> writeRW params h a' strs

  typeOf _ = monoRWType "Rule"

instance ReadWrite CaseType where
  readRW strs ('0' : r0) = (Rigid,r0)
  readRW strs ('1' : r0) = (Flex,r0)

  showRW params strs0 Rigid = (strs0,showChar '0')
  showRW params strs0 Flex = (strs0,showChar '1')

  writeRW params h Rigid strs = hPutChar h '0' >> return strs
  writeRW params h Flex strs = hPutChar h '1' >> return strs

  typeOf _ = monoRWType "CaseType"

instance ReadWrite CombType where
  readRW strs ('0' : r0) = (FuncCall,r0)
  readRW strs ('1' : r0) = (ConsCall,r0)
  readRW strs ('2' : r0) = (FuncPartCall a',r1)
    where
      (a',r1) = readRW strs r0
  readRW strs ('3' : r0) = (ConsPartCall a',r1)
    where
      (a',r1) = readRW strs r0

  showRW params strs0 FuncCall = (strs0,showChar '0')
  showRW params strs0 ConsCall = (strs0,showChar '1')
  showRW params strs0 (FuncPartCall a') = (strs1,showChar '2' . show1)
    where
      (strs1,show1) = showRW params strs0 a'
  showRW params strs0 (ConsPartCall a') = (strs1,showChar '3' . show1)
    where
      (strs1,show1) = showRW params strs0 a'

  writeRW params h FuncCall strs = hPutChar h '0' >> return strs
  writeRW params h ConsCall strs = hPutChar h '1' >> return strs
  writeRW params h (FuncPartCall a') strs =
    hPutChar h '2' >> writeRW params h a' strs
  writeRW params h (ConsPartCall a') strs =
    hPutChar h '3' >> writeRW params h a' strs

  typeOf _ = monoRWType "CombType"

instance ReadWrite Expr where
  readRW strs ('0' : r0) = (Var a',r1)
    where
      (a',r1) = readRW strs r0
  readRW strs ('1' : r0) = (Lit a',r1)
    where
      (a',r1) = readRW strs r0
  readRW strs ('2' : r0) = (Comb a' b' c',r3)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
      (c',r3) = readRW strs r2
  readRW strs ('3' : r0) = (Let a' b',r2)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
  readRW strs ('4' : r0) = (Free a' b',r2)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
  readRW strs ('5' : r0) = (Or a' b',r2)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
  readRW strs ('6' : r0) = (Case a' b' c',r3)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
      (c',r3) = readRW strs r2
  readRW strs ('7' : r0) = (Typed a' b',r2)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1

  showRW params strs0 (Var a') = (strs1,showChar '0' . show1)
    where
      (strs1,show1) = showRW params strs0 a'
  showRW params strs0 (Lit a') = (strs1,showChar '1' . show1)
    where
      (strs1,show1) = showRW params strs0 a'
  showRW params strs0 (Comb a' b' c') =
    (strs3,showChar '2' . (show1 . (show2 . show3)))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
      (strs3,show3) = showRW params strs2 c'
  showRW params strs0 (Let a' b') = (strs2,showChar '3' . (show1 . show2))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
  showRW params strs0 (Free a' b') = (strs2,showChar '4' . (show1 . show2))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
  showRW params strs0 (Or a' b') = (strs2,showChar '5' . (show1 . show2))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
  showRW params strs0 (Case a' b' c') =
    (strs3,showChar '6' . (show1 . (show2 . show3)))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
      (strs3,show3) = showRW params strs2 c'
  showRW params strs0 (Typed a' b') = (strs2,showChar '7' . (show1 . show2))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'

  writeRW params h (Var a') strs = hPutChar h '0' >> writeRW params h a' strs
  writeRW params h (Lit a') strs = hPutChar h '1' >> writeRW params h a' strs
  writeRW params h (Comb a' b' c') strs =
    hPutChar h '2'
     >> ((writeRW params h a' strs >>= writeRW params h b')
          >>= writeRW params h c')
  writeRW params h (Let a' b') strs =
    hPutChar h '3' >> (writeRW params h a' strs >>= writeRW params h b')
  writeRW params h (Free a' b') strs =
    hPutChar h '4' >> (writeRW params h a' strs >>= writeRW params h b')
  writeRW params h (Or a' b') strs =
    hPutChar h '5' >> (writeRW params h a' strs >>= writeRW params h b')
  writeRW params h (Case a' b' c') strs =
    hPutChar h '6'
     >> ((writeRW params h a' strs >>= writeRW params h b')
          >>= writeRW params h c')
  writeRW params h (Typed a' b') strs =
    hPutChar h '7' >> (writeRW params h a' strs >>= writeRW params h b')

  typeOf _ = monoRWType "Expr"

instance ReadWrite BranchExpr where
  readRW strs r0 = (Branch a' b',r2)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1

  showRW params strs0 (Branch a' b') = (strs2,show1 . show2)
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'

  writeRW params h (Branch a' b') strs =
    writeRW params h a' strs >>= writeRW params h b'

  typeOf _ = monoRWType "BranchExpr"

instance ReadWrite Pattern where
  readRW strs ('0' : r0) = (Pattern a' b',r2)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
  readRW strs ('1' : r0) = (LPattern a',r1)
    where
      (a',r1) = readRW strs r0

  showRW params strs0 (Pattern a' b') = (strs2,showChar '0' . (show1 . show2))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
  showRW params strs0 (LPattern a') = (strs1,showChar '1' . show1)
    where
      (strs1,show1) = showRW params strs0 a'

  writeRW params h (Pattern a' b') strs =
    hPutChar h '0' >> (writeRW params h a' strs >>= writeRW params h b')
  writeRW params h (LPattern a') strs =
    hPutChar h '1' >> writeRW params h a' strs

  typeOf _ = monoRWType "Pattern"

instance ReadWrite Literal where
  readRW strs ('0' : r0) = (Intc a',r1)
    where
      (a',r1) = readRW strs r0
  readRW strs ('1' : r0) = (Floatc a',r1)
    where
      (a',r1) = readRW strs r0
  readRW strs ('2' : r0) = (Charc a',r1)
    where
      (a',r1) = readRW strs r0

  showRW params strs0 (Intc a') = (strs1,showChar '0' . show1)
    where
      (strs1,show1) = showRW params strs0 a'
  showRW params strs0 (Floatc a') = (strs1,showChar '1' . show1)
    where
      (strs1,show1) = showRW params strs0 a'
  showRW params strs0 (Charc a') = (strs1,showChar '2' . show1)
    where
      (strs1,show1) = showRW params strs0 a'

  writeRW params h (Intc a') strs = hPutChar h '0' >> writeRW params h a' strs
  writeRW params h (Floatc a') strs =
    hPutChar h '1' >> writeRW params h a' strs
  writeRW params h (Charc a') strs =
    hPutChar h '2' >> writeRW params h a' strs

  typeOf _ = monoRWType "Literal"

version_MyFlatCurry_TypesRW :: Float
version_MyFlatCurry_TypesRW = 0.1
module Handle.MyDataRW where

import Handle.MyData
import RW.Base
import System.IO

instance ReadWrite a => ReadWrite (MyData a) where
  readRW strs ('0' : r0) = (MyCons1 a',r1)
    where
      (a',r1) = readRW strs r0
  readRW strs ('1' : r0) = (MyCons2 a' b',r2)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1

  showRW params strs0 (MyCons1 a') = (strs1,showChar '0' . show1)
    where
      (strs1,show1) = showRW params strs0 a'
  showRW params strs0 (MyCons2 a' b') = (strs2,showChar '1' . (show1 . show2))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'

  writeRW params h (MyCons1 a') strs =
    hPutChar h '0' >> writeRW params h a' strs
  writeRW params h (MyCons2 a' b') strs =
    hPutChar h '1' >> (writeRW params h a' strs >>= writeRW params h b')

  typeOf n = RWType "MyData" [typeOf (get_a n)]
    where
      get_a :: MyData a' -> a'
      get_a _ = failed

instance ReadWrite MyElem where
  readRW strs ('0' : r0) = (A,r0)
  readRW strs ('1' : r0) = (B,r0)
  readRW strs ('2' : r0) = (C,r0)

  showRW params strs0 A = (strs0,showChar '0')
  showRW params strs0 B = (strs0,showChar '1')
  showRW params strs0 C = (strs0,showChar '2')

  writeRW params h A strs = hPutChar h '0' >> return strs
  writeRW params h B strs = hPutChar h '1' >> return strs
  writeRW params h C strs = hPutChar h '2' >> return strs

  typeOf _ = monoRWType "MyElem"

instance ReadWrite MyBoring where
  readRW strs r0 = (MyOnlyConstructor a' b' c' d',r4)
    where
      (a',r1) = readRW strs r0
      (b',r2) = readRW strs r1
      (c',r3) = readRW strs r2
      (d',r4) = readRW strs r3

  showRW params strs0 (MyOnlyConstructor a' b' c' d') =
    (strs4,show1 . (show2 . (show3 . show4)))
    where
      (strs1,show1) = showRW params strs0 a'
      (strs2,show2) = showRW params strs1 b'
      (strs3,show3) = showRW params strs2 c'
      (strs4,show4) = showRW params strs3 d'

  writeRW params h (MyOnlyConstructor a' b' c' d') strs =
    ((writeRW params h a' strs >>= writeRW params h b')
      >>= writeRW params h c')
     >>= writeRW params h d'

  typeOf _ = monoRWType "MyBoring"

version_Handle_MyDataRW :: Float
version_Handle_MyDataRW = 0.1
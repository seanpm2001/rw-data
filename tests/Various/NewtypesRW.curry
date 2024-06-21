module Various.NewtypesRW where

import Various.Newtypes
import RW.Base
import System.IO

instance ReadWrite MyTypeOk where
  readRW strs r0 = (MyCons,r0)

  showRW params strs0 MyCons = (strs0,showString "")

  writeRW params h MyCons strs = return strs

  typeOf _ = monoRWType "MyTypeOk"

instance ReadWrite MyNewType where
  readRW strs r0 = (MyCons2 a',r1)
    where
      (a',r1) = readRW strs r0

  showRW params strs0 (MyCons2 a') = (strs1,show1)
    where
      (strs1,show1) = showRW params strs0 a'

  writeRW params h (MyCons2 a') strs = writeRW params h a' strs

  typeOf _ = monoRWType "MyNewType"

instance ReadWrite MySecondNewType where
  readRW strs r0 = (MyCons3 a',r1)
    where
      (a',r1) = readRW strs r0

  showRW params strs0 (MyCons3 a') = (strs1,show1)
    where
      (strs1,show1) = showRW params strs0 a'

  writeRW params h (MyCons3 a') strs = writeRW params h a' strs

  typeOf _ = monoRWType "MySecondNewType"

version_Various_NewtypesRW :: Float
version_Various_NewtypesRW = 0.1
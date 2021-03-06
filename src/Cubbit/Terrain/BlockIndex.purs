module Game.Cubbit.BlockIndex (BlockIndex, blockIndex, runBlockIndex, eqBlockIndex, showBlockIndex, blockIndexDistance) where

import Control.Alternative (pure)
import Data.Foreign (toForeign, unsafeFromForeign)
import Data.Foreign.Class (class AsForeign, class IsForeign)
import Data.Ord (class Ord, abs, compare, max)
import Data.Ordering (Ordering)
import Prelude (class Eq, class Show, (-))

newtype BlockIndex = BlockIndex Int

foreign import blockIndex :: Int -> Int -> Int -> BlockIndex

foreign import runBlockIndex :: BlockIndex -> { x :: Int, y :: Int, z :: Int }

foreign import eqBlockIndex :: BlockIndex -> BlockIndex -> Boolean

foreign import showBlockIndex :: BlockIndex -> String

blockIndexDistance :: BlockIndex -> BlockIndex -> Int
blockIndexDistance a b =  max dx (max dy dz)
  where
    dx = abs (i.x - k.x)
    dy = abs (i.y - k.y)
    dz = abs (i.z - k.z)
    i = runBlockIndex a
    k = runBlockIndex b

instance is_Foreign_Index3D :: IsForeign BlockIndex where
    read value = pure (unsafeFromForeign value)

instance as_Foreign_Index3D :: AsForeign BlockIndex where
    write = toForeign

instance eq_BlockIndex :: Eq BlockIndex where
    eq = eqBlockIndex

instance show_BlockIndex :: Show BlockIndex where
    show = showBlockIndex

instance ordBlockIndex :: Ord BlockIndex where
    compare (BlockIndex a) (BlockIndex b) = compare a b


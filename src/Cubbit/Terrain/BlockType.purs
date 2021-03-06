module Game.Cubbit.BlockType where

import Data.Generic (class Generic, gEq, gShow)
import Data.Newtype (class Newtype)
import Game.Cubbit.BlockIndex (BlockIndex)
import Prelude (class Eq, class Show, (==))

newtype BlockType = BlockType Int

airBlock :: BlockType
airBlock = BlockType 0

grassBlock :: BlockType
grassBlock = BlockType 1

waterBlock :: BlockType
waterBlock = BlockType 2

woodBlock :: BlockType
woodBlock = BlockType 3

leavesBlock :: BlockType
leavesBlock = BlockType 4

dirtBlock :: BlockType
dirtBlock = BlockType 5

graniteBlock :: BlockType
graniteBlock = BlockType 6

bushBlock :: BlockType
bushBlock = BlockType 100


type BlockTypes = {
    airBlock :: BlockType,
    grassBlock :: BlockType,
    waterBlock :: BlockType,
    woodBlock :: BlockType,
    leavesBlock :: BlockType,
    dirtBlock :: BlockType,
    graniteBlock :: BlockType,
    bushBlock :: BlockType
}

blockTypes :: BlockTypes
blockTypes = {
    airBlock: airBlock,
    grassBlock: grassBlock,
    waterBlock: waterBlock,
    woodBlock: woodBlock,
    leavesBlock: leavesBlock,
    dirtBlock: dirtBlock,
    graniteBlock: graniteBlock,
    bushBlock: bushBlock
}

derive instance generic_BlockType :: Generic BlockType

derive instance newtype_BlockType :: Newtype BlockType _

instance eq_BlockType :: Eq BlockType where
    -- eq = gEq   ------- too slow!
    eq (BlockType a) (BlockType b) = a == b


instance show_BlockType :: Show BlockType where
    show = gShow


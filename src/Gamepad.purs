module Gamepad where

import Control.Monad.Eff (Eff)
import DOM (DOM)
import Data.Eq (class Eq)
import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Data.Ord (class Ord)
import Prelude (map, (>>=), map, (<$>))

newtype GamepadButton = GamepadButton {
    value :: Number,
    pressed :: Boolean
}

derive instance genericGamepadButton :: Generic GamepadButton _

newtype Gamepad = Gamepad {
    id :: String,
    index :: Int,
    mapping :: String,
    connected :: Boolean,
    buttons :: Array GamepadButton,
    axes :: Array Number,
    timeStamp :: Number
}

derive instance genericGamepad :: Generic Gamepad _

foreign import _getGamepads :: forall eff. Eff (dom :: DOM | eff) (Array (Nullable Gamepad))

getGamepads :: forall eff. Eff (dom :: DOM | eff) (Array (Maybe Gamepad))
getGamepads = map toMaybe <$> _getGamepads
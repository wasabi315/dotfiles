--------------------------------------------------------------------------------
--
--                    __  ____  __                  _
--                    \ \/ /  \/  |___ _ _  __ _ __| |
--                     >  <| |\/| / _ \ ' \/ _` / _` |
--                    /_/\_\_|  |_\___/_||_\__,_\__,_|
--
--------------------------------------------------------------------------------

import qualified Data.Map as M
import           Data.Monoid

import           XMonad
import qualified XMonad.StackSet as W

import           XMonad.Config.Desktop

import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.InsertPosition
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers

import           XMonad.Layout.Gaps
import           XMonad.Layout.Spacing
import           XMonad.Layout.WindowNavigation

import           XMonad.Util.EZConfig
import           XMonad.Util.Run
import           XMonad.Util.SpawnOnce

-------------------------------------------------------------------------------
-- Variables

myTerminal          = "termite"
myFocusFollowsMouse = False
myModMask           = mod1Mask
myWorkspaces        = map show [1..9]

gapWidth     = 10
spacingWidth = 10

myBorderWidth = 8

red    = "#bf616a"
green  = "#a3be8c"
blue   = "#88c0d0"
yellow = "#ebcb8b"
gray   = "#4c566a"
white  = "#d8dee9"
black  = "#2e3440"

-------------------------------------------------------------------------------
-- Keybindings

myKeys =
    [ ("C-;",        spawn "rofi -show drun")
    , ("M-<Return>", spawn myTerminal)
    , ("M-h",        sendMessage (Go L))
    , ("M-j",        sendMessage (Go D))
    , ("M-k",        sendMessage (Go U))
    , ("M-l",        sendMessage (Go R))
    , ("M-S-h",      sendMessage (Swap L))
    , ("M-S-j",      sendMessage (Swap D))
    , ("M-S-k",      sendMessage (Swap U))
    , ("M-S-l",      sendMessage (Swap R))
    , ("M-x",        kill)
    , ("M-S-r",      restart "xmonad" True)
    , ("<Print>",    spawn "scrot -e 'mv $f ~/Pictures/scrots'")
    ]

-------------------------------------------------------------------------------
-- Layouts

myLayout = windowNavigation . gaps myGaps . spacing spacingWidth
    $   tiled
    ||| Mirror tiled
    ||| Full
  where
    tiled  = Tall 1 (3 / 100) (1 / 2)
    myGaps = zip [U .. L] (repeat gapWidth)

-------------------------------------------------------------------------------
-- Window rules

myManageHook = insertPosition End Newer <+> composeAll
    [ className =? "Termite"       --> doShift "1"
    , className =? "Google-chrome" --> doShift "2"
    , className =? "feh"           --> doCenterFloat
    , isDialog                     --> doCenterFloat
    ]

-------------------------------------------------------------------------------
-- Startup hook

myStartupHook = do
    spawnOnce "~/.fehbg"

-------------------------------------------------------------------------------
-- Status bar

myLogHook h = dynamicLogWithPP myPP { ppOutput = hPutStrLn h }


myPP = xmobarPP
    { ppOrder   = \(ws:_:t:_) -> [ws, t]
    , ppTitle   = xmobarColor green "" . shorten 40
    , ppCurrent = xmobarColor black blue . pad . pad
    , ppUrgent  = xmobarColor black red . pad . pad
    , ppVisible = pad . pad
    , ppHidden  = pad . pad
    , ppWsSep   = ""
    , ppSep     = "  "
    }

-------------------------------------------------------------------------------

myConfig = desktopConfig
    { terminal           = myTerminal
    , focusFollowsMouse  = myFocusFollowsMouse
    , modMask            = myModMask
    , workspaces         = myWorkspaces
    , borderWidth        = myBorderWidth
    , normalBorderColor  = black
    , focusedBorderColor = gray
    , layoutHook         = avoidStruts myLayout
    , manageHook         = myManageHook
    , startupHook        = myStartupHook
    }
  `additionalKeysP`
    myKeys

-------------------------------------------------------------------------------

main :: IO ()
main = do
    bar <- spawnPipe "xmobar"
    xmonad myConfig { logHook = myLogHook bar }

--
--                   __  ____  __                  _
--                   \ \/ /  \/  |___ _ _  __ _ __| |
--                    >  <| |\/| / _ \ ' \/ _` / _` |
--                   /_/\_\_|  |_\___/_||_\__,_\__,_|
--
--       XMonad config file (https://github.com/wasabi315/dotfiles)
--

import qualified Data.Map    as M
import           Data.Monoid
import           System.Exit

import           XMonad
import qualified XMonad.StackSet    as W

import           XMonad.Actions.Submap

import           XMonad.Config.Desktop

import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.InsertPosition
import           XMonad.Hooks.ManageDocks

import           XMonad.Layout.Gaps
import           XMonad.Layout.SimpleFloat
import           XMonad.Layout.Spacing

-------------------------------------------------------------------------------

main = xmonad =<< xmobar myConfig

myConfig = desktopConfig
    { terminal            = myTerminal
    , focusFollowsMouse   = myFocusFollowsMouse
    , clickJustFocuses    = myClickJustFocuses
    , normalBorderColor   = myNormalBorderColor
    , focusedBorderColor  = myFocusedBorderColor
    , borderWidth         = myBorderWidth
    , modMask             = myModMask
    , workspaces          = myWorkspaces
    , keys                = myKeys
    , layoutHook          = myLayoutHook
    , manageHook          = myManageHook
    , handleEventHook     = myEventHook
    , logHook             = myLogHook
    , startupHook         = myStartupHook
    }

-------------------------------------------------------------------------------

myTerminal = "termite"

myFocusFollowsMouse = False
myClickJustFocuses  = False

myNormalBorderColor  = "#2e3440"
myFocusedBorderColor = "#3b4252"

myBorderWidth = 8

myModMask = mod1Mask

myWorkspaces = ["1: term", "2: web", "3: drawing"] ++ map show [4..9]

-------------------------------------------------------------------------------

myKeys conf@(XConfig { modMask = mod }) = M.fromList $

    [ ((mod,               xK_Return), spawn $ terminal conf)
    , ((controlMask,       xK_semicolon), spawn "rofi -show drun")
    , ((mod .|. shiftMask, xK_q     ), kill)

    , ((mod,               xK_space ), sendMessage NextLayout)
    , ((mod .|. shiftMask, xK_space ), setLayout $ layoutHook conf)
    , ((mod,               xK_n     ), refresh)

    , ((mod,               xK_j     ), windows W.focusDown)
    , ((mod,               xK_k     ), windows W.focusUp)
    , ((mod,               xK_m     ), windows W.focusMaster)

    , ((mod .|. shiftMask, xK_Return), windows W.swapMaster)
    , ((mod .|. shiftMask, xK_j     ), windows W.swapDown)
    , ((mod .|. shiftMask, xK_k     ), windows W.swapUp)

    , ((mod,               xK_h     ), sendMessage Shrink)
    , ((mod,               xK_l     ), sendMessage Expand)

    , ((mod,               xK_t     ), withFocused $ windows . W.sink)

    , ((mod              , xK_comma ), sendMessage (IncMasterN 1))
    , ((mod              , xK_period), sendMessage (IncMasterN (-1)))

    , ((mod .|. shiftMask, xK_x     ), io (exitWith ExitSuccess))
    , ((mod              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    ]
    ++

    [ ((m .|. mod, k), windows $ f i)
        | (i, k) <- zip (workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)] ]
    ++

    [ ((m .|. mod, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)] ]

-------------------------------------------------------------------------------

myLayoutHook = avoidStruts $ tiled ||| Full ||| simpleFloat
  where
    tiled  = spacing 5 . myGaps $ Tall 1 (1/20) (1/2)
    myGaps = gaps ([(U, 5), (D, 5), (R, 5), (L, 5)])

-------------------------------------------------------------------------------

myManageHook = insertPosition End Newer <+> composeAll
    [ className =? "Termite"        --> doShift (myWorkspaces !! 0)
    , className =? "Google-chrome"  --> doShift (myWorkspaces !! 1)
    , className =? "GravitDesigner" --> doShift (myWorkspaces !! 2)
    , resource  =? "desktop_window" --> doIgnore
    ]

-------------------------------------------------------------------------------

myEventHook = mempty

-------------------------------------------------------------------------------

myLogHook = return ()

-------------------------------------------------------------------------------

myStartupHook = do
    spawn "~/.fehbg"
    spawn "compton"


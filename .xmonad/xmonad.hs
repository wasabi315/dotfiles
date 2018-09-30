{-# LANGUAGE TupleSections #-}

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

import           XMonad.Hooks.InsertPosition
import           XMonad.Hooks.ManageDocks

import           XMonad.Layout.Gaps
import           XMonad.Layout.Spacing

-------------------------------------------------------------------------------

main = xmonad myConfig

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
    , layoutHook          = myLayout
    , manageHook          = myManageHook
    , handleEventHook     = myEventHook
    , logHook             = myLogHook
    , startupHook         = myStartupHook
    }

-------------------------------------------------------------------------------

myTerminal = "termite"

myFocusFollowsMouse = False
myClickJustFocuses  = False

myNormalBorderColor  = "#fff8f5"
myFocusedBorderColor = "#e5ddcb"

myBorderWidth = 8

myModMask = mod1Mask

myWorkspaces = ["1: term", "2: web", "3: drawing"] ++ map show [4..9]

myKeys conf@(XConfig { modMask = mod }) = M.fromList $

    -- launch a terminal
    [ ((mod,               xK_Return), spawn $ terminal conf)

    -- launch dmenu
    , ((controlMask,       xK_semicolon), spawn "rofi -show drun")

    -- close focused window
    , ((mod .|. shiftMask, xK_q     ), kill)

     -- Rotate through the available layout algorithms
    , ((mod,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((mod .|. shiftMask, xK_space ), setLayout $ layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((mod,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((mod,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((mod,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((mod,               xK_k     ), windows W.focusUp)

    -- Move focus to the master window
    , ((mod,               xK_m     ), windows W.focusMaster)

    -- Swap the focused window and the master window
    , ((mod .|. shiftMask, xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((mod .|. shiftMask, xK_j     ), windows W.swapDown)

    -- Swap the focused window with the previous window
    , ((mod .|. shiftMask, xK_k     ), windows W.swapUp)

    -- Shrink the master area
    , ((mod,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((mod,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((mod,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((mod              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((mod              , xK_period), sendMessage (IncMasterN (-1)))

    -- Quit xmonad
    , ((mod .|. shiftMask, xK_x     ), io (exitWith ExitSuccess))

    -- Restart xmonad
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

myLayout = tiled ||| Mirror tiled ||| Full
  where
     tiled  = spacing myGap . myGaps $ Tall 1 (1/20) (1/2)
     myGaps = gaps (map (, myGap) [U .. L])
     myGap  = 5

myManageHook = insertPosition End Newer <+> composeAll
    [ className =? "Termite"        --> doShift (myWorkspaces !! 0)
    , className =? "Google-chrome"  --> doShift (myWorkspaces !! 1)
    , className =? "GravitDesigner" --> doShift (myWorkspaces !! 2)
    , resource  =? "desktop_window" --> doIgnore
    ]

myEventHook = mempty

myLogHook = return ()

myStartupHook = mapM_ spawn
    [ "compton"
    , "~/.fehbg"
    ]


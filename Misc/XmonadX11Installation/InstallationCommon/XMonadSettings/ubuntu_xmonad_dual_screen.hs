import System.IO
import System.IO.UTF8
import System.Exit
import Data.Ratio
import qualified Data.Map        as M
import qualified XMonad.StackSet as W
import XMonad
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Grid
import XMonad.Layout.Combo
import XMonad.Layout.Tabbed
import XMonad.Layout.Spiral
import XMonad.Layout.TwoPane
import XMonad.Layout.Maximize
import XMonad.Layout.NoBorders
import XMonad.Layout.Decoration
import XMonad.Layout.SimplestFloat
import XMonad.Layout.ResizableTile
import XMonad.Layout.WindowNavigation
import XMonad.Layout.IndependentScreens

------------------------------------------------------------------------
-- Terminal
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal = "/usr/bin/urxvt"

------------------------------------------------------------------------
-- Workspaces
-- The default number of workspaces (virtual screens) and their names.
--
myWorkspaces = withScreens 2 ["WorkSpace1","WorkSpace2","WorkSpace3","WorkSpace4", "WorkSpace5", "WorkSpace6", "WorkSpace7", "WorkSpace8", "WorkSpace9"]


------------------------------------------------------------------------
-- Window rules
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
               [ className =? "MPlayer"                --> doFloat
               , className =? "Stardict"               --> doFloat <+> doShift "0_6"
               , className =? "Skype"                  --> doFloat
               , className =? "Pidgin"                 --> doFloat
               , resource  =? "desktop_window"         --> doIgnore
               , className =? "Galculator"             --> doFloat
               , className =? "Qq"                     --> doFloat
               , className =? "Gimp"                   --> doFloat <+> doShift "0_4:Media"
               , isFullscreen --> (doF W.focusDown <+> doFullFloat)]


------------------------------------------------------------------------
-- Layouts
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = avoidStruts (Full ||| tiled ||| Mirror tiled  ||| magnify Grid ||| tabs) ||| Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = ResizableTall nmaster delta ratio []
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 7 % 13
     -- Percent of screen to increment by when resizing panes
     delta   = 3 % 100
     -- tabbed layout
     tabs = tabbed shrinkText myTabTheme
     -- magnification in grid
     magnify = magnifiercz (14 % 10)

------------------------------------------------------------------------
-- Colors and borders
-- Currently based on the ir_black theme.
--

myNormalBorderColor  = "#1f1f1f"
myFocusedBorderColor = "#2f2f2f"

-- Colors for text and backgrounds of each tab when in "Tabbed" layout.
myTabTheme :: Theme
myTabTheme = defaultTheme {
               fontName = "xft:Bitstream Vera Sans Mono:size=9",
               activeBorderColor = "#6f6f6f",
               activeTextColor = "#00afff",
               activeColor = "#000000",
               inactiveBorderColor = "#2f2f2f",
               inactiveTextColor = "#657b83",
               inactiveColor = "#000000"
             }

-- Color of current window title in xmobar.
xmobarTitleColor = "#00aae0"

-- Color of current workspace in xmobar.
-- xmobarCurrentWorkspaceColor = "#ee9a00"
xmobarCurrentWorkspaceColor = "cyan"

-- Width of the window border in pixels.
myBorderWidth = 1


------------------------------------------------------------------------
-- Key bindings
--
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask = mod4Mask

-- The mask for the numlock key. Numlock status is "masked" from the
-- current modifier status, so the keybindings will work with numlock on or
-- off. You may need to change this on some systems.
--
-- You can find the numlock modifier by running "xmodmap" and looking for a
-- modifier with Num_Lock bound to it:
--
-- > $ xmodmap | grep Num
-- > mod2        Num_Lock (0x4d)
--
-- Set numlockMask = 0 if you don't have a numlock key, or want to treat
-- numlock status separately.
--
myNumlockMask = 0

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  ----------------------------------------------------------------------
  -- Custom key bindings
  --
  -- Start a terminal.  Terminal to start is specified by myTerminal variable.
  [ ((modMask .|. shiftMask, xK_Return),
     spawn $ XMonad.terminal conf)

  -- Lock the screen using slimlock.
  , ((modMask .|. controlMask, xK_l),
     spawn "xlock")

  -- Launch dmenu
  -- Use this to launch programs without a key binding.
  , ((modMask, xK_p),
     spawn "dmenu_run -nb 'black' -nf 'wheat1' -sb 'black' -sf 'springgreen'")
    
  -- Take full screenshot in multi-head mode.
  -- That is, take a screenshot of everything you see.
  , ((modMask .|. shiftMask, xK_p),
     spawn "scrot '%Y-%m-%d_$wx$h.png' -e 'mv $f ~/Pictures/'")

  -- Mute volume.
  , ((modMask, xK_0),
     spawn "amixer -q set Master toggle")

  -- Decrease volume and beep.
  , ((modMask, xK_Down),
     spawn "amixer -q set Master 5%- && aplay /usr/share/pommed/click.wav")

  -- Increase volume and beep.
  , ((modMask, xK_Up),
     spawn "amixer -q set Master 5%+ && aplay /usr/share/pommed/click.wav")

  --------------------------------------------------------------------
  -- "Standard" xmonad key bindings
  --

  -- Close focused window.
  , ((modMask .|. shiftMask, xK_k),
     kill)

  -- Cycle through the available layout algorithms.
  , ((modMask, xK_space),
     sendMessage NextLayout)

  --  Reset the layouts on the current workspace to default.
  , ((modMask .|. shiftMask, xK_space),
     setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size.
  , ((modMask, xK_n),
     refresh)

  -- Move focus to the next window.
  , ((modMask, xK_Tab),
     windows W.focusDown)

  -- Move focus to the next window.
  , ((modMask, xK_j),
     windows W.focusDown)

  -- Move focus to the master window.
  , ((modMask, xK_m),
     windows W.focusMaster  )

  -- Shrink the master area.
  , ((modMask, xK_h),
     sendMessage Shrink)

  -- Expand the master area.
  , ((modMask, xK_l),
     sendMessage Expand)

  -- Push window back into tiling.
  , ((modMask, xK_t),
     withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area.
  , ((modMask, xK_comma),
     sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area.
  , ((modMask, xK_period),
     sendMessage (IncMasterN (-1)))

  -- Toggle the status bar gap.
  -- TODO: update this binding with avoidStruts, ((modMask, xK_b),

  -- Quit xmonad.
  , ((modMask .|. shiftMask, xK_q),
     io (exitWith ExitSuccess))

  -- Restart xmonad.
  , ((modMask, xK_q),
     restart "xmonad" True)
  ]
  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modMask, k), windows $ onCurrentScreen f i)
      | (i, k) <- zip (workspaces' conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
  ++

  -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
  -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
  [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
      | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings
--
-- Focus rules
-- True if your focus should follow your mouse cursor.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
  [
    -- mod-button1, Set the window to floating mode and move by dragging
    ((modMask, button1),
     (\w -> focus w >> mouseMoveWindow w))

    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2),
       (\w -> focus w >> windows W.swapMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3),
       (\w -> focus w >> mouseResizeWindow w))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
  ]


------------------------------------------------------------------------
-- Status bars and logging
-- Perform an arbitrary action on each internal state change or X event.
-- See the 'DynamicLog' extension for examples.
--
-- To emulate dwm's status bar
--
-- > logHook = dynamicLogDzen
--


------------------------------------------------------------------------
-- Startup hook
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing. (myStartUpHook = return())
myStartupHook = return()


------------------------------------------------------------------------
-- Run xmonad with all the defaults we set up.
--
main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar_dual_screen.hs"
  xmonad defaults {
               logHook =  dynamicLogWithPP $ xmobarPP {
                            ppOutput = System.IO.UTF8.hPutStrLn xmproc
                          , ppTitle = xmobarColor xmobarTitleColor "" . shorten 1
                          , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
                          , ppSep = "  "}
             , manageHook = manageDocks <+> myManageHook
             }


------------------------------------------------------------------------
-- Combine it all together
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will 
-- use the defaults defined in xmonad/XMonad/Config.hs
-- 
-- No need to modify this.
--
defaults = defaultConfig {
    -- simple stuff
    terminal           = myTerminal,
    focusFollowsMouse  = myFocusFollowsMouse,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    -- key bindings
    keys               = myKeys,
    mouseBindings      = myMouseBindings,

    -- hooks, layouts
    layoutHook         = smartBorders $ myLayout,
    manageHook         = myManageHook,
    startupHook        = myStartupHook
}

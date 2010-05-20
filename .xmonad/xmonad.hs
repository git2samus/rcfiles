import XMonad
import XMonad.Actions.CycleWS
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

customKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- screen rotation
    [ ((modMask, xK_Left),
        spawn "xrandr --output LVDS --rotate left")
    , ((modMask, xK_Right),
        spawn "xrandr --output LVDS --rotate right")
    , ((modMask, xK_Up),
        spawn "xrandr --output LVDS --rotate normal")
    , ((modMask, xK_Down),
        spawn "xrandr --output LVDS --rotate inverted")

    -- launch gmrun
    , ((modMask, xK_F12),
        spawn "gmrun")

    -- launch a terminal
    , ((modMask, xK_Return),
        spawn $ XMonad.terminal conf)
    -- launch firefox
    , ((modMask, xK_f),
        spawn "firefox")
    -- , ((modMask, xK_f),
    --     spawn "firefox -P browse")
    -- , ((modMask .|. shiftMask, xK_f),
    --     spawn "firefox -P browse -no-remote")
    -- , ((modMask, xK_g),
    --     spawn "firefox -P devel")
    -- , ((modMask .|. shiftMask, xK_g),
    --     spawn "firefox -P devel -no-remote")
    -- , ((modMask, xK_v),
    --     spawn "firefox -P test")
    -- , ((modMask .|. shiftMask, xK_v),
    --     spawn "firefox -P test -no-remote")
    -- launch file-manager
    -- , ((modMask, xK_h),
    --     spawn "pcmanfm")

    -- lock screen
    , ((modMask, xK_l),
        spawn "xlock -mode blank")
    -- launch skype
    , ((modMask, xK_s),
        spawn "skype")
    -- launch pidgin
    , ((modMask, xK_p),
        spawn "pidgin")
    -- launch thunderbird
    , ((modMask, xK_t),
        spawn "thunderbird")
    -- launch xchat
    , ((modMask, xK_x),
        spawn "xchat")

    -- Move focus to the next window
    , ((modMask, xK_Tab),
        windows W.focusDown)
    , ((modMask, xK_bracketright),
        windows W.focusDown)
    -- Move focus to the previous window
    , ((modMask .|. shiftMask, xK_Tab),
        windows W.focusUp)
    , ((modMask, xK_bracketleft),
        windows W.focusUp)
    -- Move focus to the master window
    , ((modMask, xK_apostrophe),
        windows W.focusMaster)

    -- Swap the focused window with the next window
    , ((modMask .|. shiftMask, xK_bracketright),
        windows W.swapDown)
    -- Swap the focused window with the previous window
    , ((modMask .|. shiftMask, xK_bracketleft),
        windows W.swapUp)
    -- Swap the focused window and the master window
    , ((modMask .|. shiftMask, xK_apostrophe),
        windows W.swapMaster)

    -- Shrink the master area
    , ((modMask, xK_comma),
        sendMessage Shrink)
    -- Expand the master area
    , ((modMask, xK_period),
        sendMessage Expand)
    -- Resize viewed windows to the correct size
    , ((modMask, xK_slash),
        refresh)

    -- Increment the number of windows in the master area
    , ((modMask .|. shiftMask, xK_comma),
        sendMessage (IncMasterN 1))
    -- Deincrement the number of windows in the master area
    , ((modMask .|. shiftMask, xK_period),
        sendMessage (IncMasterN (-1)))
    -- Push window back into tiling
    , ((modMask .|. shiftMask, xK_slash),
        withFocused $ windows . W.sink)

    -- Switch to next workspace
    , ((modMask .|. controlMask, xK_Tab),
        nextWS)
    , ((modMask, xK_equal),
        nextWS)
    -- Switch to prev workspace
    , ((modMask .|. shiftMask .|. controlMask, xK_Tab),
        prevWS)
    , ((modMask, xK_minus),
        prevWS)

    -- Move client to next workspace
    , ((modMask .|. shiftMask, xK_equal),
        shiftToNext)
    -- Move client to prev workspace
    , ((modMask .|. shiftMask, xK_minus),
        shiftToPrev)

    -- Rotate through the available layout algorithms
    , ((modMask, xK_space),
        sendMessage NextLayout)
    -- Reset the layouts on the current workspace to default
    , ((modMask .|. shiftMask, xK_space),
        setLayout $ XMonad.layoutHook conf)

    -- Close focused window 
    , ((modMask, xK_BackSpace),
        kill)
    -- Restart xmonad
    , ((modMask, xK_Escape),
        restart "xmonad" True)
    -- Quit xmonad
    , ((modMask .|. shiftMask, xK_Escape),
        io (exitWith ExitSuccess))
    ] ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modMask, k), windows $ f i)
    | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
    , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

customs = defaultConfig {
    terminal = "sakura",
    modMask  = mod4Mask,
    keys     = customKeys
}

main = xmonad customs


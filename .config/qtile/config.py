# Last Modified: Thu, 12 Dec 2024 11:52:35 AM

import re

from libqtile import bar, layout, qtile, widget
from libqtile.config import (
    Click,
    Drag,
    DropDown,
    Group,
    Key,
    Match,
    Rule,
    ScratchPad,
    Screen,
)
from libqtile.lazy import lazy

from spotify import Spotify

mod = "mod4"
altmod = "mod1"
terminal = "alacritty"
mvol = "pulsemixer --toggle-mute"
# upvol = "pactl set-sink-volume 0 +5%"
# downvol = "pactl set-sink-volume 0 -5%"
# upvol = "pulsemixer --change-volume +5 --max-volume 150"
# downvol = "pulsemixer --change-volume -5 --max-volume 150"
brightup = "brightnessctl s 10%+"
brightdown = "brightnessctl s 10%-"
powermenu = "power"
dmenu = "dmenu_run"
filemanager = "alacritty -e lf"
browser = "firefox"
qbrowser = "qutebrowser"
emacs = "emacsclient -c -a 'emacs' "
mpctoggle = "mpc toggle"
mpcprev = "mpc prev"
mpcnext = "mpc next"
camkill = "camtoggle kill"

keys = [
    # Navigation
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "Tab", lazy.screen.toggle_group(), desc="Switch last view group"),
    # Shuffle window
    Key([mod, "control"], "h", lazy.layout.shuffle_left(), desc="Suffle to left"),
    Key([mod, "control"], "l", lazy.layout.shuffle_right(), desc="Shuffle to right"),
    Key([mod, "control"], "j", lazy.layout.shuffle_down(), desc="Shuffle down"),
    Key([mod, "control"], "k", lazy.layout.shuffle_up(), desc="Shuffle up"),
    # Adjust window
    Key([mod, "shift"], "h", lazy.layout.grow_left(), desc="Grow to left"),
    Key([mod, "shift"], "l", lazy.layout.grow_right(), desc="Grow to right"),
    Key([mod, "shift"], "j", lazy.layout.grow_down(), desc="Grow down"),
    Key([mod, "shift"], "k", lazy.layout.grow_up(), desc="Grow up"),
    Key([mod, "control"], "space", lazy.layout.normalize(), desc="Reset all window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Fullscreen toggle"),
    # Media keys
    Key([], "XF86AudioMute", lazy.spawn(mvol), desc="Mute volume"),
    # Key([], "XF86AudioRaiseVolume", lazy.spawn(upvol), desc="Volume Up"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("audiobar 0 +5"), desc="Volume Up"),
    # Key([], "XF86AudioLowerVolume", lazy.spawn(downvol), desc="volume down"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("audiobar 0 -5"), desc="volume down"),
    Key([], "XF86MonBrightnessUp", lazy.spawn(brightup), desc="Brightness up"),
    Key([], "XF86MonBrightnessDown", lazy.spawn(brightdown), desc="Brightness up"),
    Key([], "XF86TouchpadToggle", lazy.spawn("padtoggle"), desc="Toggle touchpad"),
    # System
    Key([mod], "q", lazy.window.kill(), desc="Kill focus window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload configuration"),
    Key([mod], "escape", lazy.spawn(powermenu), desc="Power menu"),
    Key([mod], "i", lazy.next_layout(), desc="Toggle layouts"),
    Key([mod, "control"], "x", lazy.shutdown(), desc="Shutdown qtile"),
    # Programs
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "d", lazy.spawn(dmenu), desc="Dmenu"),
    Key([mod], "o", lazy.spawn(filemanager), desc="File manager lf"),
    Key([mod], "b", lazy.spawn(browser), desc="Firefox web browser"),
    Key([mod, "shift"], "b", lazy.spawn(qbrowser), desc="Qute web browser"),
    Key([mod], "F2", lazy.spawn("podconnect"), desc="Connect airpods"),
    Key([mod], "F1", lazy.spawn("ekill"), desc="Emacs daemon toggle"),
    Key([mod], "e", lazy.spawn(emacs), desc="Emacs"),
    Key([mod], "grave", lazy.spawn("emojis"), desc="Emojis"),
    Key([], "Print", lazy.spawn("screenshot"), desc="Take screenshot"),
    Key([mod], "Print", lazy.spawn("timeshot"), desc="Timed screenshot"),
    Key([mod], "p", lazy.spawn("spotify-toggle"), desc="Play toggle for spotify"),
    Key([mod], "period", lazy.spawn("spotify-next"), desc="Next song in spotify"),
    Key([mod], "comma", lazy.spawn("spotify-prev"), desc="Previous song in spotify"),
    Key([mod, "shift"], "s", lazy.spawn("dmenu-playlist"), desc="Search ncmpcpp song"),
    Key([mod, "shift"], "p", lazy.spawn(mpctoggle), desc="Play toggle for ncmpcpp"),
    Key([mod, "shift"], "comma", lazy.spawn(mpcprev), desc="Previous song in ncmpcpp"),
    Key([mod, "shift"], "period", lazy.spawn(mpcnext), desc="Next song in ncmpcpp"),
    Key([mod], "F9", lazy.spawn("dmenu-mount"), desc="Mount drive"),
    Key([mod, "shift"], "F9", lazy.spawn("dmenu-unmount"), desc="Unmount drive"),
    Key([mod], "w", lazy.spawn("dmenu-favlink"), desc="Web search via dmenu"),
    Key([mod], "s", lazy.spawn("dmenu-google"), desc="Web search via dmenu"),
    Key([mod], "F12", lazy.spawn("torrtoggle"), desc="Torrent daemon toggle"),
    Key([mod, "shift"], "F12", lazy.spawn("torrclear"), desc="Remove finished torrent"),
    Key([mod], "c", lazy.spawn("camtoggle"), desc="Webcam"),
    Key([mod, "shift"], "c", lazy.spawn(camkill), desc="Webcam"),
    Key([mod], "F8", lazy.spawn("dmenu-record"), desc="Record screen"),
]

# Groups
# groups = [Group(f"{i+1}", label="●") for i in range(5)]
# groups = [
#     Group("1", label="1"),
#     Group("2", label="2"),
#     Group("3", label="3"),
# ]
groups = [Group(i) for i in "12345"]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch & move focused window to group {}".format(i.name),
            ),
            Key(
                [mod, "control"],
                i.name,
                lazy.window.togroup(i.name),
                desc="move focused window to group {}".format(i.name),
            ),
        ]
    )

# Scratchpad
groups.append(
    ScratchPad(
        "scratchpad",
        [
            DropDown(
                "term",
                terminal,
                on_focus_lost_hide=False,
                warp_pointer=False,
                opacity=0.95,
                height=0.50,
                width=0.50,
                x=0.25,
                y=0.1,
            ),
            DropDown(
                "nmtui",
                terminal + " -e nmtui",
                on_focus_lost_hide=False,
                warp_pointer=False,
                opacity=1,
                height=0.50,
                width=0.40,
                x=0.30,
                y=0.18,
            ),
            DropDown(
                "spotify",
                "qtile run-cmd -g scratchpad spotify-launcher",
                match=Match(wm_class="Spotify"),
                on_focus_lost_hide=False,
                warp_pointer=False,
                opacity=1.00,
                height=0.50,
                width=0.50,
                x=0.25,
                y=0.1,
            ),
            DropDown(
                "btop",
                "alacritty --class sysmon -e btop",
                match=Match(wm_class="sysmon"),
                on_focus_lost_hide=False,
                warp_pointer=False,
                opacity=0.95,
                height=0.50,
                width=0.50,
                x=0.25,
                y=0.1,
            ),
            DropDown(
                "htop",
                "alacritty --class sysmon -e htop",
                match=Match(wm_class="sysmon"),
                on_focus_lost_hide=False,
                warp_pointer=False,
                opacity=0.95,
                height=0.50,
                width=0.50,
                x=0.25,
                y=0.1,
            ),
            DropDown(
                "nvtop",
                "alacritty --class sysmon -e nvtop",
                match=Match(wm_class="sysmon"),
                on_focus_lost_hide=False,
                warp_pointer=False,
                opacity=0.95,
                height=0.50,
                width=0.50,
                x=0.25,
                y=0.1,
            ),
            DropDown(
                "pulsemixer",
                "alacritty --class sysmon -e pulsemixer",
                match=Match(wm_class="sysmon"),
                on_focus_lost_hide=False,
                warp_pointer=False,
                opacity=0.95,
                height=0.50,
                width=0.50,
                x=0.25,
                y=0.1,
            ),
            DropDown(
                "ncmpcpp",
                terminal + " -e ncmpcpp",
                on_focus_lost_hide=False,
                warp_pointer=False,
                opacity=0.95,
                height=0.50,
                width=0.50,
                x=0.25,
                y=0.1,
            ),
            DropDown(
                "tremc",
                terminal + " -e tremc",
                on_focus_lost_hide=False,
                warp_pointer=False,
                opacity=0.95,
                height=0.50,
                width=0.50,
                x=0.25,
                y=0.1,
            ),
        ],
    )
)

keys.extend(
    [
        Key(
            [mod, "shift"],
            "Return",
            lazy.group["scratchpad"].dropdown_toggle("term"),
            desc="Terminal scratchpad",
        ),
        Key(
            [mod, "shift"],
            "w",
            lazy.group["scratchpad"].dropdown_toggle("nmtui"),
            desc="Open nmtui",
        ),
        Key(
            [altmod, "shift"],
            "s",
            lazy.group["scratchpad"].dropdown_toggle("spotify"),
            desc="Spotify scratchpad",
        ),
        Key(
            [altmod, "shift"],
            "b",
            lazy.group["scratchpad"].dropdown_toggle("btop"),
            desc="Btop system monitor",
        ),
        Key(
            [altmod, "shift"],
            "h",
            lazy.group["scratchpad"].dropdown_toggle("htop"),
            desc="Htop system monitor",
        ),
        Key(
            [altmod, "shift"],
            "n",
            lazy.group["scratchpad"].dropdown_toggle("nvtop"),
            desc="Nvtop gpu monitor",
        ),
        Key(
            [altmod, "shift"],
            "p",
            lazy.group["scratchpad"].dropdown_toggle("pulsemixer"),
            desc="Audio mixer",
        ),
        Key(
            [altmod, "shift"],
            "m",
            lazy.group["scratchpad"].dropdown_toggle("ncmpcpp"),
            desc="Ncmpcpp music player",
        ),
        Key(
            [altmod],
            "t",
            lazy.group["scratchpad"].dropdown_toggle("tremc"),
            desc="Torrent tremc",
        ),
    ]
)

# Mouse
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod, "shift"],
        "Button1",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# Catppuccin
color = [
    ["#1e1e2e", "#1e1e2e"],  # 0
    ["#f38ba8", "#f38ba8"],  # 1
    ["#a6e3a1", "#a6e3a1"],  # 2
    ["#f9e2af", "#f9e2af"],  # 3
    ["#89b4fa", "#89b4fa"],  # 4
    ["#f5c2e7", "#f5c2e7"],  # 5
    ["#94e2d5", "#94e2d5"],  # 6
    ["#bac2de", "#bac2de"],  # 7
    ["#eba0ac", "#eba0ac"],  # 8
    ["#b4befe", "#b4befe"],  # 9
    ["#fab387", "#fab387"],  # 10
    ["#74c7ec", "#74c7ec"],  # 11
    ["#cba6f7", "#cba6f7"],  # 12
    ["#89dceb", "#89dceb"],  # 13
    ["#313244", "#313244"],  # 14
]

# Layouts
layout_theme = {
    "border_width": 3,
    "border_focus": color[12],
    "border_normal": color[0],
}
floating_theme = layout_theme.copy()

layouts = [
    layout.Columns(**layout_theme, shift_windows=True, margin=5, border_on_single=True),
    layout.Floating(**layout_theme),
    layout.MonadTall(**layout_theme, ratio=0.25, new_client_position="before_current"),
    layout.MonadWide(**layout_theme),
    # layout.Max(**layout_theme),
    # layout.Tile(**layout_theme),
    # layout.Bsp(**layout_theme),
]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
        Match(wm_class="Steam setup"),
        Match(title="Steam Settings"),
        Match(title="Downloading spotify"),
        Match(wm_class="zenity"),
    ],
    **floating_theme,
)

# Widgets
widget_defaults = dict(
    font="monospace Bold",
    # fontsize=16,
    fontsize=20,
    background=color[0],
    padding=5,
)
extension_defaults = widget_defaults.copy()


def power():
    qtile.cmd_spawn("power")


def core_widget():
    return [
        widget.Image(
            filename="~/.config/qtile/assets/python.png",
            # margin=3,
            # background=color[1],
        ),
        widget.Clock(format="󰸗 %A %d %B", foreground=color[3]),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.Clock(format="󰥔 %I:%M%p", foreground=color[6]),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.CurrentLayoutIcon(**widget_defaults, scale=0.5),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.GroupBox(
            active=color[1],
            inactive=color[7],
            padding=5,
            this_current_screen_border=color[0],
            block_highlight_text_color=color[2],
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.WindowName(**widget_defaults, max_chars=51, foreground=color[4]),
        widget.Spacer(),
        Spotify(format="{artist} {icon}  {track}", foreground=color[5]),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.Bluetooth(
            default_text="󰂯 {connected_devices}",
            default_show_battery=True,
            device_battery_format=" 󱐋{battery}%",
            foreground=color[4],
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.Backlight(
            backlight_name="amdgpu_bl2",
            format=" {percent:2.0%}",
            foreground=color[3],
        ),
        # TODO: Make a script to only show icons when ncmpcpp is in paused state.
        # widget.Sep(**widget_defaults, size_percent=60),
        # widget.Mpd2(status_format="{play_status} {title}"),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.Memory(
            format="󰍛{MemUsed: .0f}{mm}",
            measure_mem="G",
            foreground=color[6],
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.ThermalSensor(
            tag_sensor="Tctl",
            format=" {temp:.0f}{unit}",
            foreground=color[8],
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.Wlan(
            # format="󱚽  {essid}",
            format="󱚽 ",
            disconnected_message="󰖪 ",
            interface="wlp6s0",
            foreground=color[12],
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        # widget.Wttr(
        #     location={"Philippines": "Home"},
        #     format="%m%t",
        #     foreground=color[10],
        #     update_interval=3600,
        # ),
        # widget.Sep(**widget_defaults, size_percent=60),
        widget.PulseVolume(fmt="󰕾 {}", foreground=color[4]),
        # widget.Volume(fmt="󰕾 {}", foreground=color[4]),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.Battery(
            # format="{char} {percent:2.0%}",
            format="{char} {percent:2.0%} {hour:d}:{min:02d} {watt:.2f}W",
            show_short_text=False,
            charge_char="",
            full_char="",
            discharge_char="",
            update_interval=10,
            mouse_callbacks={"Button1": power},
            foreground=color[6],
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.Systray(icon_size=18),
    ]


screens = [Screen(top=bar.Bar(widgets=core_widget(), size=34))]

follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "qtile"
dgroups_key_binder = None

dgroups_app_rules = [
    Rule(Match(wm_class=re.compile(r"^(firefox)$")), group="1"),
    Rule(Match(wm_class=re.compile(r"^(Steam|steam)$")), group="4"),
    Rule(Match(title=re.compile(r"^(Steam\ setup|Steam|steam)$")), group="4"),
]

# Last Modified: Mon, 06 Jan 2025 12:40:08 AM

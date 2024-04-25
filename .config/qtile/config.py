from libqtile import bar, layout, qtile, widget
from libqtile.config import (
    DropDown,
    EzClick,
    EzDrag,
    EzKey,
    Group,
    Match,
    Rule,
    ScratchPad,
    Screen,
)
from libqtile.lazy import lazy

from spotify import Spotify

# General
mod = "mod4"
terminal = "alacritty"
dmenu = "dmenu_run"
powerprompt = "power"
browser = "firefox"
emacs = "emacs"
filemanager = "alacritty -e lf"
mutevol = "wpctl set-mute 58 toggle"
volup = "pactl set-sink-volume 0 +5%"
voldown = "pactl set-sink-volume 0 -5%"
brightup = "brightnessctl s 10%+"
brightdown = "brightnessctl s 10%-"

# Set 1 to enable and 0 to disable
volume_widget = 1
systray_widget = 1
battery_widget = 1
clock_widget = 1
memory_widget = 1
spotify_widget = 1
bluetooth_widget = 1

# Widget settings
widget_fontsize = 16
widget_group_fontsize = 22

# Scratchpad settings
term_opacity = 0.95
scratch_opacity = 1.00
scratch_height = 0.50
scratch_width = 0.50
scratch_x = 0.25
scratch_y = 0.1

# Keybinds
keys = [
    # Navigation
    EzKey("M-h", lazy.layout.left(), desc="Move focus to left"),
    EzKey("M-l", lazy.layout.right(), desc="Move focus to right"),
    EzKey("M-j", lazy.layout.down(), desc="Move focus down"),
    EzKey("M-k", lazy.layout.up(), desc="Move focus up"),
    EzKey("M-<Space>", lazy.layout.next(), desc="Move window focus to other window"),
    EzKey("M-<Tab>", lazy.screen.toggle_group(), desc="Switch to last viewed group"),
    # Shuffle window
    EzKey("M-C-h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    EzKey("M-C-l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    EzKey("M-C-j", lazy.layout.shuffle_down(), desc="Move window down"),
    EzKey("M-C-k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Adjust window
    EzKey("M-S-h", lazy.layout.grow_left(), desc="Grow window to the left"),
    EzKey("M-S-l", lazy.layout.grow_right(), desc="Grow window to the right"),
    EzKey("M-S-j", lazy.layout.grow_down(), desc="Grow window down"),
    EzKey("M-S-k", lazy.layout.grow_up(), desc="Grow window up"),
    EzKey("M-n", lazy.layout.normalize(), desc="Reset all window sizes"),
    EzKey("M-f", lazy.window.toggle_fullscreen(), desc="Fullscreen"),
    EzKey("M-S-<Return>", lazy.layout.toggle_split(), desc="Toggle split stack"),
    # Media keys
    EzKey("<XF86AudioMute>", lazy.spawn(mutevol), desc="Mute volume"),
    EzKey("<XF86AudioRaiseVolume>", lazy.spawn(volup), desc="Volume up"),
    EzKey("<XF86AudioLowerVolume>", lazy.spawn(voldown), desc="Volume down"),
    EzKey("<XF86MonBrightnessUp>", lazy.spawn(brightup), desc="Brightness up"),
    EzKey("<XF86MonBrightnessDown>", lazy.spawn(brightdown), desc="Brightness down"),
    EzKey("<XF86MonBrightnessDown>", lazy.spawn(brightdown), desc="Brightness down"),
    EzKey("<XF86TouchpadToggle>", lazy.spawn("padtoggle"), desc="Toggle touchpad"),
    # System
    EzKey("M-q", lazy.window.kill(), desc="Kill focused window"),
    EzKey("M-C-r", lazy.reload_config(), desc="Reload configuration"),
    EzKey("M-<Escape>", lazy.spawn(powerprompt), desc="Powermenu"),
    EzKey("M-i", lazy.next_layout(), desc="Toggle layouts"),
    EzKey("M-C-x", lazy.shutdown(), desc="Shutdown qtile"),
    # Programs
    EzKey("M-<Return>", lazy.spawn(terminal)(), desc="Launch terminal"),
    EzKey("M-d", lazy.spawn(dmenu), desc="Dmenu prompt"),
    EzKey("M-o", lazy.spawn(filemanager), desc="File manager lf"),
    EzKey("M-b", lazy.spawn(browser), desc="Web browser"),
    EzKey("M-e", lazy.spawn(emacs), desc="Emacs"),
    EzKey("M-w", lazy.spawn("searchweb"), desc="Web search"),
]

# Mouse
mouse = [
    EzDrag(
        "M-1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    EzDrag(
        "M-S-1",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    EzClick("M-2", lazy.window.bring_to_front()),
]

# Groups
groups = [Group(f"{i+1}", label="●") for i in range(8)]
# groups = [Group(i) for i in "12345678"]

for i in groups:
    keys.extend(
        [
            EzKey(
                "M-" + i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            EzKey(
                "M-S-" + i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            EzKey(
                "M-C-" + i.name,
                lazy.window.togroup(i.name),
                desc="move focused window to group {}".format(i.name),
            ),
        ]
    )

# ScratchPad
groups.append(
    ScratchPad(
        "scratchpad",
        [
            DropDown(
                "term",
                "alacritty",
                on_focus_lost_hide=False,
                warp_pointer=False,
                opacity=term_opacity,
                height=scratch_height,
                width=scratch_width,
                x=scratch_x,
                y=scratch_y,
            ),
            DropDown(
                "spotify",
                "qtile run-cmd -g scratchpad spotify",
                match=Match(wm_class="Spotify"),
                on_focus_lost_hide=False,
                warp_pointer=False,
                opacity=scratch_opacity,
                height=scratch_height,
                width=scratch_width,
                x=scratch_x,
                y=scratch_y,
            ),
            DropDown(
                "btop",
                "alacritty --class sysmon -e btop",
                match=Match(wm_class="sysmon"),
                on_focus_lost_hide=False,
                warp_pointer=False,
                opacity=term_opacity,
                height=scratch_height,
                width=scratch_width,
                x=scratch_x,
                y=scratch_y,
            ),
            DropDown(
                "htop",
                "alacritty --class sysmon -e htop",
                match=Match(wm_class="sysmon"),
                on_focus_lost_hide=False,
                warp_pointer=False,
                opacity=term_opacity,
                height=scratch_height,
                width=scratch_width,
                x=scratch_x,
                y=scratch_y,
            ),
            DropDown(
                "nvtop",
                "alacritty --class sysmon -e nvtop",
                match=Match(wm_class="sysmon"),
                on_focus_lost_hide=False,
                warp_pointer=False,
                opacity=term_opacity,
                height=scratch_height,
                width=scratch_width,
                x=scratch_x,
                y=scratch_y,
            ),
        ],
    )
)

keys.extend(
    [
        EzKey(
            "M-S-<Return>",
            lazy.group["scratchpad"].dropdown_toggle("term"),
            desc="Terminal scratchpad",
        ),
        EzKey(
            "A-S-s",
            lazy.group["scratchpad"].dropdown_toggle("spotify"),
            desc="Spotify scratchpad",
        ),
        EzKey(
            "A-C-m",
            lazy.group["scratchpad"].dropdown_toggle("btop"),
            desc="Btop system monitor",
        ),
        EzKey(
            "A-C-h",
            lazy.group["scratchpad"].dropdown_toggle("htop"),
            desc="Htop system monitor",
        ),
        EzKey(
            "A-C-n",
            lazy.group["scratchpad"].dropdown_toggle("nvtop"),
            desc="Nvtop gpu monitor",
        ),
    ]
)

# Gruvbox colors
color = [
    ["#1d2021", "#1d2021"],  # 0
    ["#cc241d", "#cc241d"],  # 1
    ["#98971a", "#98971a"],  # 2
    ["#d79921", "#d79921"],  # 3
    ["#458588", "#458588"],  # 4
    ["#b16286", "#b16286"],  # 5
    ["#689d6a", "#689d6a"],  # 6
    ["#a89984", "#a89984"],  # 7
    ["#928374", "#928374"],  # 8
    ["#fb4934", "#fb4934"],  # 9
    ["#b8bb26", "#b8bb26"],  # 10
    ["#fabd2f", "#fabd2f"],  # 11
    ["#83a598", "#83a598"],  # 12
    ["#d3869b", "#d3869b"],  # 13
    ["#8ec07c", "#8ec07c"],  # 14
    ["#ebdbb2", "#ebdbb2"],  # 15
    ["#3c3836", "#3c3836"],  # 16
]

# Layout theme
layout_theme = {
    "border_width": 2,
    "border_focus": color[1],
    "border_normal": color[0],
}
floating_theme = layout_theme.copy()

# Widget theme
widget_defaults = dict(
    font="monospace bold",
    fontsize=widget_fontsize,
    background=color[0],
    padding=5,
)

widget_groupbox = dict(
    font="monospace bold",
    fontsize=widget_group_fontsize,
    background=color[0],
    active=color[1],
    inactive=color[16],
    this_current_screen_border=color[0],
    block_highlight_text_color=color[2],
    margin_y=3,
    margin_x=0,
    padding_x=3,
)
sep_size = 60
extension_defaults = widget_defaults.copy()

layouts = [
    layout.Columns(**layout_theme, shift_windows=True, margin=8, border_on_single=True),
    # layout.Tile(**layout_theme),
    # layout.Bsp(**layout_theme),
    layout.Max(**layout_theme),
    layout.Floating(**layout_theme),
]


def init_widgets_list():
    return [
        widget.GroupBox(**widget_groupbox),
        widget.CurrentLayout(**widget_defaults, fmt=" {}", foreground=color[3]),
        widget.WindowName(**widget_defaults, max_chars=51, foreground=color[4]),
    ]


def power():
    qtile.cmd_spawn("power")


# Define an array so that each screen gets a SHARED instantiation of these widgets
shared_widgets = []

# Widgets
if spotify_widget == 1:
    shared_widgets += [widget.Sep(**widget_defaults, size_percent=sep_size)]
    shared_widgets += [
        Spotify(
            **widget_defaults,
            format="{artist} {icon}  {track}",
            # max_chars=44,
            foreground=color[5],
        )
    ]

if bluetooth_widget == 1:
    shared_widgets += [widget.Sep(**widget_defaults, size_percent=sep_size)]
    shared_widgets += [
        widget.Bluetooth(
            **widget_defaults,
            hci0="10:68:38:F1:06:95",
            default_show_battery=True,
        )
    ]

if memory_widget == 1:
    shared_widgets += [widget.Sep(**widget_defaults, size_percent=sep_size)]
    shared_widgets += [
        widget.Memory(
            **widget_defaults,
            format="Mem:{MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}",
            foreground=color[14],
        )
    ]

if volume_widget == 1:
    shared_widgets += [widget.Sep(**widget_defaults, size_percent=sep_size)]
    shared_widgets += [
        widget.Volume(
            **widget_defaults,
            fmt="  {}",
            foreground=color[12],
        )
    ]

if clock_widget == 1:
    shared_widgets += [widget.Sep(**widget_defaults, size_percent=sep_size)]
    shared_widgets += [
        widget.Clock(
            **widget_defaults,
            format=" %Y-%m-%d %a %I:%M %p",
            foreground=color[3],
        )
    ]

if battery_widget == 1:
    shared_widgets += [widget.Sep(**widget_defaults, size_percent=sep_size)]
    shared_widgets += [
        widget.Battery(
            **widget_defaults,
            format="{char} {percent:2.0%} {hour:d}:{min:02d}",
            charge_char="  ",
            full_char=" ",
            discharge_char=" ",
            update_interval=5,
            mouse_callbacks={"Button1": power},
            foreground=color[2],
        )
    ]

systray_widgets = []
if systray_widget == 1:
    systray_widgets += [widget.Sep(**widget_defaults, size_percent=sep_size)]
    systray_widgets += [widget.Systray(**widget_defaults, icon_size=18)]

screens = [
    Screen(
        top=bar.Bar(
            widgets=init_widgets_list() + shared_widgets + systray_widgets, size=24
        )
    ),
    Screen(top=bar.Bar(widgets=init_widgets_list() + shared_widgets, size=24)),
]

dgroups_key_binder = None

# Define group rules for specific programs
dgroups_app_rules = [
    Rule(Match(wm_class=["firefox"]), group="1"),
    Rule(Match(wm_class=["Steam", "steam"]), group="7"),
    Rule(Match(title=["Steam setup", "Steam", "steam"]), group="7"),
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
    ],
    **floating_theme,
)

follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "qtile"

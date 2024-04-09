from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

from spotify import Spotify

mod = "mod4"
terminal = "alacritty"


# Defs
def search():
    qtile.cmd_spawn("dmenu_run")


def power():
    qtile.cmd_spawn("power")


# Keybinds
keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key(
        [mod, "control"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [mod, "control"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "control"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "control"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "shift"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "shift"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "shift"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "x", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "d", lazy.spawn("dmenu_run"), desc="Dmenu prompt"),
    Key([mod], "Escape", lazy.spawn("power"), desc="powermenu"),
    # https://github.com/qtile/qtile/blob/master/libqtile/backend/x11/xkeysyms.py
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("wpctl set-volume 58 5%+"),
        desc="Volume Up",
    ),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("wpctl set-volume 58 5%-"),
        desc="volume down",
    ),
    Key(
        [], "XF86AudioMute", lazy.spawn("wpctl set-mute 58 toggle"), desc="Volume Mute"
    ),
    Key(
        [],
        "XF86MonBrightnessUp",
        lazy.spawn("brightnessctl s 10%+"),
        desc="brightness UP",
    ),
    Key(
        [],
        "XF86MonBrightnessDown",
        lazy.spawn("brightnessctl s 10%-"),
        desc="brightness Down",
    ),
    Key([], "XF86TouchpadToggle", lazy.spawn("padtoggle"), desc="Toggle touchpad"),
    Key([mod], "e", lazy.spawn("alacritty -e lf"), desc="file manager"),
    Key([mod], "b", lazy.spawn("firefox"), desc="Web browser"),
]

# Groups
groups = [Group(f"{i+1}", label="●") for i in range(8)]

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
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

color_layouts = {
    "border_width": 2,
    "margin": 8,
    "border_focus": "#cc241d",
    "border_normal": "#1d2021",
}

# Layouts
layouts = [
    layout.Columns(**color_layouts),
    layout.Tile(shift_windows=True, **color_layouts),
    layout.Bsp(**color_layouts),
    layout.Max(**color_layouts),
    layout.Floating(**color_layouts),
]

# Gruvbox colors
colors = [
    ["#1d2021", "#1d2021"],  # 0
    ["#32302f", "#32302f"],  # 1
    ["#ebdbb2", "#ebdbb2"],  # 2
    ["#cc241d", "#cc241d"],  # 3
    ["#98971a", "#98971a"],  # 4
    ["#d79921", "#d79921"],  # 5
    ["#b16286", "#b16286"],  # 6
    ["#83a598", "#83a598"],  # 7
    ["#3c3836", "#3c3836"],  # 8
    ["#00000000", "#00000000"],  # 9
]


widget_defaults = dict(font="monospace", fontsize=12, padding=3, background=colors[2])
extension_defaults = extension_defaults = widget_defaults.copy()

# Bar
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                    linewidth=0, padding=10, foreground=colors[2], background=colors[4]
                ),
                widget.TextBox(
                    text="⎋",
                    font="monospace bold",
                    mouse_callbacks={"Button1": search},
                    background=colors[4],
                    foreground=colors[0],
                    padding=4,
                    fontsize=34,
                ),
                # widget.TextBox(
                #     text = '',
                #     font = 'monospace',
                #     background = colors[0],
                #     foreground = colors[4],
                #     padding = 0,
                #     fontsize = 30,
                # ),
                widget.Sep(
                    linewidth=0,
                    padding=8,
                    foreground=colors[2],
                    background=colors[0],
                ),
                widget.GroupBox(
                    font="monospace bold",
                    fontsize=22,
                    margin_y=3,
                    margin_x=0,
                    padding_y=5,
                    padding_x=3,
                    border_width=1,
                    active=colors[3],
                    inactive=colors[8],
                    rounded=True,
                    highlight_color=colors[0],
                    highlight_method="line",
                    block_highlight_text_color=colors[4],
                    this_current_screen_border=colors[0],
                    this_screen_border=[4],
                    other_current_screen_border=colors[2],
                    other_screen_border=colors[4],
                    foreground=colors[2],
                    background=colors[0],
                ),
                # widget.TextBox(
                #     text = '',
                #     font = 'monospace',
                #     background = colors[7],
                #     foreground = colors[0],
                #     padding = 0,
                #     fontsize = 30,
                # ),
                widget.CurrentLayout(
                    font="monospace bold",
                    fontsize=18,
                    fmt=" {} |",
                    foreground=colors[5],
                    background=colors[0],
                    padding=2,
                ),
                # widget.TextBox(
                #     text = '',
                #     font = 'monospace',
                #     background = colors[0],
                #     foreground = colors[7],
                #     padding = 0,
                #     fontsize = 30
                # ),
                widget.WindowName(
                    font="monospace bold",
                    fontsize=18,
                    foreground=colors[4],
                    background=colors[0],
                    padding=8,
                    max_chars=51,
                    width=700,
                ),
                widget.Sep(
                    linewidth=0, padding=0, foreground=colors[0], background=colors[0]
                ),
                widget.Spacer(background=colors[0]),
                widget.Sep(
                    linewidth=0, padding=6, foreground=colors[0], background=colors[0]
                ),
                Spotify(
                    font="monospace bold",
                    fontsize=18,
                    background=colors[0],
                    foreground=colors[6],
                    padding=15,
                ),
                # widget.Wlan(
                #     interface = 'wlp6s0',
                #     format = '{essid}',
                #     background = colors[0],
                #     fontsize = 18
                # ),
                widget.Systray(background=colors[0], padding=2),
                # widget.TextBox(
                #     text = '',
                #     font = 'monospace',
                #     background = colors[0],
                #     foreground = colors[2],
                #     padding = 0,
                #     fontsize = 37
                # ),
                widget.Memory(
                    font="monospace bold",
                    fontsize=18,
                    foreground=colors[2],
                    background=colors[0],
                    fmt="Mem:{} |",
                    format="{MemUsed: .0f}{mm}",
                    measure_mem="G",
                    padding=10,
                ),
                # widget.TextBox(
                #     text = '',
                #     font = 'monospace',
                #     background = colors[2],
                #     foreground = colors[7],
                #     padding = 0,
                #     fontsize = 30
                # ),
                widget.PulseVolume(
                    font="monospace bold",
                    fontsize=18,
                    foreground=colors[7],
                    background=colors[0],
                    fmt="Vol:{} |",
                    padding=10,
                ),
                # widget.TextBox(
                #     text = '',
                #     font = 'monospace',
                #     background = colors[7],
                #     foreground = colors[0],
                #     padding = 0,
                #     fontsize = 30
                # ),
                widget.Clock(
                    font="monospace bold",
                    fontsize=18,
                    foreground=colors[5],
                    background=colors[0],
                    format="%a %d %b %I:%M %p |",
                    padding=5,
                ),
                # widget.TextBox(
                #     text = '',
                #     font = 'monospace bold',
                #     background = colors[0],
                #     foreground = colors[4],
                #     padding = 0,
                #     fontsize = 30
                # ),
                widget.Battery(
                    font="monospace bold",
                    fontsize=18,
                    foreground=colors[4],
                    background=colors[0],
                    low_background=colors[0],
                    low_foreground=colors[3],
                    low_percentage=0.27,
                    format="Batt:{percent:2.0%}",
                    mouse_callbacks={"Button1": power},
                    padding=5,
                ),
                # widget.Sep(
                #     linewidth = 0,
                #     padding = 3,
                #     foreground=colors[2],
                #     background=colors[4]
                # ),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    border_focus="#1F1D2E",
    border_normal="#1F1D2E",
    border_width=0,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
)

# from libqtile import hook
# # some other imports
# import os
# import subprocess
# # stuff
# @hook.subscribe.startup_once
# def autostart_once():
#     subprocess.run('~/.config/qtile/autostart_once.sh')# path to my script, under my user directory
#     subprocess.call([home])

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "qtile"

# E O F
#
#

from libqtile import bar, qtile, widget
from libqtile.config import Screen
from modules.spotify import Spotify
from utils.colors import mocha

# Widgets
widget_defaults = dict(
    font="monospace Bold",
    fontsize=20,
    background=mocha["c01"],
    padding=5,
)
extension_defaults = widget_defaults.copy()


def power():
    qtile.cmd_spawn("power")


def core_widget():
    return [
        widget.Image(
            filename="~/.config/qtile/assets/python.png",
        ),
        widget.Clock(
            **widget_defaults, format="󰥔 %I:%M %p", foreground=mocha["c07"]
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.Clock(
            **widget_defaults, format="󰸗 %a-%d-%b", foreground=mocha["c04"]
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.CurrentLayoutIcon(**widget_defaults, scale=0.5),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.GroupBox(
            **widget_defaults,
            active=mocha["c02"],
            inactive=mocha["c13"],
            this_current_screen_border=mocha["c01"],
            block_highlight_text_color=mocha["c03"],
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.WindowName(
            **widget_defaults, max_chars=51, foreground=mocha["c05"]
        ),
        widget.Spacer(
            **widget_defaults,
        ),
        Spotify(
            **widget_defaults,
            format="{artist} {icon}  {track}",
            foreground=mocha["c06"],
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.Bluetooth(
            **widget_defaults,
            default_text="󰂯 {connected_devices}",
            default_show_battery=True,
            device_battery_format=" 󱐋{battery}%",
            foreground=mocha["c05"],
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.Backlight(
            **widget_defaults,
            backlight_name="amdgpu_bl2",
            format=" {percent:2.0%}",
            foreground=mocha["c03"],
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.Memory(
            **widget_defaults,
            format="󰍛{MemUsed: .0f}{mm}",
            measure_mem="G",
            foreground=mocha["c07"],
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.ThermalSensor(
            **widget_defaults,
            tag_sensor="Tctl",
            format=" {temp:.0f}{unit}",
            foreground=mocha["c06"],
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.Wlan(
            **widget_defaults,
            format="󱚽 ",
            disconnected_message="󰖪 ",
            interface="wlan0",
            foreground=mocha["c08"],
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.PulseVolume(
            **widget_defaults, fmt="󰕾 {}", foreground=mocha["c05"]
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.Battery(
            **widget_defaults,
            format="{char} {percent:2.0%} {hour:d}:{min:02d} {watt:.2f}W",
            show_short_text=False,
            charge_char="",
            full_char="",
            discharge_char="",
            update_interval=10,
            mouse_callbacks={"Button1": power},
            foreground=mocha["c07"],
        ),
        widget.Sep(**widget_defaults, size_percent=60),
        widget.Systray(**widget_defaults, icon_size=18),
    ]


screens = [Screen(top=bar.Bar(widgets=core_widget(), size=34))]

# Last Modified: Mon, 20 Jan 2025 02:45:21 AM

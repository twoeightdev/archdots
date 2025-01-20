from libqtile.config import Click, Drag
from libqtile.lazy import lazy

from .keys import mod

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

# Last Modified: Sun, 19 Jan 2025 11:41:12 PM

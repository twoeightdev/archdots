from qutebrowser.config.config import ConfigContainer  # noqa:
from qutebrowser.config.configfiles import ConfigAPI  # noqa:

config = config  # type: ConfigAPI # noqa
c = c  # tpye: ConfigContainer # noqa

config.load_autoconfig()

# Host blocking
# c.content.blocking.enabled = True
# c.content.blocking.whitelist = ["www.googleadservices.com"]

# Brave blocking, needs python-adblock
# auto, adblock, hosts, both
c.content.blocking.method = "adblock"
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
    "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt",
    "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt",
]

config.source("gruvbox.py")

# DRM Content
# Dependencies: qt6-webengine-widevine widevine in AUR
# c.qt.args = [
#     "ppapi-widevine-path=/usr/lib/qt/plugins/ppapi/libwidevinecdmadapter.so"
#     "widevine-path=/usr/lib/chromium/libwidevinecdm.so"
# ]

# Dark mode
# c.colors.webpage.preferred_color_scheme = "dark"
# c.colors.webpage.darkmode.enabled = True
# c.url.start_pages = ["~/.config/qutebrowser/start.html"]
# c.url.default_page = "about:blank"
c.url.start_pages = ["~/.local/src/startpage/index.html"]

c.url.searchengines = {
    "DEFAULT": "https://www.google.fi/search?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "gw": "https://wiki.gentoo.org/?search-{}",
    "yt": "https://youtube.com/results?search_query={}",
    "w": "https://en.wikipedia.org/?search={}",
    "dgi": "https://duckduckgo.com/?q=!ddgi {}",
    "dick": "http://en.wiktionary.org/?search={}",
    "r": "https://reddit.com/r/{}",
}

# c.qt.args += [
#     "ignore-gpu-blacklist",
#     # "enable-accelerated-2d-canvas",
#     # "enable-gpu-memory-buffer-video-frames",
#     "enable-accelerated-video-decode",
#     "enable-quic",
#     "enable-gpu-rasterization",
#     "enable-native-gpu-memory-buffers",
#     # "enable-oop-rasterization",
#     "enable-zero-copy",
# ]

# Keybinds
config.unbind("d")
config.bind("dd", "tab-close")
config.bind("q", "quit")
config.bind("K", "tab-next")
config.bind("J", "tab-prev")
config.bind("h", "scroll-px -100 0")
config.bind("j", "scroll-px 0 100")
config.bind("k", "scroll-px 0 -100")
config.bind("l", "scroll-px 100 0")

config.bind("<Alt-f>", "hint links spawn --detach mpv --profile=M60 {hint-url}")

# Font
# c.fonts.default_family = "Inconsolata Nerd Font"
# c.fonts.default_size = "14pt"
# c.fonts.web.family.fixed = "Inconsolata Nerd Font"
# c.fonts.web.family.sans_serif = "Libertinus Sans"
# c.fonts.web.family.serif = "Libertinus Sans"
c.fonts.default_family = [
    "Inconsolata Nerd Font",
    "Libertinus Sans",
    "Libertinus Serif",
    "Noto Color Emoji",
    "FontAwesome",
]
c.fonts.default_size = "12pt"
c.fonts.contextmenu = "12pt"
# c.fonts.web.size.default = 20
# c.fonts.web.size.default_fixed = 20
# c.fonts.web.size.minimum = 20

# General settings
c.content.autoplay = True
c.qt.highdpi = True
c.scrolling.smooth = True
c.scrolling.bar = "never"
c.zoom.default = "120%"
c.statusbar.widgets = ["url"]
c.tabs.show = "multiple"
c.tabs.indicator.width = 0
c.tabs.background = False
# c.tabs.title.alignment = "center"
c.content.cookies.accept = "no-3rdparty"
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.tabs.title.format = "{audio} {current_title}"
c.hints.leave_on_load = False
c.input.insert_mode.auto_load = True
c.input.insert_mode.leave_on_load = True
c.content.headers.do_not_track = True
c.content.dns_prefetch = False
c.content.javascript.clipboard = "access"

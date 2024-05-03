from qutebrowser.config.config import ConfigContainer  # noqa:
from qutebrowser.config.configfiles import ConfigAPI  # noqa:

config = config  # type: ConfigAPI # noqa
c = c  # tpye: ConfigContainer # noqa

config.load_autoconfig(True)

c.content.blocking.method = "adblock"
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://easylist.to/easylist/fanboy-social.txt",
    "https://easylist-downloads.adblockplus.org/easylistdutch.txt",
    "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt",
    "https://www.i-dont-care-about-cookies.eu/abp/",
    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
    "https://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt",
]

# Search engines
c.url.searchengines = {
    "DEFAULT": "https://www.google.fi/search?q={}",
    # "DEFAULT": "https://duckduckgo.com/?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "gw": "https://wiki.gentoo.org/?search-{}",
    "yt": "https://youtube.com/results?search_query={}",
    "w": "https://en.wikipedia.org/?search={}",
    "g": "https://www.google.fi/search?q={}",
    "dgi": "https://duckduckgo.com/?q=!ddgi {}",
    "dick": "http://en.wiktionary.org/?search={}",
    "r": "https://reddit.com/r/{}",
}

# Aliases
c.aliases = {
    "w": "session-save",
    "wq": "quit --save",
    "mpv": "spawn -d mpv --profile=H60 {url}",
    "gh": "open -t https://github.com/twoeightdev",
    "wh": "open -t https://wallhaven.cc/",
    "wt": "open -t https://www.webtoons.com/en/",
    "fb": "open -t https://facebook.com/",
    "ux": "open -t https://www.reddit.com/r/unixporn/",
    "tr": "open -t https://1337x.to/",
    "cc": "open -t https://jonasjacek.github.io/colors/",
    "od": "open -t https://odysee.com/",
    "bc": "open -t https://based.cooking/",
    "ba": "open -t https://www.bilibili.tv/en/anime",
    "suck": "open -t http://suckless.org/",
}

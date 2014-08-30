VimeoFallback
=============

Gem for Fetching Vimeo Video Fallback url. 

The fallback url can then be used to download the video asset or for use in other applications as an alternative to embedding the video via an iFrame or via the Vimeo API.


Usage
=====

Install As a Gem:
```
gem install VimeoFallback
```

In Scripts:
```
require 'VimeoFallback'

vimeoVideoID = '103684916'
url = VimeoFallback.new(vimeoVideoID).url 

# url = http://player.vimeo.com/play/280695857?s=103684916_1409451108_de7237f446f0881cd47ffb0a1b635f4c&amp;referrer=http%3A%2F%2Fplayer.vimeo.com%2Fvideo%2F103684916%2Ffallback
```

On the Command-line:
```
VimeoFallback 103684916
```

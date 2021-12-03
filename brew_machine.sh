# brew remove --force $(brew list --formula)

# python 3.10
brew install python@3.10
brew unlink python@3.10
# python 3.9
brew install python@3.9
brew unlink python@3.9
# python 3.8
brew install python@3.8
brew link --force --overwrite python@3.8

# utilities
brew install tree

brew install graphviz
brew install mysql
brew install redis

# media manipulation
brew install imagemagick
brew install exiftool
brew install ffmpeg

brew cleanup


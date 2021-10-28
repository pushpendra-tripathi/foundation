# brew remove --force $(brew list --formula)

# Python 3.8
brew install python@3.8
brew unlink python
brew link --force --overwrite python@3.8

brew install graphviz
brew install mysql
brew install redis

brew install imagemagick
brew install exiftool
brew install ffmpeg

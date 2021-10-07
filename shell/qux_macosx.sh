# osx
if [[ $OSTYPE == darwin* ]]; then
  alias lockfile="chflags -vv uchange"
  alias unlockfile="chflags -vv nouchange"
  alias setcomment="xattr -w com.apple.metadata:kMDItemFinderComment"

  # concatenate pdf
  # http://gotofritz.net/blog/howto/joining-pdf-files-in-os-x-from-the-command-line/
  # pdfconcat() {
  #   /System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py -o "$1" ${@:2}
  # }

  fn_screenshotdefaults() {
    # Screenshots
    defaults write com.apple.screencapture location "$HOME/Sync/Screenshots/"
    # defaults write com.apple.screencapture type [png|jpg|pdf]
    defaults write com.apple.screencapture type png
    defaults write com.apple.screencapture name Screenshot
    defaults write com.apple.screencapture disable-shadow -bool true
    killall SystemUIServer
  }

  # usage: setcomment "comment" filename
  quicklook() {
    qlmanage -p "$@" >& /dev/null
  }

  alias setscreenshotdefaults=fn_screenshotdefaults
  alias web2png='/usr/local/bin/webkit2png --ignore-ssl-check'
  alias renamemachine=fn_rename_machine
  alias reset_video_camera='sudo killall VDCAssistant'

  fn_rename_machine() {
    sudo scutil --set ComputerName "$@"
    sudo scutil --set LocalHostName "$@"
    sudo scutil --set HostName "$@"
  }

  hideextension() {
    SetFile -a E "$@"
  }

  xhideextension() {
      if [ "$1" == "" ]; then
          echo Usage: $0 file
          exit 0;
      fi

      for i in $(find . "$@" -flags nouchange); do
          SetFile -a E "$i"
      done
  }
fi

cd $HOME/foundation/shell
for f in `ls bash_* qux_*`; do
  cp -v ${f} $HOME/.${f}
done;

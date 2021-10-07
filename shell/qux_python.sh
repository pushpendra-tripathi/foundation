quxvenv() {
  python3 -m venv env
  source env/bin/activate
  pip install --upgrade pip
  pip install wheel
  pip install pipdeptree
  pip install pip-autoremove

  for f in requirements pipreq; do
    pipreq="config/${f}.txt"
    echo "Checking for ${pipreq}"

    if [ -f ${pipreq} ]; then
      pip install -r ${pipreq}
    fi
  done
}

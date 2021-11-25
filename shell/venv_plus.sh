dj () {
    cd $HOME/dev/PROJECT
    if [[ $1 == "" ]]; then
        python manage.py help --settings=project.settings.dev
    else
        python manage.py $1 ${@:2} --settings=project.settings.dev
    fi
}

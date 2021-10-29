dj () {
    cd PROJDIR
    if [[ $1 == "" ]]; then
        python manage.py help --settings=PROJECT.settings.dev
    else
        python manage.py $1 ${@:2} --settings=PROJECT.settings.dev
    fi
}

runserver () {
    dj runserver
}

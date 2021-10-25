dj () {
    cd ${rootdir}
    if [[ $1 == "" ]]; then
        echo "python manage.py help --settings=${projdir}.settings.dev"
        echo
        python manage.py help --settings=${projdir}.settings.dev
    else
        echo "python manage.py $1 ${@:2} --settings=${projdir}.settings.dev"
        echo
        python manage.py $1 ${@:2} --settings=${projdir}.settings.dev
    fi
}

runserver () {
    cd ${rootdir}
    python manage.py runserver --settings=${projdir}.settings.dev
}



print_head() {
    echo $1
}

status_check() {
    if [ $? -eq 0 ]
    then
        echo "success"
    else
        echo "failure"
    fi
}


#!/bin/sh

USER='root'
PASSWORD='ca$hc0w'

while getopts u:p: option
do
    case $option in
    u)
        USER=$OPTARG
        ;;
    p)
        PASSWORD=$OPTARG
        ;;
    \?)
        echo "remote.sh -u username -p 'password' hostname 'command'"
        exit;
        ;;
    esac
done

shift $[$OPTIND-1]

sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no -l $USER $1 $2

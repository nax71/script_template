#!/bin/bash

source $(dirname $0)/_init_.sh

# source libraries
source $LIBDIR/exit.sh

#source bin dir 
source $BINDIR/template_script.sh


# options management
function short_usage() {
    errorLog "Usage $0 [-h help] [-i {other parameters}] "
    exit_ko "Bad parameters. Use -h for full help"
}

function long_usage() {
    infoLog "SYNOPSYS:"
    infoLog "    Template script cli "
    infoLog " "
    infoLog "Usage $0 [-h help]  [-i {other prameters}] "
    infoLog "        -h  This help"
    infoLog "    Mandatory arguments:"
    infoLog "        -i  other parameters"
    exit_ko "Bad parameters"
}

if [ $# -lt 1 ]; then 
    long_usage
fi

while getopts "hi:" option; do
    case "${option}" in
    h)
        long_usage
        ;;
    i)
        other_param=${OPTARG}
        ;;
    *)
        short_usage
        ;;
    esac
done
shift $((OPTIND - 1))

template_script $other_param

exit_ok "template script finished."
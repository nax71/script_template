# init script

init() {

    # This function init somme global parameters and source
    # the configuration files
    # The logfile is created also in config.sh file.
    # This script is not to be launched alone.

    # my name
    ME=$(basename "$0")

    # current date
    NOW=$(date +'%d%m%Y_%H%M%S')
    START_TIME=$(date +%s)
    # get my PID 
    MY_PID=$$

    # where I am
    ROOTDIR=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
    #echo "[$ME] [$(date "+%F %H:%M:%S")] [INFO    ] ROOTDIR: $ROOTDIR"

    # get the uuid for this process
    UUID=$(cat /proc/sys/kernel/random/uuid)

    STEP_NAME="START          "

    # source config environnement
    CONFIG_FILE=${ROOTDIR}/config/config.sh

    if [[ -f "${CONFIG_FILE}" ]]; then
        . $CONFIG_FILE
    else
        echo "[$ME] [$(date "+%F %H:%M:%S")] [CRITICAL] No config file found. Searched {$CONFIG_FILE}. STOP"
        exit 1
    fi
    
    # init DEBUG_TRACE if not init to avoid errros of  non init variable
    if [ -z "$DEBUG_TRACE" ]; then
        DEBUG_TRACE=0
    fi
}

init
set -o errexit
set -o nounset

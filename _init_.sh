# init script

init() {
    # This function init somme global parameters and source
    # the configuration files
    # This script is not to be executed alone.

    # my name
    ME=$(basename "$0")

    # current date
    NOW=$(date +'%d%m%Y_%H%M%S')
    START_TIME=$(date +%s)
    # get my PID 
    MY_PID=$$

    # where I am
    ROOTDIR=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

    # get the uuid for this process
    UUID=$(cat /proc/sys/kernel/random/uuid)

    # source config environnement
    CONFIG_FILE=${ROOTDIR}/config/default.cfg

    if [[ -f "${CONFIG_FILE}" ]]; then
        . $CONFIG_FILE
    else
        echo "[$ME] [$(date "+%F %H:%M:%S")] [CRITICAL] No config file found. Searched {$CONFIG_FILE}. STOP"
        exit 1
    fi

    shopt -s nullglob
    for cfg_file in $CONFDIR/*.cfg; do
        if [ "$cfg_file" != "$CONFIG_FILE" ]; then
            echo "[$(date "+%F %H:%M:%S")] [INFO ]: Sourcing config file $cfg_file."
            . $cfg_file
        fi
    done
    
    # init DEBUG_TRACE if not init to avoid errros of non init variable
    if [ -z "$DEBUG_TRACE" ]; then
        DEBUG_TRACE=0
    fi
}

init
# exit at first error
set -o errexit
# exit if unset variable
set -o nounset

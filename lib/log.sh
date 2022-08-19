## Reset to normal: \033[0m
NORM="\033[0m"

## Colors:
BLACK="\033[0;30m"
GRAY="\033[1;30m"
RED="\033[0;31m"
LRED="\033[1;31m"
GREEN="\033[0;32m"
LGREEN="\033[1;32m"
YELLOW="\033[0;33m"
LYELLOW="\033[1;33m"
BLUE="\033[0;34m"
LBLUE="\033[1;34m"
PURPLE="\033[0;35m"
PINK="\033[1;35m"
CYAN="\033[0;36m"
LCYAN="\033[1;36m"
LGRAY="\033[0;37m"
WHITE="\033[1;37m"

LOGFILE=$LOGDIR/${ME}_${UUID}.log

function errorLog {
    # Get the exact error message and post it into
    # the logfile along with date.
    MSG="$@"
    if [ -t 1 ]; then 
        echo -e "[$(date +'%d/%m/%Y %T')] [${RED}ERROR${NORM}]: ${RED}$MSG${NORM} "
        exec >>$LOGFILE 2>&1
        echo "[$(date +'%d/%m/%Y %T')] [ERROR]: $MSG "
        exec >>/dev/tty 2>&1
    else
        echo "[$(date +'%d/%m/%Y %T')] [ERROR]: $MSG "
        exec >>$LOGFILE 2>&1
    fi
}

function warnLog {
    # Get the exact error message and post it into
    # the logfile along with date.

    MSG="$@"
    if [ -t 1 ]; then 
        echo -e "[$(date +'%d/%m/%Y %T')] [${YELLOW}WARN ${NORM}]: $MSG "
        exec >>$LOGFILE 2>&1
        echo "[$(date +'%d/%m/%Y %T')] [WARN ]: $MSG "
        exec >/dev/tty 2>&1
    else
        echo "[$(date +'%d/%m/%Y %T')] [WARN ]: $MSG "
        exec >>$LOGFILE 2>&1
    fi


}

function infoLog {
    # Get the exact error message and post it into
    # the logfile along with date.
    MSG="$@"
    if [ -t 1 ]; then 
        echo -e "[$(date +'%d/%m/%Y %T')] [${BLUE}INFO ${NORM}]: $MSG"
        exec >>$LOGFILE 2>&1
        echo "[$(date +'%d/%m/%Y %T')] [INFO ]: $MSG "
        exec >/dev/tty 2>&1
    else
        echo "[$(date +'%d/%m/%Y %T')] [INFO ]: $MSG "
        exec >>$LOGFILE 2>&1
    fi
}

function infoLogBlue {
    # Get the exact error message and post it into
    # the logfile along with date.
    MSG="$@"
    if [ -t 1 ]; then
        echo -e "[$(date +'%d/%m/%Y %T')] [${BLUE}INFO ${NORM}]: ${BLUE}$MSG ${NORM}"
        exec >>$LOGFILE 2>&1
        echo "[$(date +'%d/%m/%Y %T')] [INFO ]: $MSG "
        exec >/dev/tty 2>&1
    else
        echo "[$(date +'%d/%m/%Y %T')] [INFO ]: $MSG "
        exec >>$LOGFILE 2>&1
    fi

}

function infoLogPurple {
    # Get the exact error message and post it into
    # the logfile along with date.
    MSG="$@"
    if [ -t 1 ]; then 
        echo -e "[$(date +'%d/%m/%Y %T')] [${PURPLE}INFO ${NORM}]: ${PURPLE}$MSG ${NORM}"
        exec >>$LOGFILE 2>&1
        echo "[$(date +'%d/%m/%Y %T')] [INFO ]: $MSG "
        exec >/dev/tty 2>&1
    else
        echo "[$(date +'%d/%m/%Y %T')] [INFO ]: $MSG "
        exec >>$LOGFILE 2>&1
    fi


}

function infoLogGreen {
    # Get the exact error message and post it into
    # the logfile along with date.
    MSG="$@"
    if [ -t 1 ]; then 
        echo -e "[$(date +'%d/%m/%Y %T')] [${GREEN}INFO ${NORM}]: ${GREEN}$MSG ${NORM}"
        exec >>$LOGFILE 2>&1
        echo "[$(date +'%d/%m/%Y %T')] [INFO ]: $MSG "
        exec >/dev/tty 2>&1
    else
        echo "[$(date +'%d/%m/%Y %T')] [INFO ]: $MSG "
        exec >>$LOGFILE 2>&1
    fi    
}

function debugLog {
    # Get the exact error message and post it into
    # the logfile along with date
    MSG="$@"
    if [ -t 1 ]; then 
        if [ "$DEBUG_TRACE" != 0 ]; then
            echo -e "[$(date +'%d/%m/%Y %T')] [${PURPLE}DEBUG${NORM}]: $MSG"
        fi
        exec >>$LOGFILE 2>&1

        echo "[$(date +'%d/%m/%Y %T')] [DEBUG]: $MSG "
        exec >/dev/tty 2>&1
    else
        echo "[$(date +'%d/%m/%Y %T')] [DEBUG]: $MSG "
        exec >>$LOGFILE 2>&1
    fi
}

infoLogGreen "     ROOTDIR : $ROOTDIR"
infoLogGreen "     LOGFILE : $LOGFILE"
infoLogGreen "     START   : $NOW"
infoLogGreen "     EXEC_ID : $UUID"
infoLogGreen "     PID     : $MY_PID"
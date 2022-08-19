function __exit_script() {

    local exit_code=$1

    local END_TIME=$(date +%s)
    runtime=$(($END_TIME - $START_TIME))
    runtime_human="$((runtime / 60))m:$((runtime % 60))s"
    infoLogPurple "Duration $runtime_human"

    exit $exit_code

}

function _log_stack()
{
     local i=0
     local FRAMES=${#BASH_LINENO[@]}
     # FRAMES-2 skips main, the last one in arrays
     for ((i=FRAMES-2; i>=0; i--)); do
         errorLog "     File \"${BASH_SOURCE[i+1]}\", line ${BASH_LINENO[i]}, in ${FUNCNAME[i+1]}"
         # Grab the source code of the line
         # sed -n "${BASH_LINENO[i]}{s/^/    /;p}" "${BASH_SOURCE[i+1]}"
     done
}

function exit_ok() {
    
    msg="$1"

    infoLogGreen "EXIT. No error. $msg"
    __exit_script 0

}

function exit_ko() {
    local msg="$1"

    errorLog "EXIT. ERROR. $msg"
    _log_stack
    __exit_script 1
}

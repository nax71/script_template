function template_script() {
    local my_param=$1
    local _ret_val=$2

    infoLog "Working on parametert <$my_param> "
    debugLog "This is a debug trace, cannot be seen but in log file."
    
    if [ "$my_param" != "hello" ]; then
         eval $_ret_val="'KO'"
    else
        eval $_ret_val="'OK'"
    fi
}
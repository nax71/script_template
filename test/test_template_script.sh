#!/bin/bash

source $(dirname $0)/../_init_.sh

# source libraries
source $LIBDIR/exit.sh

#source bin dir 
source $BINDIR/template_script.sh

DEBUG_TRACE=1

template_script "hello" OUT
if [ $OUT != "OK" ]; then
   exit_ko "Test 1 Failed"
fi

template_script "fail" OUT
if [ $OUT != "KO" ]; then
   exit_ko "Test 2 Failed"
fi
 
exit_ok "Test finished"
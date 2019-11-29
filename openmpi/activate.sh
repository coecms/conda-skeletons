#!/bin/bash

if [ -f /opt/Modules/v4.3.0/libexec/modulecmd.tcl ]; then

    # Gadi
    export MODULEPATH=/g/data/hh5/public/modules:/apps/Modules/modulefiles
    eval `/usr/bin/tclsh /opt/Modules/v4.3.0/libexec/modulecmd.tcl sh "load openmpi/4.0.1"`

elif [ -f /opt/Modules/3.2.6/bin/modulecmd ]; then

    # Raijin
    export MODULEPATH=/g/data/hh5/public/modules:/apps/Modules/modulefiles
    eval `/opt/Modules/3.2.6/bin/modulecmd sh load openmpi/4.0.1`

fi

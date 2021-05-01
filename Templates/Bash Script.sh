#!/usr/bin/env bash
#
##############################################################################
#
#  Program :	ScriptName v1.0
#  Author  : 	Author
#  Website : 	https://yoursite.com
#  License :	Distributed under the terms of GNU GPL v3
#
#  ScriptName is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your discretion) any later version.
#
#  ScriptName is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
##############################################################################

set -euo pipefail
IFS=$'\n\t'

# Basic formatting for pretty output
#------------------------------------------------------------------------------

nl="\n"
be="\033[0m"
bo="\033[1m"
bb="\n\e[32m\033[1m::\033[0m "
eb="\n\e[31m\033[1m::\033[0m "


# return the script name on output
#------------------------------------------------------------------------------

PROGNAME=$(basename $0)
appname=$(sed 's/.*/\L&/; s/[a-z]*/\u&/g' <<<"$PROGNAME")


# a fatal error has occurred, no point continuing from here
#------------------------------------------------------------------------------

function fatal() {
    printf "${eb}${bo}${appname}:${be} ${1:-"Unknown Error"}\n" 1>&2
    exit 1
}

# check we're NOT running as root, warn and exit
# This can be changed by testing if user is NOT root != 0, then reverse the
# logic ( == becomes != ) so that this script MUST be run as root. Obviously,
# change the fatal message output to reflect this requirement.
#------------------------------------------------------------------------------

function root_check() {
    if [[ $EUID == 0 ]]; then
        fatal "Please do NOT run this script as root."${nl}
    fi
}

# make sure user is NOT running as root, otherwise inform them and exit
#------------------------------------------------------------------------------

root_check

# script start
#------------------------------------------------------------------------------


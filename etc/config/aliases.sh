#----------------------------------*-sh-*--------------------------------------
# =========                 |
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
#  \\    /   O peration     |
#   \\  /    A nd           | Copyright (C) 2011-2016 OpenFOAM Foundation
#    \\/     M anipulation  |
#------------------------------------------------------------------------------
# License
#     This file is part of OpenFOAM.
#
#     OpenFOAM is free software: you can redistribute it and/or modify it
#     under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     OpenFOAM is distributed in the hope that it will be useful, but WITHOUT
#     ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#     FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
#     for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with OpenFOAM.  If not, see <http://www.gnu.org/licenses/>.
#
# File
#     etc/config/aliases.sh
#
# Description
#     Aliases for working with OpenFOAM
#     Sourced from OpenFOAM-<VERSION>/etc/bashrc and/or ~/.bashrc
#
#------------------------------------------------------------------------------

# Change compiled version aliases
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias wmSet='. $WM_PROJECT_DIR/etc/bashrc'
alias wm64='wmSet WM_ARCH_OPTION=64'
alias wm32='wmSet WM_ARCH_OPTION=32'
alias wmSP='wmSet WM_PRECISION_OPTION=SP'
alias wmDP='wmSet WM_PRECISION_OPTION=DP'

# Refresh the environment
alias wmRefresh='wmSet $FOAM_SETTINGS'

# Clear env
alias wmUnset='. $WM_PROJECT_DIR/etc/config/unset.sh'

# Toggle wmakeScheduler on/off
#  - also need to set WM_HOSTS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias wmSchedOn='export WM_SCHEDULER=$WM_PROJECT_DIR/wmake/wmakeScheduler'
alias wmSchedOff='unset WM_SCHEDULER'

# Change directory aliases
# ~~~~~~~~~~~~~~~~~~~~~~~~
alias foam='cd $WM_PROJECT_DIR'

if [ -n "$WM_PROJECT_SITE" ]
then
    alias foamSite='cd $WM_PROJECT_SITE'
else
    alias foamSite='cd $WM_PROJECT_INST_DIR/site'
fi

alias src='cd $FOAM_SRC'
alias lib='cd $FOAM_LIBBIN'
alias app='cd $FOAM_APP'
alias sol='cd $FOAM_SOLVERS'
alias util='cd $FOAM_UTILITIES'
alias tut='cd $FOAM_TUTORIALS'
alias run='cd $FOAM_RUN'

alias prj='cd $WM_PROJECT_USER_DIR'
alias prjsrc='cd $WM_PROJECT_USER_DIR/src'
alias prjtut='cd $WM_PROJECT_USER_DIR/tutorials'
alias prjapp='cd $WM_PROJECT_USER_DIR/applications'
alias prjsol='cd $WM_PROJECT_USER_DIR/applications/solvers'
alias prjutil='cd $WM_PROJECT_USER_DIR/applications/utilities'

# Change OpenFOAM version
# ~~~~~~~~~~~~~~~~~~~~~~~
unset foamVersion
foamVersion()
{
    if [ "$1" ]; then
        foamInstDir=$FOAM_INST_DIR
        wmUnset
        . $foamInstDir/OpenFOAM-$1/etc/bashrc
        foam
        echo "Changed to OpenFOAM-$1" 1>&2
    else
        echo "OpenFOAM-$WM_PROJECT_VERSION" 1>&2
    fi
}


# Change ParaView version
# ~~~~~~~~~~~~~~~~~~~~~~~
unset foamPV
foamPV()
{
    . $WM_PROJECT_DIR/etc/config.sh/paraview ParaView_VERSION=$1
    echo "paraview-$ParaView_VERSION  (major: $ParaView_MAJOR)" 1>&2
}


#------------------------------------------------------------------------------

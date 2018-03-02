#!/bin/bash

apt-get update && apt-get upgrade -y

#################################################
# we need the system to be fresh and up to date #
# will break this into functions with a task    #
# sequence on the bottom half of the script     #
#################################################

addRepos (){
    add-apt-repository ppa:webupd8team/java -y
    add-apt-repository ppa:webupd8team/atom -y
    add-apt-repository ppa:obsproject/obs-studio -y

}

addApps(){

}

addRepos;

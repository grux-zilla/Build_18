#!/bin/bash

apt-get update && apt-get upgrade -y

#################################################
# we need the system to be fresh and up to date #
# will break this into functions with a task    #
# sequence on the bottom half of the script     #
#################################################

addRepos() {
    add-apt-repository ppa:webupd8team/java -y
    add-apt-repository ppa:webupd8team/atom -y
    add-apt-repository ppa:obsproject/obs-studio -y

}

apt-get update

addApps() {
  apt-get install vlc krita atom ffmpeg obs-studio redbook -y

echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections

  apt-get install oracle-java8-installer

  apt-get install git make screenfetch -y


}

addChrome() {
  sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb stable main" >> /etc/apt/sources.list.d/google-chrome.list'

  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  apt-get update
  apt-get install google-chrome-stable

}

apt-get -f install

addPapers() {

  mv "$(Build_18 $0)/Build_18/Wallpaper/*.jpg" /home/grux/Pictures
}

gitConf() {
  git config --global user.name "grux-zilla"
  git config --global user.email "gojirafan35@gmail.com"

}

apt-get update && apt-get upgrade -y


############################################
#          TASK SEQUENCE BEGINS            #
#          Order of Opperations            #
############################################


addApps;

  sleep 5

addRepos;

  sleep 5

addChrome;

  sleep 5

addPapers;

  sleep 5

gitConf;

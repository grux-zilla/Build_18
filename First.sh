#!/bin/bash

apt-get update && apt-get upgrade -y

#################################################
# we need the system to be fresh and up to date #
# will break this into functions with a task    #
# sequence on the bottom half of the script     #
#################################################

addRepos() {
    add-apt-repository ppa:webupd8team/java -y
}

apt-get update

addApps() {
  apt-get install vlc krita atom ffmpeg obs-studio redbook -y
  apt-get install snap snapcraft -y

  snap install skype --classic
  snap install atom
  snap install obs-studio
  snap install discord


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

secureLogin() {
  apt-get install libpam-google-authenticator
#after the install user should set up google authenticator on mobile device
#and can use the command below to add the auth method login
#  echo "auth required pam_google_authenticator.so" | sudo tee -a /etc/pam.d/gdm-password
}

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

#!/bin/bash

#install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


brew cask install google-chrome
brew cask install slack

brew tap caskroom/versions
brew cask install java8

#
# Setup Maven
# 

brew install maven
mv ~/.m2/settings.xml ~/.m2/settings.xml.bak
touch ~/.m2/settings.xml
echo '<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.1.0 http://maven.apache.org/xsd/settings-1.1.0.xsd">
  <mirrors>
    <mirror>
      <id>adjuster-releases</id>
      <url>http://gitlab.ad-juster.xyz:8081/artifactory/libs-release</url>
      <mirrorOf>*</mirrorOf>
    </mirror>
  </mirrors>

<!--   <servers>
    <server>
      <id>adjuster-releases</id>
      <username>{your name}</username>
      <password>{your encrypted pwd}</password>
    </server>
    <server>
      <id>adjuster-snapshots</id>
      <username>{your name}</username>
      <password>{your encrypted pwd}</password>
    </server>
  </servers> -->
</settings>' >> ~/.m2/settings.xml

#
# setup git
#
brew install git
git config --global user.name "Peter Fox"
git config --global user.email peter.fox@somewhere.com

#  Configure GitLab
ssh-keygen -t rsa -C "peter.fox@somewhere.com" -b 4096
pbcopy < ~/.ssh/id_rsa.pub
# add key to your gitlab: settings -> ssh keys

#Install IntelliJ
brew cask install intellij-idea-ce

#Install PyCharm
brew cask install pycharm-ce

#Install Visual Studio Code
brew cask install visual-studio-code

#
# Install MySQL
#
brew install mysql@5.7
brew services start mysql
mysql_secure_installation


#
# Random Garbage
#
brew cask install zsh zsh-completions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew cask install caffeine
brew cask install licecap
brew cask install sublime-text
brew cask install textmate

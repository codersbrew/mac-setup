#!/bin/bash

#install homebrew and xcode tools
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#install some must haves
brew install --cask google-chrome
brew install --cask discord
brew install --cask google-cloud-sdk
brew install --cask iterm2
bew install zsh

#Setup Terminal - https://catalins.tech/improve-mac-terminal/

#install git
git config --global user.name "Matthew Essenburg"
git config --global user.email xxx@essenburg.com
ssh-keygen -t ed25519 -C "xxx@essenburg.com"


#
#[alias]
#  st = status
#  ci = commit
#  br = branch
#  co = checkout
#
#brew tap caskroom/versions
#brew cask install java8

#
# Setup Maven
# 

#brew install maven
#mv ~/.m2/settings.xml ~/.m2/settings.xml.bak
#touch ~/.m2/settings.xml
#echo '<?xml version="1.0" encoding="UTF-8"?>
#<settings xmlns="http://maven.apache.org/SETTINGS/1.1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.1.0 http://maven.apache.org/xsd/settings-1.1.0.xsd">
#  <mirrors>
#    <mirror>
#      <id>adjuster-releases</id>
#      <url>http://gitlab.ad-juster.xyz:8081/artifactory/libs-release</url>
#      <mirrorOf>*</mirrorOf>
#    </mirror>
#  </mirrors>

#<!--   <servers>
#    <server>
#      <id>adjuster-releases</id>
#      <username>{your name}</username>
#      <password>{your encrypted pwd}</password>
#    </server>
#    <server>
#      <id>adjuster-snapshots</id>
#      <username>{your name}</username>
#      <password>{your encrypted pwd}</password>
#    </server>
#  </servers> -->
#</settings>' >> ~/.m2/settings.xml

#Install IntelliJ
#brew cask install intellij-idea-ce

#Install Webstorm
brew install --cask webstorm

#Install Visual Studio Code
brew install --cask visual-studio

#
# Install MySQL
#
#brew install mysql@5.7
#brew services start mysql
#mysql_secure_installation


#
# Random Garbage
#
brew cask install zsh zsh-completions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
#brew cask install caffeine
#brew cask install licecap
#brew cask install sublime-text
#brew cask install textmate

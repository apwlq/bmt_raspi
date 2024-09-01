#!/bin/bash

# 시스템 패키지 업데이트 및 업그레이드
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

# 폰트 설치
sudo apt install -y fonts-nanum fonts-unfonts-core

# wget, apt-transport-https, gnupg 설치
sudo apt-get install -y wget apt-transport-https gnupg

# Adoptium GPG 키 추가
wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | sudo apt-key add -

# Adoptium 패키지 저장소 추가
echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | sudo tee /etc/apt/sources.list.d/adoptium.list

# 패키지 목록 업데이트
sudo apt update

# Temurin 17 JDK 설치
sudo apt-get install -y temurin-17-jdk

# 스플래시 이미지 다운로드 및 적용
wget https://raw.githubusercontent.com/apwlq/bmt_raspi/main/splash.png -O splash.png
sudo cp splash.png /usr/share/plymouth/themes/pix
sudo plymouth-set-default-theme --rebuild-initrd pix

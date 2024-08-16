#!/bin/bash

# splash.png 파일 다운로드
wget https://raw.githubusercontent.com/apwlq/bmt_raspi/main/splash.png -O splash.png
if [ $? -ne 0 ]; then
  echo "Error: Failed to download splash.png"
  exit 1
fi

# 파일을 /usr/share/plymouth/themes/pix로 복사
sudo cp splash.png /usr/share/plymouth/themes/pix
if [ $? -ne 0 ]; then
  echo "Error: Failed to copy splash.png to /usr/share/plymouth/themes/pix"
  exit 1
fi

# 테마를 기본으로 설정하고 initrd를 재구성
sudo plymouth-set-default-theme --rebuild-initrd pix
if [ $? -ne 0 ]; then
  echo "Error: Failed to set the default Plymouth theme"
  exit 1
fi

# 성공 메시지 출력
echo "Setup completed successfully."

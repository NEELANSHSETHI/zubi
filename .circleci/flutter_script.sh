#!/bin/bash
git clone -b master https://github.com/flutter/flutter.git
export PATH=`pwd`/flutter/bin:$PATH
flutter doctor
yes | yes | flutter doctor --android-licenses
cd $HOME/code/zubi
flutter build apk --release
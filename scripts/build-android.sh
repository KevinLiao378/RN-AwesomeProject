#!/bin/bash
# 执行本脚本，打包 bundle 文件和资源文件到 Android 工程目录

if [ -n "$AWESOME_ANDROID_ROOT" ]; then
  # 打出 bundle 和资源文件到安卓工程目录
  npx react-native bundle --platform android --dev false --entry-file index.js --bundle-output $AWESOME_ANDROID_ROOT/app/src/main/assets/index.android.bundle --assets-dest $AWESOME_ANDROID_ROOT/app/src/main/res/
else
  # 未配置 AWESOME_ANDROID_ROOT 环境变量
  echo "error: 未配置 AWESOME_ANDROID_ROOT 环境变量。"
  echo "请先配置，如："
  echo "    export AWESOME_ANDROID_ROOT=~/Documents/AndroidProjects/awesome-android"
  echo "    export PATH=\$PATH:\$AWESOME_ANDROID_ROOT"
  exit 1
fi

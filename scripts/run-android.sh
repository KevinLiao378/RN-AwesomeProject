#!/bin/bash
# 执行本脚本，运行调试

# 启动应用需要 xmlstarlet 解析 AndroidManifest.xml 读取包名和 MAIN activity
if [ "x" = "x$(which xmlstarlet)" ]; then
    echo "error: xmlstarlet not found."
    echo "	     install it by 'brew install xmlstarlet'"
    exit 1
fi

if [ -n "$AWESOME_ANDROID_ROOT" ]; then
  # 强制启动 adb 服务
  adb start-server
  # 真机调试需要
  adb reverse tcp:8081 tcp:8081
  # 打包安装&运行
  chmod +x scripts/start-activity.command
  open scripts/start-activity.command
  # 启动 Metro 服务
  npx react-native start
else
  # 未配置 AWESOME_ANDROID_ROOT 环境变量
  echo "error: 未配置 AWESOME_ANDROID_ROOT 环境变量。"
  echo "请先配置，如："
  echo "    export AWESOME_ANDROID_ROOT=~/Documents/AndroidProjects/awesome-android"
  echo "    export PATH=\$PATH:\$AWESOME_ANDROID_ROOT"
  exit 1
fi

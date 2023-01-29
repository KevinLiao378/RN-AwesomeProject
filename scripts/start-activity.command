#!/bin/bash

start_activity() {
  MANIFEST=$AWESOME_ANDROID_ROOT/app/src/main/AndroidManifest.xml

  if [ "x" = "x$(which xmlstarlet)" ]; then
    echo "error: xmlstarlet not found."
    echo "	     install it by 'brew install xmlstarlet'"
    exit 1
  fi

  if [ ! -f $MANIFEST ]; then
    echo "error: $MANIFEST not found."
    exit 1
  fi
  # 读取清单文件，获取包名和 MAIN activity 名
  PACKAGE_NAME=$(xmlstarlet sel -t -v manifest/@package < $MANIFEST)
  ACTIVITY_NAME=$(xmlstarlet sel -t -v manifest/application/activity/@android:name < $MANIFEST)
  # 启动应用
  adb shell am start -a android.intent.action.MAIN -n $PACKAGE_NAME/$ACTIVITY_NAME
}
# 切换到 Android 项目根目录
cd $AWESOME_ANDROID_ROOT
# 打包运行&启动
./gradlew installDebug && start_activity

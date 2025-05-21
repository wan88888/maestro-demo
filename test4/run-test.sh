#!/bin/bash

# 检查参数
if [ $# -lt 1 ]; then
  echo "使用方法: $0 <平台>"
  echo "  平台: android 或 ios"
  exit 1
fi

PLATFORM=$1

# 根据平台设置不同的变量
if [ "$PLATFORM" == "android" ]; then
  # Android配置
  APP_ID=com.swaglabsmobileapp
  USERNAME_SELECTOR=test-Username
  PASSWORD_SELECTOR=test-Password
  LOGIN_BUTTON_SELECTOR=test-LOGIN
  PRODUCTS_LABEL=test-PRODUCTS
elif [ "$PLATFORM" == "ios" ]; then
  # iOS配置
  APP_ID=com.saucelabs.SwagLabsMobileApp
  USERNAME_SELECTOR=Username
  PASSWORD_SELECTOR=Password
  LOGIN_BUTTON_SELECTOR=LOGIN
  PRODUCTS_LABEL=PRODUCTS
else
  echo "不支持的平台: $PLATFORM"
  exit 1
fi

# 运行测试
echo "运行 $PLATFORM 测试"
maestro test login-flow.yaml \
  -e APP_ID="$APP_ID" \
  -e USERNAME_SELECTOR="$USERNAME_SELECTOR" \
  -e PASSWORD_SELECTOR="$PASSWORD_SELECTOR" \
  -e LOGIN_BUTTON_SELECTOR="$LOGIN_BUTTON_SELECTOR" \
  -e PRODUCTS_LABEL="$PRODUCTS_LABEL" 
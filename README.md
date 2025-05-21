# Maestro 自动化测试项目

本项目使用 [Maestro](https://maestro.mobile.dev/) 测试框架对 SauceLabs 示例应用进行自动化测试。

## 项目概述

该项目包含一系列测试案例，用于验证 SauceLabs 示例应用的功能，包括登录流程、异常登录处理和导航操作。测试使用 Maestro 框架实现，支持 Android 和 iOS 平台。

## 项目结构

```
maestro-demo/
├── test5/
│   ├── sauceLabs-aos-exception.yaml  # 主测试文件，包含异常测试场景
│   └── login-flow.yaml               # 可重用的登录流程子模块
```

## 测试案例说明

### 正常登录测试
- 使用标准用户账号登录
- 验证产品页面是否成功显示
- 测试退出登录功能

### 异常登录测试
1. **错误密码测试**
   - 使用正确用户名但错误密码
   - 验证错误消息 "Username and password do not match any user in this service."

2. **被锁定用户测试**
   - 使用被锁定的用户账号
   - 验证错误消息 "Sorry, this user has been locked out."

## 如何运行测试

### 单个测试运行

运行并行测试：

```bash
maestro test test1/ --shard-all=2
#or
maestro test test2/ --shard-split=2
```
运行不同平台测试：

```bash
cd test3
#运行Android测试
maestro test login-flow.yaml -e APP_ID=com.swaglabsmobileapp
#运行iOS测试
maestro test login-flow.yaml -e APP_ID=com.saucelabs.SwagLabsMobileApp
#or
cd test4
./run-test.sh android
./run-test.sh ios
```
运行异常场景测试：

```bash
cd test5
maestro test sauceLabs-aos-exception.yaml
```

### 参数化测试

项目使用子流程和环境变量实现参数化测试，支持：

1. **登录流程参数化**
   - 通过 `username` 和 `password` 环境变量传递不同的登录凭据

示例：
```yaml
- runFlow:
    file: login-flow.yaml
    env:
      username: "standard_user"
      password: "secret_sauce"
```

## 设计理念

### 代码重用

使用子流程提取常见操作，如登录流程，减少代码重复，提高可维护性。

### 参数化测试

通过环境变量向子流程传递参数，使测试具有更高的灵活性和扩展性。

### 错误处理

包含异常情况的测试，确保应用在各种条件下的行为符合预期。

## 已知问题和限制

- Maestro 不支持 `runScript` 和 `extendedWait` 等高级功能
- 需要确保设备已正确连接并配置

## 平台支持

- Android：已完全测试
- iOS：需要平台特定配置

## 依赖项

- Maestro 测试框架
- Android/iOS 设备或模拟器
- SauceLabs 示例应用 
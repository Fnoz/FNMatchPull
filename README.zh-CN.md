# FNMatchPull ![Supported Platforms](https://img.shields.io/cocoapods/p/FNMatchPull.svg) [![Latest pod release](https://img.shields.io/cocoapods/v/FNMatchPull.svg)](https://cocoapods.org/pods/UIImageView+Extension) [![Build Status](https://travis-ci.org/alexandreos/FNMatchPull.svg?branch=master)]() [![License](https://img.shields.io/cocoapods/l/FNMatchPull.svg)](https://github.com/lm2343635/UIImageView-Extension/LICENSE)

Swift实现的火柴图案&火柴文字下拉刷新动效（超炫酷下拉刷新），Swift&加强版本CBStoreHouseRefreshControl.
### 安装
通过[CocoaPods](http://cocoapods.org/)安装，手动安装直接将FNMatchPull/FNMatchPull目录下的文件复制到工程中。

```ruby
pod 'FNMatchPull', '~> 0.2'
```
### 基础使用Demo

#### Style = .Pattern类型
动画内容为火柴棒组成的图案

```
let matchAnimator = FNMatchPullAnimator(frame: CGRectMake(0, 0, 320, 80))
matchAnimator.startPoints = [NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 30, 25)),
NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 30, 55))]
matchAnimator.endPoints = [NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 15 - 30, 40)),
NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 15 - 30, 40))]
tableView.addPullToRefreshWithAction({
//refresh action
}, withAnimator: matchAnimator)
```

#### Style = .Text类型
传入英文字符串，自动转换为图案动画，可自定义线条宽度

```
let matchAnimator = FNMatchPullAnimator(frame: CGRectMake(0, 0, 320, 80))
matchAnimator.text = "FNOZ"
matchAnimator.lineWidth = 4.0
matchAnimator.style = .Text
tableView.addPullToRefreshWithAction({
//refresh action
}, withAnimator: matchAnimator)
```

### 效果
![Animating](readme_images/00.gif)
![Animating](readme_images/01.gif)

![Animating](readme_images/02.gif)

### 来源
OC原版是 [coolbeet](https://github.com/coolbeet) 的 [CBStoreHouseRefreshControl](https://github.com/coolbeet/CBStoreHouseRefreshControl)，另外增加了酷酷的直接把英文字符串变成图片的功能。

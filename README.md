# 金山云短视频解决方案Core版 KSVSShortVideoCore_iOS
**“短视频” 相关项目说明**
![此处输入图片的描述][1]
1. KSYMediaEditorKit_iOS短视频SDK，只包含短视频相关功能。如果单独使用这个SDK，需要自己实现APP展示效果、上传、播放等。在使用时，必须通过短视频SDK和上传的鉴权流程
2. KSVSShortVideoCore短视频解决方案核心SDK，包含短视频SDK所有接口，并且还增加上传、智能推荐(暂时未开放)。如果使用这个SDK，需要自己实现APP展示效果和播放等。在使用时，只需要完成解决方案的鉴权过程，不在需要进行其他的鉴权过程
3. KSVSShortVideoKit_iOS 短视频解决方案，包含短视频SDK一部分功能，支持视频上传、播放、智能推荐，并且实现了一套直接可用的展示效果。如果使用这个SDK，只需要在完成鉴权的前提下开启相应的界面，用户可以快速的进行集成。
## 1 简述
短视频解决方案目前有两个版本：[Kit版][2]，Core版（自定义UI），Kit版依赖Core版的功能；
### 二者共同特性
都集有视频采集、编辑、上传、转码、存储、推荐、播放功能；使用之前都需要先通过鉴权
### 二者区别如下
Kit版：SDK自带UI，没有开放上传接口；
Core版：SDK不含UI，开放上传接口


### Core版结构图如下

![此处输入图片的描述][3]
### 2.1 Core版架构流程描述
* APP 集成该方案SDK时，需要先鉴权才能使用短视频解决方案后续功能
* Core版本解决方案包含上传上传图片（头像、封面）、视频功能，上传至金山云端
* 录制、编辑、美颜等功能由金山云短视频SDK（KSYMediaEditorKit）提供，使用时需要自己去调用KSYMediaEditorKit相应的接口、配置相关属性，KSYMediaEditorKit与解决方案SDK是两个独立的部分，而鉴权操作统一由解决方案SDK处理即可
* 播放功能由KSYMediaPlayer提供，使用时需要自己去调用KSYMediaPlayer相应的接口、配置相关属性

### 2.2 鉴权流程
短视频解决方案有一个更加安全、合理的鉴权方案，保证APP以及用户数据的安全。具体的鉴权流程如下：
1. 申请SDK Token并且调用SDK提供的鉴权接口
2. APP 向解决方案提供User Token，可以增加二次鉴权逻辑。(注:User Token 可以不提供)
3. 解决方案向SDK Server 验证SDK Token是否正确
4. SDK Server 向APP Server验证User Token 是否正确

鉴权流程图解如下：

![image](https://raw.githubusercontent.com/wiki/ksvc/KSVSShortVideoKit_Android/images/auth.png)

## 4 接入流程

### 4.1 申请流程
1. 若购买短视频解决方案套餐包，需进入[金山云短视频解决方案官网](https://www.ksyun.com/post/solution/KSVS)，点击“购买套餐包”，确认购买，填写表单信息，授权token会以邮件的形式提供。
2. 若单独购买短视频SDK，联系金山云销售进行授权申请，或者直接拨打：62927777 转 5120

### 4.2 集成流程
1. 从github克隆KSVSShortVideoCore_iOS工程，进入KSVSApiDemo目录下，用Xcode打开KSVSApiDemo.xcworkspace，将Frameworks目录下的KSVSSdkCore拖进自己的工程中

```
github 地址：https://github.com/ksvc/KSVSShortVideoCore_iOS.git
```
通过cocoapods依赖其他相关项目

```
pod 'KSYMediaEditorKit', '~> 1.6.1'
pod 'UICKeyChainStore'
pod 'FMDB'
pod 'AFNetworking', '~> 3.0'
```    
    
2. 直接使用cocoapods引用（**推荐**）    
pod 'KSVSShortVideoCore_iOS', '~>1.1.0'     

3. 具体的接口使用，请在[WIKI](https://github.com/ksvc/KSVSShortVideoCore_iOS/wiki) 查看或参考Demo

## 5 反馈与建议
### 5.1 反馈模版
|类型|描述|
|:--:|:--:|
|SDK名称    |KSVSShortVideoCore_iOS|
|SDK版本    |v1.0.0|
|设备型号    |iPhone 6|
|OS版本    |iOS8|
|问题描述    |描述问题出现的现象|
|操作描述    |描述经过如何操作出现上述问题|
|额外附件|文本形式控制台log、crash报告、其他辅助信息（界面截屏或录像等）|
### 5.2 短视频解决方案咨询
金山云官方产品客服，帮您快速了解对接金山云短视频解决方案：

![image](https://raw.githubusercontent.com/wiki/ksvc/KSVSShortVideoKit_Android/images/wechat.png)
### 5.3 联系方式
* 主页：[金山云](http://www.ksyun.com/)
* 邮箱: zengfanping@kingsoft.com
* QQ讨论群：
* 574179720 视频云技术交流群
* 621137661 视频云iOS技术交流
* 以上两个加一个QQ群即可
* Issues: https://github.com/ksvc/KSVSShortVideoCore_iOS/issues


[1]: https://raw.githubusercontent.com/wiki/ksvc/KSVSShortVideoKit_Android/images/shortvideoios_api.png
[2]: https://github.com/ksvc/KSVSShortVideoKit_iOS
[3]: https://raw.githubusercontent.com/wiki/ksvc/KSVSShortVideoKit_iOS/svApiStructure.png

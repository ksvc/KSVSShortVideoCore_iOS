//
//  ApiDemoDefines.h
//  KSVSSdkApiDemo
//
//  Created by devcdl on 2017/12/26.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#ifndef ApiDemoDefines_h
#define ApiDemoDefines_h

#define DEMO_RELEASE

#define kCurrUser ([DemoUser shared])

#define DEMO_BUNDLEID ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"])

#define DEMO_SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)

#define APIDEMO_HIDE_STATUS_BAR ([UIApplication sharedApplication].statusBarHidden = YES)

/**
 * 用于KSVSDK 鉴权的token，由金山云颁发给客户
 */
#ifdef DEMO_RELEASE
#define DEMO_TOKEN @"ff9737a56f0805482b1dff8fb662c784"
#else
#define DEMO_TOKEN @"123b808763ebb21576c4345b8944d7a6"
#endif

#endif /* ApiDemoDefines_h */

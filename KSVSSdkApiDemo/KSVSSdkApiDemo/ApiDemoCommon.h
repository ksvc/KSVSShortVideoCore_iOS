//
//  ApiDemoCommon.h
//  KSVSSdkApiDemo
//
//  Created by devcdl on 2017/12/26.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiDemoCommon : NSObject

+ (KSYCameraRecorder *)recorderWithMaxDuration:(NSTimeInterval)maxDuration;

+ (NSString *)formattedCurrentTime:(NSTimeInterval)currentTime;

@end

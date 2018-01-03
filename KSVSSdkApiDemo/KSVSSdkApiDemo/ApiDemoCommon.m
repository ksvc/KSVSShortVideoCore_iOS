//
//  ApiDemoCommon.m
//  KSVSSdkApiDemo
//
//  Created by devcdl on 2017/12/26.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import "ApiDemoCommon.h"
#import "ApiDemoRecordConfigModel.h"

@implementation ApiDemoCommon

+ (KSYCameraRecorder *)recorderWithMaxDuration:(NSTimeInterval)maxDuration {
    
    KSYCameraRecorder *aRecrder = [[KSYCameraRecorder alloc] init];
    
    ApiDemoRecordConfigModel *recordModel = [[ApiDemoRecordConfigModel alloc] init];
    recordModel.resolution = KSYRecordPreset720P;
    recordModel.fps = 30;
    recordModel.videoKbps = 4096;
    recordModel.audioKbps = 64;
    recordModel.orientation = KSYOrientationVertical;
    
    CGSize resolution = [recordModel getResolutionFromPreset];
    aRecrder.previewDimension = resolution;
    aRecrder.outputVideoDimension = resolution;
    
    aRecrder.videoFrameRate = (int)recordModel.fps;
    
    aRecrder.videoBitrate = (int)recordModel.videoKbps;
    
    aRecrder.audioBitrate = (int)recordModel.audioKbps;
    // 视频方向
    if (recordModel.orientation == KSYOrientationHorizontal){
        aRecrder.videoOrientation = UIInterfaceOrientationLandscapeRight;
    }
    // 默认开启 前置摄像头
    aRecrder.cameraPosition = AVCaptureDevicePositionFront;
    // 设置最短、最长录制时间
    aRecrder.minRecDuration = 5;
    aRecrder.maxRecDuration = maxDuration;
    if (maxDuration < 5) {
        aRecrder.maxRecDuration = 60;
    }
    
    return aRecrder;
}

+ (NSString *)formattedCurrentTime:(NSTimeInterval)currentTime {
    NSUInteger time = (NSUInteger)currentTime;
    NSInteger hours = (time / 3600);
    NSInteger minutes = (time / 60) % 60;
    NSInteger seconds = time % 60;
    NSString *format = @"%02i:%02i:%02i";
    return [NSString stringWithFormat:format, hours, minutes, seconds];
}

@end

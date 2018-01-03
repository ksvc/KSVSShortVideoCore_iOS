//
//  ApiDemoRecordConfigModel.m
//  KSVSSdkApiDemo
//
//  Created by devcdl on 2017/12/26.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import "ApiDemoRecordConfigModel.h"

@implementation ApiDemoRecordConfigModel

- (CGSize)getResolutionFromPreset{
    CGSize resolution = CGSizeZero;
    switch (_resolution) {
        case KSYRecordPreset540P:
            resolution = CGSizeMake(540, 960);
            break;
        case KSYRecordPreset720P:
            resolution = CGSizeMake(720, 1280);
            break;
        case KSYRecordPreset1080P:
            resolution = CGSizeMake(1080, 1920);
            break;
        default:
            resolution = CGSizeMake(1080, 1920);
            break;
    }
    return resolution;
}

@end

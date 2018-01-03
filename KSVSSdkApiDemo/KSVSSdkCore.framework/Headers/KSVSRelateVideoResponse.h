//
//  KSVSRelateVideoResponse.h
//  KSVSSdk
//
//  Created by devcdl on 2017/11/16.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import "KSVSRespons.h"
#import "KSVSVideoModel.h"

@interface KSVSRelateVideoData : NSObject
@property (nonatomic, strong) NSArray<KSVSVideoModel*> *Videos;
@end

@interface KSVSRelateVideoResponse : KSVSRespons
@property (nonatomic, strong) KSVSRelateVideoData *Data;
@end

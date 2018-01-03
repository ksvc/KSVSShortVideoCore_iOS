//
//  KSVSSquareListResponse.h
//  KSVSShortVideoDev
//
//  Created by devcdl on 2017/11/14.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import "KSVSRespons.h"
#import "KSVSVideoModel.h"

@interface KSVSSquareListData : NSObject
@property (nonatomic, copy) NSNumber *Size;                    // 当前页数据量
@property (nonatomic, copy) NSNumber *LoadCursor;              // 加载游标，存在即回传
@property (nonatomic, copy) NSNumber *RefreshCursor;           // 更新游标，存在即回传
@property (nonatomic, copy) NSArray<KSVSVideoModel*> *Videos;  // 视频数据集
@end

@interface KSVSSquareListResponse : KSVSRespons
@property (nonatomic, strong) KSVSSquareListData *Data;
@end

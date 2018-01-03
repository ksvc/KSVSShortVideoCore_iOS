//
//  KSVSSquareTabsResponse.h
//  KSVSShortVideoDev
//
//  Created by devcdl on 2017/11/14.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import "KSVSRespons.h"

@interface KSVSSquareTabsModel : NSObject
@property (nonatomic, copy) NSString *Id;      // 标签id
@property (nonatomic, copy) NSString *Column;  // 标签名称
@end

@interface KSVSSquareTabsData : NSObject
@property (nonatomic, strong) NSArray<KSVSSquareTabsModel*> *Columns;
@end

@interface KSVSSquareTabsResponse : KSVSRespons
@property (nonatomic, strong) KSVSSquareTabsData *Data;
@end

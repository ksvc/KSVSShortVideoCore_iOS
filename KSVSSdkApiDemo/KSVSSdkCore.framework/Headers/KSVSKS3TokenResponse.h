//
//  KSVSKS3TokenResponse.h
//  KSVSSdk
//
//  Created by devcdl on 2017/11/28.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import "KSVSRespons.h"

@interface KSVSKS3TokenCustomHeader : NSObject
@property (nonatomic, copy) NSString *v_uid;
@property (nonatomic, copy) NSString *v_hash;
@property (nonatomic, copy) NSString *v_timestamp;
@end

@interface KSVSKS3TokenData : NSObject
@property (nonatomic, copy) NSString *Bucket;
@property (nonatomic, copy) NSString *Endpoint;
@property (nonatomic, copy) NSString *ObjectKey;
@property (nonatomic, copy) NSString *Date;
@property (nonatomic, copy) NSString *Authorization;
@property (nonatomic, strong) KSVSKS3TokenCustomHeader *CustomHeader;
@end

@interface KSVSKS3TokenResponse : KSVSRespons
@property (nonatomic, strong) KSVSKS3TokenData *Data;
@end

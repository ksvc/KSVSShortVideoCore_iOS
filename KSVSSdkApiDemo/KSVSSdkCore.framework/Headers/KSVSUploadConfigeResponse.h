//
//  KSVSUploadConfigeResponse.h
//  KSVSSdk
//
//  Created by devcdl on 2017/11/21.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import "KSVSRespons.h"


@interface KSVSUploadConfigeData : NSObject
@property (nonatomic, strong) NSString *Bucket;
@property (nonatomic, strong) NSString *Endpoint;
@property (nonatomic, strong) NSString *Domain;
@property (nonatomic, strong) NSString *VideoDir;
@property (nonatomic, strong) NSString *CoverDir;
@property (nonatomic, strong) NSString *VideoName;
@property (nonatomic, strong) NSString *CoverName;
@property (nonatomic, strong) NSString *CustomDir;
@property (nonatomic, strong) NSString *CustomName;
@property (nonatomic, strong) NSString *Acl;
@end

@interface KSVSUploadConfigeResponse : KSVSRespons

@property (nonatomic, strong) KSVSUploadConfigeData *Data;

@end

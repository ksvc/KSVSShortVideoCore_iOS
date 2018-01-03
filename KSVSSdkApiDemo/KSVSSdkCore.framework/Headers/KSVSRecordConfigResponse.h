//
//  KSVSRecordConfigResponse.h
//  KSVSShortVideoDev
//
//  Created by devcdl on 2017/10/26.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import "KSVSRespons.h"

typedef NS_ENUM(NSInteger, KSVSMusicDownloadState) {
    KSVSMusicDownloadStateNone = 0,     // 未下载，也未加入下载队列
    KSVSMusicDownloadStateWaiting,      // 等待下载
    KSVSMusicDownloadStateDownloading,  // 正在下载
    KSVSMusicDownloadStateDownloaded    // 已经下载
};

@interface KSVSRecordConfigTagModel : NSObject
@property (nonatomic, copy) NSString *Id;           // （视频）标签id
@property (nonatomic, copy) NSString *Name;         // （视频）标签名称
@end

@interface KSVSRecordConfigMusicModel : NSObject
@property (nonatomic, copy) NSString *Id;                            // 音乐id
@property (nonatomic, copy) NSString *Name;                          // 音乐名称
@property (nonatomic, copy) NSString *Download;                      // 音乐下载URL
@property (nonatomic, copy) NSString *Audition;                      // 音乐试听URL
@property (nonatomic, copy) NSString *localCacheAudition;
@property (nonatomic, assign) BOOL    selected;
@property (nonatomic, assign) KSVSMusicDownloadState downloadState;
@end

@interface KSVSRecordConfigFilterModel : NSObject
@property (nonatomic, copy) NSString *Id;                  // 滤镜ID
@property (nonatomic, copy) NSString *Name;                // 滤镜名称
@property (nonatomic, copy) NSString *UrlSmall;            // 滤镜图片URL 小
@property (nonatomic, copy) NSString *UrlLarge;            // 滤镜图片URL 大
@property (nonatomic, copy) NSString *Type;                // 滤镜类型
@property (nonatomic, copy) NSString *Version;             // 滤镜支持版本
@property (nonatomic, assign) BOOL selected;
+ (KSVSRecordConfigFilterModel *)copyFilter:(KSVSRecordConfigFilterModel *)filter;
@end

@interface KSVSRecordConfigData : NSObject
// 滤镜配置
@property (nonatomic, strong) NSArray<KSVSRecordConfigFilterModel*> *Filters;
// 背景音乐配置
@property (nonatomic, strong) NSArray<KSVSRecordConfigMusicModel*> *Music;
// 视频标签配置
@property (nonatomic, strong) NSArray<KSVSRecordConfigTagModel*> *Tags;
@end

@interface KSVSRecordConfigResponse : KSVSRespons
@property (nonatomic, strong) KSVSRecordConfigData *Data;
@end

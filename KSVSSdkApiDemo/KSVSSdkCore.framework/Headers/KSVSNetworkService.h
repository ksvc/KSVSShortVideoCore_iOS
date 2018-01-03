//
//  KSVSNetworkService.h
//  KSVSShortVideoDev
//
//  Created by devcdl on 2017/10/26.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSVSRecordConfigResponse.h"
#import "KSVSSquareTabsResponse.h"
#import "KSVSSquareListResponse.h"
#import "KSVSRelateVideoResponse.h"
#import "KSVSVideoInfoResponse.h"
#import "KSVSPraiseResponse.h"
#import "KSVSUploadConfigeResponse.h"
#import "KSVSReleasedVideoResponse.h"
#import "KSVSKS3TokenResponse.h"
#import "KSVSUploadFinishResponse.h"

#import "KSVSDeleteReleasedVideoResponse.h"
#import "UIView+toast.h"
#import "KSVSErrorCodeDefines.h"

#import "YYReachability.h"

#define kKSVSNetworkReachable ([YYReachability reachability].isReachable)

#define KSVS_SHOW_NO_NETWORK ([self.view makeToast:kSVSNoNetworkString duration:0.6 position:[NSValue valueWithCGPoint:self.view.center] style:nil])

@interface KSVSNetworkService : NSObject

/**
 * @abstract 获取视频录制基础配置（滤镜配置、背景音乐配置、视频标签配置，详情可参考KSVSRecordConfigResponse中属性）
 * @param completeHandler 请求结束后的回调 （响应数据请查看KSVSRecordConfigResponse中的属性）
 */
+ (void)fetchRecordBaseConfigWithCompletion:(void(^_Nullable)(KSVSRecordConfigResponse * _Nullable response, KSVSError * _Nullable ksvsError))completeHandler;

/**
 * @abstract 获取广场页标签（视频类型）
 * @param uid 用户id
 * @param completeHandler 请求结束后的回调 （响应数据请查看KSVSSquareTabsResponse中的属性）
 */
+ (void)fetchRecommendTabsWithUid:(NSString *_Nullable)uid
                       completion:(void(^_Nullable)(KSVSSquareTabsResponse * _Nullable response ,KSVSError * _Nullable ksvsError))completeHandler;

/**
 * @abstract 获取广场页标签下视频列表（某一类型视频的列表）
 * @param tabId 视频标签（视频类型）
 * @param firstFetch 是否是第一次获取（页面生命周期内）
 * @param loadCursor 加载游标，当上次请求的响应数据中包含时，下次请求需回传（首屏拉取无需传递，非首屏拉取时不传则按照首屏拉取处理）
 * @param refreshCursor 刷新游标，当上次请求的响应数据中包含时，下次请求需回传（首屏拉取无需传递，非首屏拉取时不传则按照首屏拉取处理）
 * @param refreshAction 拉取动作：PULL（首屏拉取），PULLUP（向上拉取），PULLDOWN（向下拉取）
 * @param completeHandler 请求结束的回调 （响应数据请查看KSVSSquareListResponse中的属性）
 */
+ (void)fetcSquareListWithTabId:(NSString *_Nullable)tabId
                     firstFetch:(BOOL)firstFetch
                      fetchSize:(NSInteger)fetchSize
                     loadCursor:(NSNumber *_Nullable)loadCursor
                  refreshCursor:(NSNumber *_Nullable)refreshCursor
                  refreshAction:(NSString *_Nullable)refreshAction
                     completion:(void(^_Nullable)(KSVSSquareListResponse * _Nullable response ,KSVSError * _Nullable ksvsError))completeHandler;

/**
 * @abstract 背景音乐下载
 * @param urlString 音乐地址
 * @param progressBlock 下载进度变化时的回调（更新下载进度条）
 * @param completeHandler 下载请求结束后的回调
 */
+ (NSURLSessionDownloadTask *_Nullable)downloadMusicWithUrl:(NSString *_Nullable)urlString
                                     progressBlock:(void(^_Nullable)(float progress))progressBlock
                                   completionBlock:(void(^_Nullable)(NSError * _Nullable aError, NSURL * _Nullable filePath))completeHandler;

/**
 * @abstract 获取上传签名（上传视频、封面、头像时需要的签名）
 */
+ (void)fetchUploadSignatureWithParametres:(NSDictionary *_Nullable)parametres
                                completion:(void(^_Nullable)(KSVSKS3TokenResponse * _Nullable response ,KSVSError * _Nullable ksvsError))completeHandler;

/**
 * 上传视频时需要的配置数据
 */
+ (void)fetchUploadConfigWithUid:(NSString *_Nullable)uid
                      completion:(void(^_Nullable)(KSVSUploadConfigeResponse * _Nullable response ,KSVSError * _Nullable ksvsError))completeHandler;

/**
 * 上传视频和封面结束后，上报上传成功
 */
+ (void)reportReleasedVideoInfoWithParams:(NSDictionary *_Nullable)params
                               completion:(void(^_Nullable)(KSVSUploadFinishResponse * _Nullable response ,KSVSError * _Nullable ksvsError))completion;

/**
 * @abstract 获取相关视频（与某一视频相关的视频集）
 * @param videoId 视频id
 * @param tabId 视频标签
 * @param fetchSize 请求数量，未指定时为10
 */
+ (void)fetchRelateVideoListWithVideoId:(NSString *_Nullable)videoId
                                  tabId:(NSString *_Nullable)tabId
                              fetchSize:(NSInteger)fetchSize
                             completion:(void(^_Nullable)(KSVSRelateVideoResponse * _Nullable response ,KSVSError * _Nullable ksvsError))completeHandler;

/**
 * @abstract 获取视频详情（播放页详情）
 * @param videoId 视频id
 * @param completeHandler 请求结束后的回调
 */
+ (void)fetchVideoInfoWithVideoId:(NSString *_Nullable)videoId
                       completion:(void(^_Nullable)(KSVSVideoInfoResponse * _Nullable response ,KSVSError * _Nullable ksvsError))completeHandler;

/**
 * @abstract 视频点赞（暂不支持取消赞）
 * @param videoId 视频id
 * @param tabId 视频标签
 * @param completeHandler 点赞请求结束后的回调
 */
+ (void)praiseRequestWithVideoId:(NSString *_Nullable)videoId
                           tabId:(NSString *_Nullable)tabId
                      completion:(void(^_Nullable)(KSVSPraiseResponse * _Nullable response ,KSVSError * _Nullable ksvsError))completeHandler;
/**
 * @abstract 获取已发布视频列表
 * @param userId 用户id
 * @param page 分页页码，未指定时为1。 页面计数从1开始
 * @param size 单次页容量，未指定时为10，最大不可超过50条，超过50按50计算
 * @param completion 请求结束后的回调
 */
+ (void)fetchReleasedVideoWithUserId:(NSString *_Nullable)userId
                                page:(NSInteger)page
                                size:(NSInteger)size
                          completion:(void(^_Nullable)(KSVSReleasedVideoResponse * _Nullable response ,KSVSError * _Nullable ksvsError))completion;

/**
 * @abstract 删除已发布的视频
 * @param userId 用户id
 * @param videoId 视频id
 * @param completion 删除请求结束后的回调
 */
+ (void)deleteReleasedVideoWithUserId:(NSString *_Nullable)userId
                              videoId:(NSString *_Nullable)videoId
                           completion:(void(^_Nullable)(KSVSDeleteReleasedVideoResponse * _Nullable response ,KSVSError * _Nullable ksvsError))completion;

@end

//
//  UploadViewController.h
//  KSVSSdkApiDemo
//
//  Created by devcdl on 2017/12/26.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UploadViewController : UIViewController

@property (nonatomic, copy)   NSURL *concatedVideoPath;

@property (nonatomic, copy) void(^uploadFinishBlock)(NSString *playVideoPath);

@end

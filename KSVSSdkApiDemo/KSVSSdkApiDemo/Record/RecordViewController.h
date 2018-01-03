//
//  RecordViewController.h
//  KSVSSdkApiDemo
//
//  Created by devcdl on 2017/12/26.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordViewController : UIViewController

@property (nonatomic, copy) void(^dismissBlock)(NSArray *videoList);

@end

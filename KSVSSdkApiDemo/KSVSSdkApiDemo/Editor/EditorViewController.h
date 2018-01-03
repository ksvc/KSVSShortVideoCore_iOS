//
//  EditorViewController.h
//  KSVSSdkApiDemo
//
//  Created by devcdl on 2017/12/26.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditorViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *videoList;

@property (nonatomic, copy) void(^concatFinishBlock)(NSURL *path);

@end

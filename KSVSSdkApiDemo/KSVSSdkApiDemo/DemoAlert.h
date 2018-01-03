//
//  DemoAlert.h
//  KSVSSdkApiDemo
//
//  Created by devcdl on 2017/12/26.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;

@interface DemoAlert : NSObject

+ (void)showAlert:(NSString *)alertString forViewController:(UIViewController *)viewController;

@end

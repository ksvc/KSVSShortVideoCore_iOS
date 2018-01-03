//
//  EditorViewController.m
//  KSVSSdkApiDemo
//
//  Created by devcdl on 2017/12/26.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import "EditorViewController.h"

@interface EditorViewController ()<KSYMEConcatorDelegate>
@property (nonatomic, strong) KSYMEConcator *concator;
@end

@implementation EditorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)closeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setVideoList:(NSMutableArray *)videoList {
    _videoList = videoList;
    
}

- (IBAction)startConcat:(UIButton *)sender {
    if (!_concator) {
        self.concator = [[KSYMEConcator alloc] init];
        self.concator.delegate = self;
    }
    if (noErr == [self.concator addVideos:self.videoList]) {
        [self.concator startConcat];
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
}

#pragma mark ----- KSYMEConcatorDelegate

- (void)onConcatError:(KSYMEConcator *)concator error:(KSYStatusCode)error extraStr:(NSString *)extraStr {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSLog(@"concat error %@",extraStr);
}

- (void)onConcatFinish:(NSURL *)path {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path.relativePath]) {
        if (self.concatFinishBlock) {
            self.concatFinishBlock(path);
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        NSLog(@"合成视频缓存失败");
    }
}

- (void)onConcatFileIndex:(NSInteger)idx progressChanged:(float)value {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.view];
    [hud setProgress:value];
    hud.label.numberOfLines = 3;
    hud.label.text = [NSString stringWithFormat:@"视频合成\n idx:%ld \nprogress:%.2f %%",idx, value * 100];
}

@end

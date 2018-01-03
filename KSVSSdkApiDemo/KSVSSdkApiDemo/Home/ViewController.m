//
//  ViewController.m
//  KSVSSdkApiDemo
//
//  Created by devcdl on 2017/12/26.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import "ViewController.h"
#import "RecordViewController.h"
#import "EditorViewController.h"
#import "UploadViewController.h"
#import "VideoPlayerViewController.h"
#import "UIView+Toast.h"

@interface ViewController ()
@property (nonatomic, assign) BOOL hasAuthed;
@property (weak, nonatomic) IBOutlet UILabel *authStateLab;
@property (weak, nonatomic) IBOutlet UILabel *recordedVideoPathLab;
@property (weak, nonatomic) IBOutlet UILabel *editoredVideoPathLab;
@property (weak, nonatomic) IBOutlet UILabel *releasedVideoPathLab;
@property (weak, nonatomic) IBOutlet UILabel *playVideoPathLab;

@property (nonatomic, strong) NSMutableArray *videoList;
@property (nonatomic, copy)   NSURL *concatedVideoPath;
@property (nonatomic, copy)   NSString *playVideoPath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hasAuthed = [KSVSAuthService authState];
    self.authStateLab.text = [NSString stringWithFormat:@"鉴权状态：%@", _hasAuthed ? @"YES" : @"NO"];
    [self setupViews];
    [YYReachability reachabilityWithHostname:@"http://www.ksyun.com/"];
}

- (void)setupViews {
    _recordedVideoPathLab.numberOfLines = 0;
    _editoredVideoPathLab.numberOfLines = 0;
    _recordedVideoPathLab.numberOfLines = 0;
    _playVideoPathLab.numberOfLines = 0;
    _releasedVideoPathLab.numberOfLines = 0;
}

- (NSMutableArray *)videoList {
    if (!_videoList) {
        _videoList = [NSMutableArray new];
    }
    return _videoList;
}

// 鉴权
- (IBAction)authAction:(UIButton *)sender {
    if (self.hasAuthed) {
        [DemoAlert showAlert:@"已经鉴权过了，无需重复鉴权！" forViewController:self];
        return;
    }
    NSString *bundleId = DEMO_BUNDLEID;
    NSString *ksvsToken = DEMO_TOKEN;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    __weak typeof(self) weakSelf = self;
    [KSVSAuthService authWithBundleIdentifier:bundleId ksvsToken:ksvsToken accessToken:nil success:^{
        typeof(weakSelf) strongSelf = weakSelf;
        [MBProgressHUD hideHUDForView:strongSelf.view animated:YES];
        strongSelf.hasAuthed = YES;
        strongSelf.authStateLab.text = @"鉴权状态：YES";
    } failure:^(KSVSError *ksvsError) {
        typeof(weakSelf) strongSelf = weakSelf;
        [MBProgressHUD hideHUDForView:strongSelf.view animated:YES];
        NSString *alertString = [NSString stringWithFormat:@"鉴权失败(%zd)", ksvsError.errorCode];
        [DemoAlert showAlert:alertString forViewController:strongSelf];
        strongSelf.hasAuthed = NO;
        strongSelf.authStateLab.text = @"鉴权状态：NO";
    }];
}

- (IBAction)clearAuthInfo:(id)sender {
    if ([KSVSAuthService clearAuthInfo]) {
        self.hasAuthed = NO;
        self.authStateLab.text = @"鉴权状态：NO";
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    UIViewController *destinationVC = [segue destinationViewController];
    __weak typeof(self) weakSelf = self;
    if ([destinationVC isKindOfClass:[RecordViewController class]]) {
        RecordViewController *recordVC = (RecordViewController *)destinationVC;
        recordVC.dismissBlock = ^(NSArray *videoList) {
            typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf.videoList removeAllObjects];
            [strongSelf.videoList addObjectsFromArray:videoList];
            NSString *videoUrl = [strongSelf.videoList.firstObject relativePath];
            strongSelf.recordedVideoPathLab.text = [NSString stringWithFormat:@"已录制视频地址: %@", videoUrl];
        };
    } else if ([destinationVC isKindOfClass:[EditorViewController class]]) {

        if (!self.hasAuthed) {
            [self noAuthHandler];
        } else if (_videoList.count == 0) {
            [DemoAlert showAlert:@"没有待编辑的视频，请先录制一段视频!" forViewController:self];
        }
        else {
            EditorViewController *editorVC = (EditorViewController *)destinationVC;
            editorVC.videoList = self.videoList;
            editorVC.concatFinishBlock = ^(NSURL *path) {
                typeof(weakSelf) strongSelf = weakSelf;
                strongSelf.concatedVideoPath = path;
                strongSelf.editoredVideoPathLab.text = [NSString stringWithFormat:@"已编辑视频地址: %@", path.relativePath];
            };
        }
    } else if ([destinationVC isKindOfClass:[UploadViewController class]]) {
        
        if (!self.hasAuthed) {
            [self noAuthHandler];
        } else {
            if (!self.concatedVideoPath) {
                [DemoAlert showAlert:@"还没有编辑好的视频，请先编辑一段视频!" forViewController:self];
                return;
            }
            UploadViewController * uploadVC = (UploadViewController *)destinationVC;
            uploadVC.concatedVideoPath = self.concatedVideoPath;
            uploadVC.uploadFinishBlock = ^(NSString *playVideoPath) {
                typeof(weakSelf) strongSelf = weakSelf;
                strongSelf.playVideoPath = playVideoPath;
                strongSelf.playVideoPathLab.text = [NSString stringWithFormat:@"待播放视频地址: %@", playVideoPath];
                strongSelf.releasedVideoPathLab.text = [NSString stringWithFormat:@"已上传视频地址: %@", playVideoPath];
            };
        }
    } else if ([destinationVC isKindOfClass:[VideoPlayerViewController class]]) {
        if (!self.playVideoPath) {
            [DemoAlert showAlert:@"还没有上传视频，请先上传一段视频!" forViewController:self];
            return;
        }
        VideoPlayerViewController * playerVC = (VideoPlayerViewController *)destinationVC;
        playerVC.playVideoPath = self.playVideoPath;
    }
}

- (void)noAuthHandler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"还没有鉴权，请先鉴权!" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

@end

//
//  RecordViewController.m
//  KSVSSdkApiDemo
//
//  Created by devcdl on 2017/12/26.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import "RecordViewController.h"

@interface RecordViewController ()<KSYCameraRecorderDelegate>
@property (nonatomic, strong) KSYCameraRecorder *recorder;
@property (nonatomic, strong) NSMutableArray *videoList;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@end

@implementation RecordViewController

#pragma mark -- ViewController life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    APIDEMO_HIDE_STATUS_BAR;
    // 开启预览
    [self.recorder startPreview:self.view];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.recorder stopPreview];
    [self.recorder stopRecord:nil];
    if (self.dismissBlock && self.videoList) {
        self.dismissBlock(self.videoList);
    };
}

#pragma mark -- IBAction & UIButton Action

- (IBAction)closeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)startRecord:(UIButton *)sender {
    [self.recorder startRecord];
    sender.enabled = NO;
}

- (IBAction)switchCameraAction:(UIButton *)sender {
    [_recorder switchCamera];
    NSString *senderTitle = @"后置摄像头";
    if (_recorder.cameraPosition == AVCaptureDevicePositionBack) {
        senderTitle = @"前置摄像头";
    }
    [sender setTitle:senderTitle forState:UIControlStateNormal];
}

#pragma mark -- Get Methods

- (KSYCameraRecorder *)recorder {
    if (!_recorder) {
        _recorder = [ApiDemoCommon recorderWithMaxDuration:5];
        _recorder.delegate = self;
    }
    return _recorder;
}

#pragma mark - KSYCameraRecorder Delegate

- (void)cameraRecorder:(KSYCameraRecorder *)recorder startRecord:(OSStatus)status {
    
}

- (void)cameraRecorder:(KSYCameraRecorder *)recorder didFinishRecord:(NSTimeInterval)length videoURL:(NSURL *)url
{
    if (!_videoList) {
        _videoList = [NSMutableArray arrayWithCapacity:1];
    }
    [_videoList addObject:url];
}

- (void)cameraRecorder:(KSYCameraRecorder *)recorder lastRecordLength:(NSTimeInterval)lastRecordLength totalLength:(NSTimeInterval)totalLength {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.timerLabel.text = [ApiDemoCommon formattedCurrentTime:totalLength];
    });
}

- (void)cameraRecorder:(KSYCameraRecorder *)recorder didReachMaxDurationLimit:(NSTimeInterval)maxRecDuration {
    NSLog(@"录制到达最大时长，自动结束");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

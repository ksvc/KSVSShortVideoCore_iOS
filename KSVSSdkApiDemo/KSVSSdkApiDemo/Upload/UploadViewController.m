//
//  UploadViewController.m
//  KSVSSdkApiDemo
//
//  Created by devcdl on 2017/12/26.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import "UploadViewController.h"


@interface UploadViewController ()
@property (nonatomic, strong)  KSVSKS3UploadService *ks3Service;
@property (weak, nonatomic) IBOutlet UILabel *uploadProgressLab;

@property (nonatomic, assign) BOOL allowUpload;
@end

@implementation UploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.allowUpload = YES;
}

- (KSVSKS3UploadService *)ks3Service {
    if (!_ks3Service) {
        _ks3Service = [[KSVSKS3UploadService alloc] initWithUserId:nil];
    }
    return _ks3Service;
}

- (IBAction)startUpload:(UIButton *)sender {
    if (!self.allowUpload) {
        [DemoAlert showAlert:@"已经上传过该视频，请不要重复上传!" forViewController:self];
        return;
    }
    sender.enabled = NO;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    __weak typeof(self) weakSelf = self;
    [self.ks3Service uploadVideo:_concatedVideoPath.relativePath progress:^(float progressValue) {
        typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async(dispatch_get_main_queue(), ^{
            strongSelf.uploadProgressLab.text = [NSString stringWithFormat:@"%.2f%%", progressValue * 100];
        });
    } success:^(NSString *remoteVideoPath) {
        typeof(weakSelf) strongSelf = weakSelf;
        [MBProgressHUD hideHUDForView:strongSelf.view animated:YES];
        sender.enabled = YES;
        if (strongSelf.uploadFinishBlock) {
            strongSelf.uploadFinishBlock(remoteVideoPath);
        }
        strongSelf.allowUpload = NO;
        [strongSelf dismissViewControllerAnimated:YES completion:nil];
    } failure:^(KSVSError *ksvsError) {
        typeof(weakSelf) strongSelf = weakSelf;
        [MBProgressHUD hideHUDForView:strongSelf.view animated:YES];
        NSString *alertString = [NSString stringWithFormat:@"上传失败(%zd)", ksvsError.errorCode];
        [DemoAlert showAlert:alertString forViewController:strongSelf];
        sender.enabled = YES;
        strongSelf.allowUpload = YES;
    }];
}

- (IBAction)closeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

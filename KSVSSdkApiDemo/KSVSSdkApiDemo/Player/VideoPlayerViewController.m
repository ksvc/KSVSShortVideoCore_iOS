//
//  VideoPlayerViewController.m
//  KSVSSdkApiDemo
//
//  Created by devcdl on 2017/12/26.
//  Copyright © 2017年 Kingsoft. All rights reserved.
//

#import "VideoPlayerViewController.h"
#import <libksygpulive/KSYMoviePlayerController.h>
#import "Masonry.h"

@interface VideoPlayerViewController ()
@property (nonatomic, strong) KSYMoviePlayerController *player;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end

@implementation VideoPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupPlayer];
}

- (void)setupPlayer {
    self.player = [[KSYMoviePlayerController alloc] initWithContentURL: [NSURL URLWithString:[_playVideoPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] fileList:nil sharegroup:nil];
    _player.controlStyle = MPMovieControlStyleNone;
    [self.view addSubview:_player.view];
    [_player.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [_player prepareToPlay];
    [self.view bringSubviewToFront:self.closeButton];
}

- (IBAction)closeAction:(id)sender {
    [self.player stop];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

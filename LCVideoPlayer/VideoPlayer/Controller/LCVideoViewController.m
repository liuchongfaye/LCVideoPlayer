//
//  LCVideoViewController.m
//  LCVideoPlayer
//
//  Created by 刘冲 on 2018/9/3.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCVideoViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "LCVideoModel.h"
#import "LCVideoView.h"
@import Masonry;

@interface LCVideoViewController ()

// Model
@property (nonatomic, strong) LCVideoModel *videoModel;

// VideoPlayer
@property (nonatomic, strong) AVPlayer *avPlayer;
@property (nonatomic, strong) AVPlayerItem *avPlayerItem;
@property (nonatomic, strong) AVPlayerLayer *avPlayerLayer;

@end

@implementation LCVideoViewController

#pragma mark - Init

- (instancetype)initWithVideoModel:(LCVideoModel *)videoModel {
    if (self = [super init]) {
        self.videoModel = videoModel;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.avPlayerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:self.videoModel.videoURL]];
    self.avPlayer = [AVPlayer playerWithPlayerItem:self.avPlayerItem];
    self.avPlayer.automaticallyWaitsToMinimizeStalling = NO;
    
    self.avPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
    [self.avPlayerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    LCVideoView *videoView = [[LCVideoView alloc] init];
    [self.view addSubview:videoView];

    [videoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

    [videoView setPlayer:self.avPlayer];
    [self.avPlayer play];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:
(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"status"]) {
        //取出status的新值
        AVPlayerItemStatus status = [change[NSKeyValueChangeNewKey]intValue];
        switch (status) {
            case AVPlayerItemStatusFailed: {
                NSLog(@"item 有误");
                break;
            }
            case AVPlayerItemStatusReadyToPlay: {
                NSLog(@"准好播放了");
                [self.avPlayer play];
                break;
            }
            case AVPlayerItemStatusUnknown: {
                NSLog(@"视频资源出现未知错误");
                break;
            }
            default:
                break;
        }
    }
    //移除监听（观察者）
//    [object removeObserver:self forKeyPath:@"status"];
}

@end

//
//  LCVideoView.h
//  LCVideoPlayer
//
//  Created by 刘冲 on 2018/9/3.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface LCVideoView : UIView

@property (nonatomic, readonly, strong) AVPlayerLayer *playerLayer;

// 设置Layer
- (void)setPlayer:(AVPlayer *)player;

@end

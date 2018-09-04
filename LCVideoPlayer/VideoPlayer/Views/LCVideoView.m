//
//  LCVideoView.m
//  LCVideoPlayer
//
//  Created by 刘冲 on 2018/9/3.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCVideoView.h"

@implementation LCVideoView

+ (Class)layerClass {
    return [AVPlayerLayer class];
}

- (AVPlayerLayer *)playerLayer {
    return (AVPlayerLayer *)self.playerLayer;
}

- (void)setPlayer:(AVPlayer *)player {
    ((AVPlayerLayer *)self.layer).player = player;
}

@end

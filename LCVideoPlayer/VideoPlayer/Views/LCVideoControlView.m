//
//  LCVideoControlView.m
//  LCVideoPlayer
//
//  Created by 刘冲 on 2018/9/4.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCVideoControlView.h"
@import Masonry;

@implementation LCVideoControlView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self configureView];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configureView];
    }
    
    return self;
}

- (void)configureView {
    
}

@end

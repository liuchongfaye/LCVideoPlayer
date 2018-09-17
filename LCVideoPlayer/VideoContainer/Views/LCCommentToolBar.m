//
//  LCCommentToolBar.m
//  LCVideoPlayer
//
//  Created by 刘冲 on 2018/9/17.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCCommentToolBar.h"
@import Masonry;

@implementation LCCommentToolBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configureView];
    }
    
    return self;
}

- (void)configureView {
    self.backgroundColor = [UIColor whiteColor];

    self.layer.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.07].CGColor;
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowRadius = 10;
    
    self.replayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.replayButton.layer.cornerRadius = 2.0;
    self.replayButton.backgroundColor = [UIColor colorWithWhite:246.0/ 255.0 alpha:1.0];
    self.replayButton.titleLabel.font = [UIFont systemFontOfSize:13.0];
    self.replayButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.replayButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self.replayButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.replayButton setTitle:@"我来说两句" forState:UIControlStateNormal];
    [self addSubview:self.replayButton];
    
    self.commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.commentButton setImage:[UIImage imageNamed:@"ToolBarCommentImage"] forState:UIControlStateNormal];
    self.praiseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.praiseButton setImage:[UIImage imageNamed:@"ToolBarPraiseImage"] forState:UIControlStateNormal];
    self.shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.shareButton setImage:[UIImage imageNamed:@"ToolBarShareImage"] forState:UIControlStateNormal];
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[self.commentButton , self.praiseButton, self.shareButton]];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.spacing = 10.0;
    stackView.alignment = UIStackViewAlignmentCenter;
    [self addSubview:stackView];

    [self.replayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(36.0);
        make.leading.equalTo(self.mas_leading).offset(20.0);
        make.top.equalTo(self.mas_top).offset(11.0);
    }];
    
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.replayButton.mas_trailing).offset(20.0);
        make.centerY.equalTo(self.replayButton.mas_centerY);
        make.trailing.equalTo(self.mas_trailing).offset(-20.0);
    }];
}

@end

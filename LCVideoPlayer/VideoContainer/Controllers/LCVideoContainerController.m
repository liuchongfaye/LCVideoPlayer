//
//  LCVideoContainerController.m
//  LCVideoPlayer
//
//  Created by 刘冲 on 2018/9/17.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCVideoContainerController.h"
#import "LCCommentToolBar.h"
#import "LCVideoModel.h"
#import "LCVideoViewController.h"
#import "LCRecommendationTableController.h"
@import Masonry;

@interface LCVideoContainerController ()

// Models
@property (nonatomic, strong) LCVideoModel *videoModel;

// Controllers
@property (nonatomic, strong) LCVideoViewController *videoViewController;
@property (nonatomic, strong) LCRecommendationTableController *recommendationController;

// Views
@property (nonatomic, strong) LCCommentToolBar *commentToolBar;

@end

@implementation LCVideoContainerController

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
    
    // LCVideoModel作为模块之间传递信息的媒介
    LCVideoModel *videoModel = self.videoModel;
    // 视频播放器
    self.videoViewController = [[LCVideoViewController alloc] initWithVideoModel:videoModel];
    [self addChildViewController:self.videoViewController];
    [self.view addSubview:self.videoViewController.view];
    [self.videoViewController didMoveToParentViewController:self];
    // 推荐列表
    self.recommendationController = [[LCRecommendationTableController alloc] initWithStyle:UITableViewStylePlain];
    self.recommendationController.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self addChildViewController:self.recommendationController];
    [self.view addSubview:self.recommendationController.view];
    [self.recommendationController didMoveToParentViewController:self];
    // 底部ToolBar
    self.commentToolBar = [[LCCommentToolBar alloc] init];
    [self.view addSubview:self.commentToolBar];
    
    [self.videoViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.top.equalTo(self.view.mas_top);
        } else {
            make.left.right.top.equalTo(self.view);
        }
        make.height.equalTo(self.videoViewController.view.mas_width).multipliedBy(9.0 / 16.0);
    }];
    
    [self.recommendationController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.videoViewController.view);
        make.bottom.equalTo(self.commentToolBar.mas_top);
        make.top.equalTo(self.view.mas_top);
    }];
    
    [self.commentToolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(self.view.mas_bottom);
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-49.0);
        } else {
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.mas_bottomLayoutGuide);
            make.top.equalTo(self.mas_bottomLayoutGuide).offset(49.0);
        }
    }];
    
    [self.view bringSubviewToFront:self.videoViewController.view];
    
    // 为tableView设置一个偏移量,偏移出一个播放器的高度来
    CGFloat top = 0.0;
    if (@available(iOS 11.0, *)) {
        top = (CGRectGetWidth(self.view.bounds) - self.view.safeAreaInsets.right - self.view.safeAreaInsets.left) * 9.0 / 16.0;
    } else {
        top = CGRectGetWidth(self.view.bounds) * 9.0 / 16.0;
    }
    self.recommendationController.tableView.contentInset = UIEdgeInsetsMake(top, 0.0, 0.0, 0.0);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.shadowImage = nil;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIViewControllerRotation

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    if (size.width > size.height) {
        // 横屏
        [self.videoViewController.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (@available(iOS 11.0, *)) {
                make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
                make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
                make.top.equalTo(self.view.mas_top);
            } else {
                make.left.right.top.equalTo(self.view);
            }
            make.height.equalTo(self.view.mas_height);
        }];
    } else {
        // 竖屏
        [self.videoViewController.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (@available(iOS 11.0, *)) {
                make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
                make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
                make.top.equalTo(self.view.mas_top);
            } else {
                make.left.right.top.equalTo(self.view);
            }
            make.height.equalTo(self.videoViewController.view.mas_width).multipliedBy(9.0 / 16.0);
        }];
    }
}

@end

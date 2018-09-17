//
//  LCRootTableViewController.m
//  LCVideoPlayer
//
//  Created by 刘冲 on 2018/9/3.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCRootTableViewController.h"
// Video Source
#import "LCVideoSource.h"

// Controllers
#import "LCVideoViewController.h"
#import "LCVideoContainerController.h"

static NSString * const kSingleVideoViewController = @"单一播放器";
static NSString * const kVideoContainerController = @"视频播放页(仿头条)";

@interface LCRootTableViewController ()

@property (nonatomic, strong)   NSArray<NSString *> *dataSource;

@end

@implementation LCRootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = @[kSingleVideoViewController, kVideoContainerController];
    
    self.tableView.tableFooterView = [UIView new];
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
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0: {
            LCVideoModel *model = [[LCVideoModel alloc] init];
            model.videoURL = kVideo1;
            LCVideoViewController *videoViewController = [[LCVideoViewController alloc] initWithVideoModel:model];
            [self.navigationController pushViewController:videoViewController animated:YES];
        }
            break;
            
        case 1: {
            LCVideoModel *model = [[LCVideoModel alloc] init];
            model.videoURL = kVideo1;
            LCVideoContainerController *videoContainerController = [[LCVideoContainerController alloc] initWithVideoModel:model];
            [self.navigationController pushViewController:videoContainerController animated:YES];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

@end

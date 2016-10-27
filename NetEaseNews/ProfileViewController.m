//
//  ProfileViewController.m
//  NetEaseNews
//
//  Created by Vokie on 2016/10/20.
//  Copyright © 2016年 Vokie. All rights reserved.
//

#import "ProfileViewController.h"
#import "CommonHeader.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.navigationController.navigationBar.hidden = YES;
    self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self initHeaderView];
    
    
}

- (void)initHeaderView {
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
    headerView.backgroundColor = THEME_COLOR;
    
    self.mTableView.tableHeaderView = headerView;
    
    [RACObserve(self.mTableView, contentOffset) subscribeNext:^(id x) {
        
        //获取偏移量
        CGPoint offset = [x CGPointValue];
        //判断是否改变
        if (offset.y < 0) {
            CGRect rect = self.mTableView.tableHeaderView.frame;
            //我们只需要改变图片的y值和高度即可
            rect.origin.y = offset.y;
            rect.size.height = 200 - offset.y;
            self.mTableView.tableHeaderView.frame = rect;
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  LiveVideoViewController.m
//  NetEaseNews
//
//  Created by Vokie on 2016/10/20.
//  Copyright © 2016年 Vokie. All rights reserved.
//

#import "LiveVideoViewController.h"
#import "NavigationSegmentScrollView.h"
#import "CommonHeader.h"
#import <ReactiveCocoa.h>

#define SCROLL_CONTENT_HEIGHT   SCREEN_HEIGHT - 64 - 44

@interface LiveVideoViewController () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, retain) NavigationSegmentScrollView *navigationSegmentScrollView;
@property (nonatomic, retain) UITableView *hotTableView;
@property (nonatomic, retain) UITableView *categoryTableView;
@end

@implementation LiveVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    _navigationSegmentScrollView = [[NavigationSegmentScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 0.4, 25)];

    self.navigationItem.titleView = _navigationSegmentScrollView;
    
    [self initTableView];
}

- (void)initTableView {
    _hotTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCROLL_CONTENT_HEIGHT) style:UITableViewStylePlain];
    _hotTableView.delegate = self;
    _hotTableView.dataSource = self;
    _hotTableView.tableFooterView = [[UIView alloc]init];
    [self.scrollContentView addSubview:_hotTableView];
    
    _categoryTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCROLL_CONTENT_HEIGHT) style:UITableViewStylePlain];
    _categoryTableView.delegate = self;
    _categoryTableView.dataSource = self;
    _categoryTableView.tableFooterView = [[UIView alloc]init];
    [self.scrollContentView addSubview:_categoryTableView];
    
    self.scrollContentView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, SCROLL_CONTENT_HEIGHT);
    self.scrollContentView.bounces = NO;
    self.scrollContentView.pagingEnabled = YES;
    self.scrollContentView.showsHorizontalScrollIndicator = NO;
    self.scrollContentView.delegate = self;
    
    [RACObserve(self.scrollContentView, contentOffset) subscribeNext:^(id value) {
        CGPoint offset = [value CGPointValue];
        CGFloat rate = offset.x / SCREEN_WIDTH;
        [_navigationSegmentScrollView scrollWithRate:rate];
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:_hotTableView]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYSCELL"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SYSCELL"];
        }
        cell.textLabel.text = @"测试、";
        return cell;
    }else if ([tableView isEqual:_categoryTableView]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYSCELL2"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SYSCELL2"];
        }
        cell.textLabel.text = @"分类、";
        return cell;
    }
    
    return nil;
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

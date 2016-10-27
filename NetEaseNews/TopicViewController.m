//
//  TopicViewController.m
//  NetEaseNews
//
//  Created by Vokie on 2016/10/20.
//  Copyright © 2016年 Vokie. All rights reserved.
//

#import "TopicViewController.h"
#import "ThreeSegmentScrollView.h"
#import "CommonHeader.h"

#define SCROLL_CONTENT_HEIGHT   SCREEN_HEIGHT - 64 - 44

@interface TopicViewController () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, retain) ThreeSegmentScrollView *segmentScrollView;
@property (nonatomic, retain) UITableView *askTableView;  //问吧
@property (nonatomic, retain) UITableView *topicTableView;  //话题
@property (nonatomic, retain) UITableView *followTableView;  //关注

@end

@implementation TopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]initWithImage:UIImageWithName(@"subj_search_icon") style:UIBarButtonItemStylePlain target:self action:@selector(searchEvent:)];
    self.navigationItem.leftBarButtonItem = searchButton;
    
    UIBarButtonItem *profileButton = [[UIBarButtonItem alloc]initWithImage:UIImageWithName(@"qa_login_normal") style:UIBarButtonItemStylePlain target:self action:@selector(profileEvent:)];
    self.navigationItem.rightBarButtonItem = profileButton;
    
    _segmentScrollView = [[ThreeSegmentScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 0.5, 25)];
    self.navigationItem.titleView = _segmentScrollView;
    [self initTableView];
}

- (void)initTableView {
    _askTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCROLL_CONTENT_HEIGHT) style:UITableViewStylePlain];
    _askTableView.delegate = self;
    _askTableView.dataSource = self;
    _askTableView.tableFooterView = [[UIView alloc]init];
    [self.scrollContentView addSubview:_askTableView];
    
    _topicTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCROLL_CONTENT_HEIGHT) style:UITableViewStylePlain];
    _topicTableView.delegate = self;
    _topicTableView.dataSource = self;
    _topicTableView.tableFooterView = [[UIView alloc]init];
    [self.scrollContentView addSubview:_topicTableView];
    
    _followTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 2, 0, SCREEN_WIDTH, SCROLL_CONTENT_HEIGHT) style:UITableViewStylePlain];
    _followTableView.delegate = self;
    _followTableView.dataSource = self;
    _followTableView.tableFooterView = [[UIView alloc]init];
    [self.scrollContentView addSubview:_followTableView];
    
    self.scrollContentView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, SCROLL_CONTENT_HEIGHT);
    self.scrollContentView.bounces = NO;
    self.scrollContentView.pagingEnabled = YES;
    self.scrollContentView.showsHorizontalScrollIndicator = NO;
    self.scrollContentView.delegate = self;
    
    [RACObserve(self.scrollContentView, contentOffset) subscribeNext:^(id value) {
        CGPoint offset = [value CGPointValue];
        CGFloat rate = offset.x / (2 * SCREEN_WIDTH);
        [_segmentScrollView scrollWithRate:rate];
        
    }];
}

- (void)searchEvent:(id)sender {
    
}

- (void)profileEvent:(id)sender {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:_askTableView]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYSCELL"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SYSCELL"];
        }
        cell.textLabel.text = @"问吧、";
        return cell;
    }else if ([tableView isEqual:_topicTableView]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYSCELL2"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SYSCELL2"];
        }
        cell.textLabel.text = @"话题、";
        return cell;
    }else if ([tableView isEqual:_followTableView]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYSCELL2"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SYSCELL2"];
        }
        cell.textLabel.text = @"关注、";
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

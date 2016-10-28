//
//  ProfileViewController.m
//  NetEaseNews
//
//  Created by Vokie on 2016/10/20.
//  Copyright © 2016年 Vokie. All rights reserved.
//

#import "ProfileViewController.h"
#import "CommonHeader.h"
#import "UIView+Vokie.h"

@interface ProfileViewController ()
@property (nonatomic, assign) CGRect originHeadRect;
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
    _originHeadRect = CGRectMake(0, 0, SCREEN_WIDTH, 200);
    UIView *headerView = [[UIView alloc]initWithFrame:_originHeadRect];
    headerView.backgroundColor = [UIColor grayColor];
    
    //红色背景
    UIView *backgroundView = [[UIView alloc]initWithFrame:_originHeadRect];
    backgroundView.backgroundColor = THEME_COLOR;
    [headerView addSubview:backgroundView];
    
    //设置按钮
    UIButton *settingsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingsButton setImage:UIImageWithName(@"icon_setting") forState:UIControlStateNormal];
    [settingsButton setTitle:@"设置" forState:UIControlStateNormal];
    settingsButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [settingsButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 4, 0, 0)];
    [settingsButton setBackgroundColor:[UIColor clearColor]];
    [settingsButton sizeToFit];
    [headerView addSubview:settingsButton];
    
    [settingsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView).offset(30);
        make.trailing.equalTo(headerView).offset(-12);
        make.width.mas_equalTo(50);
    }];
    
    //用户头像
    UIImageView *headImageView = [[UIImageView alloc]initWithImage:UIImageWithName(@"user_avatar")];
    [headerView addSubview:headImageView];
    headImageView.layer.cornerRadius = 30;
    headImageView.layer.masksToBounds = YES;
    [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(60);
        make.centerX.equalTo(headerView);
        make.top.equalTo(headerView).offset(30);
    }];
    
    //用户名称
    UILabel *nickNameLabel = [[UILabel alloc]init];
    nickNameLabel.font = [UIFont systemFontOfSize:14];
    nickNameLabel.textColor = [UIColor whiteColor];
    nickNameLabel.text = @"网易用户18829393";
    [headerView addSubview:nickNameLabel];
    
    [nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView);
        make.top.equalTo(headImageView.mas_bottom).offset(8);
    }];
    
    //用户等级称呼
    UIView *rankView = [[UIView alloc]init];
    rankView.backgroundColor = [UIColor clearColor];
    rankView.layer.cornerRadius = 3;
    rankView.layer.borderWidth = 0.7;
    rankView.layer.borderColor = UIColorMake(250, 200, 45).CGColor;
    [headerView addSubview:rankView];
    
    [rankView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView);
        make.top.equalTo(nickNameLabel.mas_bottom).offset(8);
    }];
    
    UILabel *rankNameLabel = [[UILabel alloc]init];
    rankNameLabel.font = [UIFont systemFontOfSize:10];
    rankNameLabel.textColor = UIColorMake(250, 200, 45);
    rankNameLabel.text = @"跟帖局副处长";
    [rankView addSubview:rankNameLabel];
    [rankNameLabel sizeToFit];
    [rankNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(2);
        make.left.mas_equalTo(4);
        make.bottom.mas_equalTo(-2);
        make.right.mas_equalTo(-4);
    }];
    
    
    
    self.mTableView.tableHeaderView = headerView;
    
    [RACObserve(self.mTableView, contentOffset) subscribeNext:^(id value) {
        CGPoint offset = [value CGPointValue];
        
        if (offset.y < 0) {
            _originHeadRect.origin.y = offset.y;
            _originHeadRect.size.height = 200 - offset.y;
            
            NSLog(@"%@", NSStringFromCGRect(_originHeadRect));
            backgroundView.frame = _originHeadRect;
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

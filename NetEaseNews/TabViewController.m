//
//  ViewController.m
//  NetEaseNews
//
//  Created by Vokie on 2016/10/19.
//  Copyright © 2016年 Vokie. All rights reserved.
//

#import "TabViewController.h"
#import "NewsViewController.h"
#import "LiveVideoViewController.h"
#import "TopicViewController.h"
#import "ProfileViewController.h"
#import "CommonHeader.h"

@interface TabViewController ()

@end

@implementation TabViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        
        NewsViewController *news = [[NewsViewController alloc]init];
        news.isHiddenStatusBar = YES;
        
        UINavigationController *newsVC = [[UINavigationController alloc]initWithRootViewController:news];
        newsVC.tabBarItem.title = @"新闻";
        newsVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_icon_news_normal"];
        newsVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_icon_news_highlight"];
        
        UINavigationController *liveVideoVC = [[UINavigationController alloc]initWithRootViewController:[[LiveVideoViewController alloc]init]];
        liveVideoVC.tabBarItem.title = @"直播";
        liveVideoVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_icon_live_video_normal"];
        liveVideoVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_icon_live_video_highlight"];
        
        UINavigationController *topicVC = [[UINavigationController alloc]initWithRootViewController:[[TopicViewController alloc]init]];
        topicVC.tabBarItem.title = @"话题";
        topicVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_icon_topic_normal"];
        topicVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_icon_topic_highlight"];
        
        UINavigationController *profileVC = [[UINavigationController alloc]initWithRootViewController:[[ProfileViewController alloc]init]];
        profileVC.tabBarItem.title = @"我";
        profileVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_icon_profile_normal"];
        profileVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_icon_profile_highlight"];
        
        
        self.viewControllers = @[newsVC, liveVideoVC, topicVC, profileVC];
        
        //上移TabBar上的文字
        [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -3)];
        self.tabBar.tintColor = THEME_COLOR;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end

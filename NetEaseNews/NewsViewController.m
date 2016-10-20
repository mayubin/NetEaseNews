//
//  NewsViewController.m
//  NetEaseNews
//
//  Created by Vokie on 2016/10/20.
//  Copyright © 2016年 Vokie. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    UIImageView *titleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navbar_netease"]];
    self.navigationItem.titleView = titleImageView;
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

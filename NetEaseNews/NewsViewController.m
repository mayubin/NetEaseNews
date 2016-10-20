//
//  NewsViewController.m
//  NetEaseNews
//
//  Created by Vokie on 2016/10/20.
//  Copyright © 2016年 Vokie. All rights reserved.
//

#import "NewsViewController.h"
#import "CommonHeader.h"
@interface NewsViewController ()

@property (nonatomic, retain) UIImageView *liveImageView;
@property (nonatomic, retain) UILabel *numberLabel;
@end

@implementation NewsViewController

#pragma mark - Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    [self initNavigationBarItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Custom Event
- (void)initNavigationBarItem {
    UIImageView *titleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navbar_netease"]];
    self.navigationItem.titleView = titleImageView;
    
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithImage:UIImageWithName(@"search_icon") style:UIBarButtonItemStylePlain target:self action:@selector(searchEvent:)];
    self.navigationItem.rightBarButtonItem = searchItem;
    
    _liveImageView = [[UIImageView alloc] initWithImage:UIImageWithName(@"nav_live_room_image")];
    
    _liveImageView.animationImages = [NSArray arrayWithObjects:UIImageWithName(@"nav_live_room_rolling_first"), UIImageWithName(@"nav_live_room_rolling_second"), UIImageWithName(@"nav_live_room_rolling_third"), nil];
    
    _liveImageView.animationDuration = 0.2;
    _liveImageView.animationRepeatCount = 5;
    
    [_liveImageView startAnimating];
    
    _numberLabel = [[UILabel alloc]init];
    _numberLabel.text = @"12";
    _numberLabel.font = [UIFont systemFontOfSize:10];
    _numberLabel.textColor = [UIColor whiteColor];
    [_liveImageView addSubview:_numberLabel];
    
    [_numberLabel sizeToFit];
    
    _numberLabel.center = CGPointMake(-25, _liveImageView.bounds.size.height / 2.0);

    
    [UIView animateWithDuration:0.5 delay:0.8 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        _numberLabel.center = CGPointMake(0, _liveImageView.bounds.size.height / 2.0);
        
    } completion:^(BOOL finished) {
        
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(liveEvent:)];
    tap.numberOfTapsRequired = 1;
    [_liveImageView addGestureRecognizer:tap];
    
    UIBarButtonItem *liveItem = [[UIBarButtonItem alloc]initWithCustomView:_liveImageView];
    
    self.navigationItem.leftBarButtonItem = liveItem;
    
}

#pragma mark - Touch Event
- (void)searchEvent:(id)sender {
    NSLog(@"search event");
    [_liveImageView startAnimating];
    
    _numberLabel.center = CGPointMake(-25, _liveImageView.bounds.size.height / 2.0);
    
    
    [UIView animateWithDuration:0.5 delay:0.8 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        _numberLabel.center = CGPointMake(0, _liveImageView.bounds.size.height / 2.0);
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)liveEvent:(id)sender {
    NSLog(@"live event");
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

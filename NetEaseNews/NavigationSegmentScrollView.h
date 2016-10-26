//
//  NavigationSegmentScrollView.h
//  NetEaseNews
//
//  Created by Vokie on 2016/10/25.
//  Copyright © 2016年 Vokie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationSegmentScrollView : UIView

@property (nonatomic, retain) UIView *hilightedView;
- (void)scrollWithRate:(CGFloat)rate;
@end

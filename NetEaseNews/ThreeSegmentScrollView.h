//
//  ThreeSegmentScrollView.h
//  NetEaseNews
//
//  Created by Vokie on 2016/10/27.
//  Copyright © 2016年 Vokie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeSegmentScrollView : UIView

@property (nonatomic, retain) UIView *hilightedView;
- (void)scrollWithRate:(CGFloat)rate;
@end

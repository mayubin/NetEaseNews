//
//  NavigationSegmentScrollView.m
//  NetEaseNews
//
//  Created by Vokie on 2016/10/25.
//  Copyright © 2016年 Vokie. All rights reserved.
//

#import "NavigationSegmentScrollView.h"
#import "CommonHeader.h"

@implementation NavigationSegmentScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.cornerRadius = frame.size.height / 2.0;
        self.layer.masksToBounds = YES;
        
        _hilightedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 2.0, frame.size.height)];
        _hilightedView.layer.cornerRadius = frame.size.height / 2.0;
        _hilightedView.layer.masksToBounds = YES;
        _hilightedView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:_hilightedView];
        
        
        UILabel *leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width / 2.0, frame.size.height)];
        leftLabel.textColor = THEME_COLOR;
        leftLabel.textAlignment = NSTextAlignmentCenter;
        leftLabel.font = [UIFont systemFontOfSize:12];
        leftLabel.text = @"热门";
        [self addSubview:leftLabel];
        
        UILabel *rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width / 2.0, 0, frame.size.width / 2.0, frame.size.height)];
        rightLabel.textColor = [UIColor whiteColor];
        rightLabel.textAlignment = NSTextAlignmentCenter;
        rightLabel.font = [UIFont systemFontOfSize:12];
        rightLabel.text = @"分类";
        [self addSubview:rightLabel];
        
        
    }
    return self;
}

@end

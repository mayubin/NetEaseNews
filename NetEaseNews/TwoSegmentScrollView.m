//
//  TwoSegmentScrollView.m
//  NetEaseNews
//
//  Created by Vokie on 2016/10/25.
//  Copyright © 2016年 Vokie. All rights reserved.
//

#import "TwoSegmentScrollView.h"
#import "CommonHeader.h"
#import "UIView+Vokie.h"

@interface TwoSegmentScrollView()
@property (nonatomic, retain) UILabel *leftLabel;
@property (nonatomic, retain) UILabel *rightLabel;
@end

@implementation TwoSegmentScrollView

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
        
        
        _leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width / 2.0, frame.size.height)];
        _leftLabel.textColor = THEME_COLOR;
        _leftLabel.textAlignment = NSTextAlignmentCenter;
        _leftLabel.font = [UIFont systemFontOfSize:12];
        _leftLabel.text = @"热门";
        [self addSubview:_leftLabel];
        
        _rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width / 2.0, 0, frame.size.width / 2.0, frame.size.height)];
        _rightLabel.textColor = [UIColor whiteColor];
        _rightLabel.textAlignment = NSTextAlignmentCenter;
        _rightLabel.font = [UIFont systemFontOfSize:12];
        _rightLabel.text = @"分类";
        [self addSubview:_rightLabel];
        
        
    }
    return self;
}

- (void)scrollWithRate:(CGFloat)rate {
    _hilightedView.left = self.width * rate / 2.0;
    
    CGFloat antiRate = 1 - rate;
    
    _leftLabel.textColor = [UIColor colorWithRed:(255.0 - 45.0 * antiRate) / 255.0 green:(255.0 - 215.0 * antiRate) / 255.0 blue:(255.0 - 210.0 * antiRate) / 255.0 alpha:1.0];
    
    _rightLabel.textColor = [UIColor colorWithRed:(255.0 - 45.0 * rate) / 255.0 green:(255.0 - 215.0 * rate) / 255.0 blue:(255.0 - 210.0 * rate) / 255.0 alpha:1.0];
}

@end

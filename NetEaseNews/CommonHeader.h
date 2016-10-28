//
//  CommonHeader.h
//  NetEaseNews
//
//  Created by Vokie on 2016/10/19.
//  Copyright © 2016年 Vokie. All rights reserved.
//

#ifndef CommonHeader_h
#define CommonHeader_h

#import <Masonry.h>
#import <ReactiveCocoa.h>

#define BaseURL @"http://3g.163.com"

#define UIColorMake(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

#define THEME_COLOR UIColorMake(210.0, 40.0, 45.0)

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define UIImageWithName(name) [UIImage imageNamed:name]


#endif /* CommonHeader_h */

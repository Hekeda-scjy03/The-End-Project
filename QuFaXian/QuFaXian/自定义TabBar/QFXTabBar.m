//
//  QFXTabBar.m
//  QuFaXian
//
//  Created by licong on 16/5/6.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXTabBar.h"

@implementation QFXTabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.barTintColor = [UIColor blackColor];
        self.alpha = 0.8;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

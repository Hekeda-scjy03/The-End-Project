//
//  ShareButton.m
//  QuFaXian
//
//  Created by licong on 16/5/13.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "ShareButton.h"

@implementation ShareButton

/**
 设置button的image和title
 */
- (void)setButtonImage:(NSString *)imageName withTitle:(NSString *)title{
    [self.btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

/**
 设置button的点击方法
 */
- (void)addTarget:(id)target action:(SEL)action{
    [self.btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
}

@end

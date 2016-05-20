//
//  listBtn.m
//  QuFaXian
//
//  Created by licong on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "listBtn.h"

@implementation ListBtn

- (void)addTarget:(id)target action:(SEL)action backgroundColor:(UIColor *)color buttonTitle:(NSString *)title titleColor:(UIColor *)titleColor arrowImage:(NSString *)imageName{
    [self.btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self.btn setBackgroundColor:color];
    [self.btn setTitle:title forState:UIControlStateNormal];
    [self.btn setTitleColor:titleColor forState:UIControlStateNormal];
    [self.arrowImg setImage:[UIImage imageNamed:imageName]];
    
}

@end

//
//  JoinIn.m
//  QuFaXian
//
//  Created by licong on 16/5/17.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "JoinIn.h"

@implementation JoinIn

- (void)addTarget:(id)target action:(SEL)action{
    [self.joinBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)setTitle:(NSString *)title{
    [self.joinBtn setTitle:title forState:UIControlStateNormal];
}

@end

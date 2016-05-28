//
//  DirectoryTagView.m
//  QuFaXian
//
//  Created by licong on 16/5/28.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "DirectoryTagView.h"

@implementation DirectoryTagView

- (void)addTarget:(id)target action:(SEL)action withTitle:(NSString *)title{
    [self.tagBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [self.tagBtn setTitle:title forState:UIControlStateNormal];
}

@end

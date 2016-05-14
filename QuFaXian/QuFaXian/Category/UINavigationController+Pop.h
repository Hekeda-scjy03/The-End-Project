//
//  UINavigationController+Pop.h
//  QuFaXian
//
//  Created by licong on 16/5/6.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Pop)

- (void)popToVCWithStoryBoardName:(NSString *)name withVC:(NSString *)vcName;

@end

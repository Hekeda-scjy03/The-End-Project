//
//  UINavigationController+Pop.m
//  QuFaXian
//
//  Created by licong on 16/5/6.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "UINavigationController+Pop.h"
#import "UIStoryboard+NavPopToVC.h"
@implementation UINavigationController (Pop)

- (void)popToVCWithStoryBoardName:(NSString *)name withVC:(NSString *)vcName{
    UIViewController *vc = [UIStoryboard jumpToStoryboardName:name withVCName:vcName];
    [self pushViewController:vc animated:YES];
}

@end

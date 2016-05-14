//
//  UIStoryboard+NavPopToVC.m
//  QuFaXian
//
//  Created by licong on 16/5/6.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "UIStoryboard+NavPopToVC.h"

@implementation UIStoryboard (NavPopToVC)

+ (UIViewController *)jumpToStoryboardName:(NSString *)name withVCName:(NSString *)vcName{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:vcName];
    return vc;
    
}

@end

//
//  UIStoryboard+NavPopToVC.h
//  QuFaXian
//
//  Created by licong on 16/5/6.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (NavPopToVC)

+ (UIViewController *)jumpToStoryboardName:(NSString *)name withVCName:(NSString *)vcName;

@end

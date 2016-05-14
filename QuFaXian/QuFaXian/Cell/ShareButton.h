//
//  ShareButton.h
//  QuFaXian
//
//  Created by licong on 16/5/13.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareButton : UIView

@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (weak, nonatomic) IBOutlet UILabel *buttonLabel;

/**
 设置button的image和title
 */
- (void)setButtonImage:(NSString *)imageName withTitle:(NSString *)title;

/**
 设置button的点击方法
 */
- (void)addTarget:(id)target action:(SEL)action;

@end

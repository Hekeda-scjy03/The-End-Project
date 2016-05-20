//
//  listBtn.h
//  QuFaXian
//
//  Created by licong on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListBtn : UIView

@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (weak, nonatomic) IBOutlet UIImageView *arrowImg;

- (void)addTarget:(id)target action:(SEL)action backgroundColor:(UIColor *)color buttonTitle:(NSString *)title titleColor:(UIColor *)titleColor arrowImage:(NSString *)imageName;

@end

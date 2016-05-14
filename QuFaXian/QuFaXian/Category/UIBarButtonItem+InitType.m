//
//  UIBarButtonItem+InitType.m
//  QuFaXian
//
//  Created by licong on 16/5/5.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "UIBarButtonItem+InitType.h"

@implementation UIBarButtonItem (InitType)

+ (UIBarButtonItem *)setWithImageName:(NSString *)imageName withHighlightedImage:(NSString *)highlightedName target:(id)target action:(SEL)action title:(NSString *)title position:(UIControlContentHorizontalAlignment)alignment{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedName] forState:UIControlStateHighlighted];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    btn.contentHorizontalAlignment = alignment;
    
    btn.frame = CGRectMake(0, 0, 60, 44);
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    return barButtonItem;
}

- (void)setBarButtonItemWithTitleSize:(CGFloat)fontsize normalColor:(UIColor *)normarl highlighted:(UIColor *) highlighted{
    UIButton *btn = (UIButton *)self.customView;
    btn.titleLabel.font = [UIFont systemFontOfSize:fontsize];
    [btn setTitleColor:normarl forState:UIControlStateNormal];
    [btn setTitleColor:highlighted forState:UIControlStateHighlighted];
    
}

@end

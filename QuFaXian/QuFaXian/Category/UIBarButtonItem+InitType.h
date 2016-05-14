//
//  UIBarButtonItem+InitType.h
//  QuFaXian
//
//  Created by licong on 16/5/5.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (InitType)

+ (UIBarButtonItem *)setWithImageName:(NSString *)imageName withHighlightedImage:(NSString *)highlightedName target:(id)target action:(SEL)action title:(NSString *)title position:(UIControlContentHorizontalAlignment)alignment;

- (void)setBarButtonItemWithTitleSize:(CGFloat)fontsize normalColor:(UIColor *)normarl highlighted:(UIColor *) highlighted;

@end

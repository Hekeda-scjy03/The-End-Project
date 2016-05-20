//
//  HomeThemeButton.m
//  QuFaXian
//
//  Created by hzy on 16/5/16.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "HomeThemeButton.h"

@implementation HomeThemeButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.contentMode = UIViewContentModeCenter;
    }
    return self;
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat btnTitleW = contentRect.size.width;
    CGFloat btnTitleH = contentRect.size.height * 0.1666 - 1;
    CGFloat btnTitleX = 0;
    CGFloat btnTitleY = contentRect.size.height - btnTitleH + 1;
    
    CGRect btnRect = CGRectMake(btnTitleX, btnTitleY, btnTitleW, btnTitleH);
    return btnRect;
}


- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    CGFloat btnImageW = contentRect.size.width;
    CGFloat btnImageH = contentRect.size.height * 0.7727;
    CGFloat btnImageX = 0;
    CGFloat btnImageY = 0;
    
    CGRect imgRect = CGRectMake(btnImageX, btnImageY, btnImageW, btnImageH);
    return imgRect;
}



@end

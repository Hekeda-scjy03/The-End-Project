//
//  MySegement.h
//  MySegment
//
//  Created by licong on 16/5/26.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger{
    toLeft,
    toRight,
}SegmentDirection;

typedef void(^ClickSegmentChangeDirectionBlock)(SegmentDirection);

@interface MySegement : UIControl

//segment的标题
@property (nonatomic, strong)  NSArray *titleArray;

//当前选择的index
@property (nonatomic, assign) NSInteger selectedIndex;

//上一次选择的index
@property (nonatomic, assign) NSInteger lastIndex;

//title颜色
@property (nonatomic, strong) UIColor *titleColor;

//选中的title颜色
@property (nonatomic, strong) UIColor *selectedTitleColor;

//title字体大小
@property (nonatomic, strong) UIFont *titleFont;

//item的背景色以及被选中时的颜色
@property (nonatomic, strong) UIColor *itemBgColor;

@property (nonatomic, strong) UIColor *selectedItemBgColor;

//item 宽度
@property (nonatomic, assign) CGFloat itemWidth;

//下划线
@property (nonatomic, strong) CALayer *underline;

//下划线颜色
@property (nonatomic, strong) UIColor *underlineColor;

@property (nonatomic, copy)  ClickSegmentChangeDirectionBlock changeDirection;

- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray *)titleArray;

@end

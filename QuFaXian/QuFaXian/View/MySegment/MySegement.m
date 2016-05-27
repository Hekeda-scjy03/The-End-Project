//
//  MySegement.m
//  MySegment
//
//  Created by licong on 16/5/26.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "MySegement.h"

@implementation MySegement

- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray *)titleArray{
    self = [super initWithFrame:frame];
    if (self) {
        self.itemWidth = self.frame.size.width / titleArray.count;
        
        self.titleArray = titleArray;
        
        //记录上次点击的index
        self.lastIndex = 0;
    }
    return self;
}

#pragma mark - 懒加载
- (CALayer *)underline{
    if (!_underline) {
        _underline = [CALayer layer];
        _underline.backgroundColor = self.underlineColor.CGColor;
        [self.layer addSublayer:_underline];
    }
    return _underline;
}

#pragma mark - 设置标签的index
- (void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    
    self.underline.frame = CGRectMake(self.selectedIndex * self.itemWidth, self.frame.size.height - 2, self.itemWidth, 2);
    
    //强制调用drawRect方法 重置index时必须要重新划线
    [self setNeedsDisplay];
    
}

//判断选中的index
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    
    CGPoint currentPoint = [touch locationInView:self];
    
    self.selectedIndex = currentPoint.x / self.itemWidth;
    
    if (self.lastIndex < self.selectedIndex) {
        self.changeDirection(toLeft);
    }else if (self.lastIndex > self.selectedIndex){
        self.changeDirection(toRight);
    }
    
    self.lastIndex = self.selectedIndex;
    
}

//划线
- (void)drawRect:(CGRect)rect{
    
    [self.itemBgColor set];
    
    UIRectFill(rect);
    
    /**
     *  数组遍历
     *
     *  @param obj  遍历的元素
     *  @param idx  遍历的元素的index
     *  @param stop 是否停止
     *
     *  @return
     */
    [self.titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect rect = (CGRect){
          idx * self.itemWidth, 2, self.itemWidth, self.frame.size.height
        };
        
        //设置文字属性的显示位置
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
        style.alignment = NSTextAlignmentCenter;
        
        
        
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:idx == self.selectedIndex?self.selectedTitleColor:self.titleColor, NSParagraphStyleAttributeName:style};
        
        [obj drawInRect:rect withAttributes:attributes];
    }];
    
}







@end

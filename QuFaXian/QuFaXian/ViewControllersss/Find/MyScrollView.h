//
//  MyScrollView.h
//  ScrollView封装
//
//  Created by licong on 16/2/26.
//  Copyright © 2016年 sunlink.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ScrollViewImageModel;

@interface MyScrollView : UICollectionReusableView<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSArray *picArray;

@property (nonatomic, assign) NSInteger scrollInterval;

@property (nonatomic, assign) NSInteger animationInterValue;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) NSTimer *timer;

- (void)setup;
@property (nonatomic, strong) ScrollViewImageModel *scrollModel;

@end

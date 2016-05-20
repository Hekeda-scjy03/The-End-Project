//
//  MyScrollView.m
//  ScrollView封装
//
//  Created by licong on 16/2/26.
//  Copyright © 2016年 sunlink.com. All rights reserved.
//

#import "MyScrollView.h"

@interface MyScrollView()
@end

@implementation MyScrollView
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        [self addTimer];
        
    }
    return self;
}

- (void)setup{
    UIScrollView *MyScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150.f)];
    MyScrollView.contentSize = CGSizeMake(ScreenWidth * 4, 0);
    MyScrollView.showsHorizontalScrollIndicator = NO;
    MyScrollView.showsVerticalScrollIndicator = NO;
    
    MyScrollView.delegate = self;
    
    MyScrollView.pagingEnabled = YES;
    
    self.picArray = @[[UIImage imageNamed:@"first"],[UIImage imageNamed:@"second"],[UIImage imageNamed:@"third"]];
    
    for (int i = 0; i < _picArray.count; i++) {
        UIImageView *imageViewTemp = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth * i, 0, ScreenWidth, self.frame.size.height)];
            imageViewTemp.image = _picArray[i];
        [self addSubview:imageViewTemp];
        
    }
    
    self.scrollView = MyScrollView;
    
    [self addSubview:self.scrollView];
    
    [MyScrollView scrollRectToVisible:CGRectMake(ScreenWidth, 0, ScreenWidth, Height) animated:YES];
    [self addPageControl];
}



#pragma mark - 定时器
- (void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)nextImage{
    int page = 0;
    if (self.pageControl.currentPage == 3) {
        page = 0;
    }else{
        page = (int)self.pageControl.currentPage + 1;
    }
    CGPoint offset = CGPointMake(ScreenWidth * page, 0);
    [self.scrollView setContentOffset:offset];
}

#pragma mark - 手动滑动scrollview时
- (void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}

#pragma mark - 添加PageControl
- (void)addPageControl{
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(ScreenWidth / 2 - 40, self.frame.size.height * 0.8, 70.f, 20.f)];
    
    _pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    //4页
    _pageControl.numberOfPages = 4;
    //当前为第一个
    _pageControl.currentPage = 0;
    
    [self addSubview:_pageControl];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _pageControl.currentPage = scrollView.contentOffset.x / ScreenWidth;
}





@end

//
//  HeaderView.m
//  01-团购案例
//
//  Created by hzy on 16/1/19.
//  Copyright © 2016年 hzy. All rights reserved.
//

#import "DynamicHeaderView.h"

@interface DynamicHeaderView () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl
;


@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation DynamicHeaderView

//当这个方法被执行的时候就表示HeaderView已经从 xib 中创建好了，那么也就意味
//着在HeaderView中的所有子控件也都创建好了，所以就可以使用UIScrollVie了。
- (void)awakeFromNib
{
    self.scrollView.delegate = self;
    
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, 0);
    
    //隐藏水平滚动指示器
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    //实现分页
    self.scrollView.pagingEnabled = YES;
    
    CGFloat imgY = 0;
    CGFloat imgW = self.scrollView.bounds.size.width;
    CGFloat imgH = self.scrollView.bounds.size.height;
    
    for (int i = 0; i < 3; i++)
    {
        CGFloat imgX = [UIScreen mainScreen].bounds.size.width * (i % 3);
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(imgX, imgY, imgW, imgH)];
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%02d",i + 1]];
        
        
        self.imgView = imgView;
        [self.scrollView addSubview:imgView];
        
        
    }
    
    
    //指定UIPageController的总数
    self.pageControl.numberOfPages = 3;
    
    //指定默认是第0页
    self.pageControl.currentPage = 0;
    

}



//实现UIScrollView的滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    //如何计算当前滚动到第几页？
    //1.获取滚动的x方向的偏移值
    CGFloat offSetX = scrollView.contentOffset.x;
    //用已经便宜了的值，加上半页的宽度
    offSetX = offSetX + ([UIScreen mainScreen].bounds.size.width * 0.5);
    
    //2.用x方向的偏移的值除以一张图片的宽度（每一页的宽度），取商就是当前滚到了第几页（索引）
    int page = offSetX / [UIScreen mainScreen].bounds.size.width;
    
    //3.将页码设置给UIPageControl
    self.pageControl.currentPage = page;
    
}


//实现即将开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
   
}


//实现拖拽完毕方法invalidate方法以后，这个计时器对象就已经废了，无法重用了。所以可以直接将self.timer设置为nil
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
}


- (void)scrollerImg
{
    //每次执行这个方法的时候，都要让图片滚动到下一页
    //获取当前的UIPageControl的页码
    NSInteger page = self.pageControl.currentPage;
    //判断是否到达最后
    if (page == self.pageControl.numberOfPages - 1)
    {
        page = 0; //回到第一页
    }
    else
    {
        page++;
    }
    
    //用每页的宽度 * （页码 + 1）== 计算除了下一页的contentOffset.x
    CGFloat offsetX = page * [UIScreen mainScreen].bounds.size.width;
    
    //设置scrollView的偏移量等于新的偏移值
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
    
    
}

+ (instancetype)dynamicHeaderView
{
    DynamicHeaderView *dynamicHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"DynamicHeaderView" owner:nil options:nil] lastObject];
    return dynamicHeaderView;
}
@end

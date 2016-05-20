//
//  HeaderView.m
//  01-团购案例
//
//  Created by hzy on 16/1/19.
//  Copyright © 2016年 hzy. All rights reserved.
//

#import "HomeHeaderView.h"
#import "HomeThemeButton.h"

@interface HomeHeaderView () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

// scrollView的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewHeight;

@property (weak, nonatomic) IBOutlet UIPageControl *pageController;

// pageController 的y坐标
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pageControllerY;


// 存放视频、音乐等按钮的View
@property (weak, nonatomic) IBOutlet UIView *themeView;

// themeView相对于底部的间距
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *themeMarginBottom;
// 主题按钮
@property (nonatomic, strong) HomeThemeButton *homeThemeBtn;


// 用来存放需要滚动的图片
@property (nonatomic, strong) UIImageView *imgView;


//创建一个属性，用来引用计时器对象
@property (nonatomic,strong) NSTimer *timer;

// 按钮标题数组
@property (nonatomic, strong) NSArray *btnTitleArray;

@end

@implementation HomeHeaderView

- (NSArray *)btnTitleArray
{
    if (_btnTitleArray == nil) {
        _btnTitleArray =  @[@"视频",@"音乐",@"关注",@"画册",@"科普",@"旅游",@"美食",@"创意"];
    }
    return _btnTitleArray;
}

#pragma mark - awakeFromNib
- (void)awakeFromNib
{
    self.scrollView.delegate = self;
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.height * 5, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    
    // 创建ImageView
    [self createImageView];
    
    // 创建主题按钮
    [self createHomeThemeButton];
    
    
    self.pageController.numberOfPages = 5;
    self.pageController.currentPage = 0;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollImg) userInfo:nil repeats:YES];
    
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    
    
}

#pragma mark - layoutSubviews
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置scrollView的高度
    self.scrollViewHeight.constant = self.frame.size.width * 0.493;
    
    // 设置pageController的y坐标
    self.pageControllerY.constant = self.frame.size.height * 0.413;
    
    // 设置themeView相对于HomeHeaderView底部的间距
    self.themeMarginBottom.constant = self.frame.size.height * 0.0267;

    
    // -----------计算按钮的frame-------------------
    int columns = 4;
    
    // themeView的宽度
    CGFloat themeViewWidth = self.themeView.frame.size.width ;
    CGFloat themeViewHeight = self.frame.size.width - self.scrollViewHeight.constant - self.themeMarginBottom.constant;
    //    CGFloat themeViewWidth = self.themeView.frame.size.width;
    //    CGFloat themeViewHeight = self.themeView.frame.size.height;
    
    //设置每个按钮的宽和高
    CGFloat homeThemeBtnW = themeViewWidth * 0.136;
    CGFloat homeThemeBtnH = themeViewHeight * 0.367;
    
    //第一行距离顶部的距离
    CGFloat marginTop = (themeViewHeight - homeThemeBtnH * 2) / 3;
    
    // 第一个按钮距左边的距离
    CGFloat marginX = 24;
    
    //假设每一列的之间间距
    CGFloat marginBtn = (themeViewWidth - homeThemeBtnW * columns - marginX * 2) / (columns - 1);
    
    for (int i = 0; i < self.themeView.subviews.count; i++)
    {
        //3.设置appView的frame属性
        // 计算每一列每个单元格所在的索引
        int colIndex = i % columns;
        
        // 计算每一行每个单元格所在的索引
        int rowIndex = i / columns;
        
        // 计算按钮的x，y
        CGFloat homeThemeBtnX = marginX + colIndex * (marginBtn + homeThemeBtnW);
        CGFloat homeThemeBtnY = marginTop + rowIndex * (marginTop + homeThemeBtnH);
        self.homeThemeBtn = self.themeView.subviews[i];
        self.homeThemeBtn.frame = CGRectMake(homeThemeBtnX, homeThemeBtnY, homeThemeBtnW, homeThemeBtnH);

    }

}

#pragma mark - 创建主题按钮
- (void)createHomeThemeButton
{
    for (int i = 0; i < self.btnTitleArray.count; i++)
    {
        HomeThemeButton *homeThemeBtn = [[HomeThemeButton alloc] init];
        
        homeThemeBtn.tag = i;
        
        [homeThemeBtn setTitle:self.btnTitleArray[i] forState:UIControlStateNormal];
        [homeThemeBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [homeThemeBtn setImage:[UIImage imageNamed:@"btn"] forState:(UIControlStateNormal)];
        
        homeThemeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.themeView addSubview:homeThemeBtn];
        
        self.homeThemeBtn = homeThemeBtn;
    }

}




#pragma mark - 创建imageView
- (void)createImageView
{
    CGFloat imgY = 0;
    CGFloat imgW = self.scrollView.bounds.size.width;
    CGFloat imgH = self.scrollView.bounds.size.height;
    
    for (int i = 0; i < 5; i++)
    {
        CGFloat imgX = self.scrollView.bounds.size.width * (i % 5);
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(imgX, imgY, imgW, imgH)];
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%02d",i + 1]];
        
        self.imgView = imgView;
        [self.scrollView addSubview:imgView];
        
    }
}


#pragma mark - 实现UIScrollView的滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offSetX = scrollView.contentOffset.x;
    offSetX = offSetX + (scrollView.frame.size.width * 0.5);
    
    int page = offSetX / scrollView.frame.size.width;
    self.pageController.currentPage = page;
    
}

#pragma mark - 即将开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - 完毕拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //重新启动计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollImg) userInfo:nil repeats:YES];

    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

#pragma mark - 图片滚动
- (void)scrollImg
{
    
    NSInteger page = self.pageController.currentPage;
    if (page == self.pageController.numberOfPages - 1)
    {
        page = 0; //回到第一页
    }
    else
    {
        page++;
    }
    
    
    CGFloat offsetX = page * self.scrollView.frame.size.width;
    
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}
    
    
#pragma mark - 创建homeHeaderView
+ (instancetype)homeHeaderView
{
        HomeHeaderView *homeHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"HomeHeaderView" owner:nil options:nil] lastObject];
        return homeHeaderView;
}
    
@end
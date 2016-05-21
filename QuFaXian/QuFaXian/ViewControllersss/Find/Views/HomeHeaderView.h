//
//  HeaderView.h
//  01-团购案例
//
//  Created by hzy on 16/1/19.
//  Copyright © 2016年 hzy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeThemeButton;

typedef enum btn{
    VideoBtn = 0,       // 视频
    MusicBtn = 1,       // 音乐
    FollowingBtn = 2,   // 关注
    GalleryBtn = 3,     // 画册
    ScienceBtn = 4,     // 科普
    TourismBtn = 5,     // 旅游
    FoodBtn = 6,        // 美食
    OriginalityBtn = 7  // 创意
    
}ThemeBtn;

@interface HomeHeaderView : UIView
// 主题按钮
@property (nonatomic, strong) HomeThemeButton *homeThemeBtn;
+ (instancetype)homeHeaderView;

@end

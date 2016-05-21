//
//  HomeThemeButton.h
//  QuFaXian
//
//  Created by hzy on 16/5/16.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>


// 定义按钮协议
@protocol HomeThemeButtonDelegate <NSObject>

- (void)videoBtnClickPushIntoViewController:(id)sender;

@end

@interface HomeThemeButton : UIButton

@property (nonatomic, weak) id<HomeThemeButtonDelegate> delegate;

@end

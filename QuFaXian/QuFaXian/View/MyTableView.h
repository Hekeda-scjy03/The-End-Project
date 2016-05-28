//
//  MyTableView.h
//  QuFaXian
//
//  Created by licong on 16/5/27.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    panToLeft,
    panToRight,
} PanDirection;

typedef enum : NSUInteger {
    creativity = 100008,
    music = 100006,
    film = 100002,
    life = 100012,
    delicious = 100003,
    travel = 100016,
    science = 100015
} TableViewDataType;

@protocol MyTableViewPanDelegate <NSObject>

- (void)pandirection:(PanDirection)direction;

@end

@interface MyTableView : UITableView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIViewController *selfVC;

//当前页数
@property(nonatomic, assign)int page;

@property(nonatomic, assign)TableViewDataType dataType;

@property(nonatomic, strong)NSMutableArray *dataArray;

//初始触摸点
@property(nonatomic, assign)CGPoint startPoint;

@property (nonatomic, weak) id<MyTableViewPanDelegate> panDelegate;

@property (nonatomic, assign) int urlStart;

@end

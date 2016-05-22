//
//  CreaterContentHeader.h
//  QuFaXian
//
//  Created by licong on 16/5/15.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  点击内容 讨论时 切换详情VC的下面的cell列表
 */
@protocol ClickBtnToRefreshListDelegate <NSObject>

- (void)clickBtnToRefreshList;

@end

@class CubeDetailModel;

@interface CreaterContentHeader : UITableViewHeaderFooterView

@property (nonatomic, assign) id<ClickBtnToRefreshListDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIImageView *headerBackImg;

@property (weak, nonatomic) IBOutlet UIImageView *headerBigHeadImage;

@property (weak, nonatomic) IBOutlet UILabel *stateName;

@property (weak, nonatomic) IBOutlet UIButton *discussBtn;

@property (weak, nonatomic) IBOutlet UIButton *contentsBtn;

@property (weak, nonatomic) IBOutlet UILabel *focusNum;

@property (weak, nonatomic) IBOutlet UILabel *stateDescription;

@property (weak, nonatomic) IBOutlet UIImageView *stateCreateHeadImg;

@property (weak, nonatomic) IBOutlet UILabel *stateCreateName;

@property (weak, nonatomic) IBOutlet UILabel *stateCreateIntroduction;

//header类型为内容站的时候显示该view
@property (weak, nonatomic) IBOutlet UIView *contentsStateView;

@property (nonatomic, strong) CubeDetailModel *cubeDetail;

@end

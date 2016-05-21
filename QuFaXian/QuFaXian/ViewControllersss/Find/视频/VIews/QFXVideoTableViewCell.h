//
//  QFXVideoTableViewCell.h
//  QuFaXian
//
//  Created by hzy on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFXVideoDataModel.h"

@interface QFXVideoTableViewCell : UITableViewCell

// 数据模型
@property (nonatomic, strong) QFXVideoDataModel *videoDataModel;

// 存放标题label和内容描述label的View
@property (weak, nonatomic) IBOutlet UIView *storeLabelView;

// 标题label
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

// 内容描述label
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

// 视频类型label
@property (weak, nonatomic) IBOutlet UILabel *videoTypeLabel;

// 头像按钮
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;

// 时间按钮
@property (weak, nonatomic) IBOutlet UIButton *timeBtn;

// 播放按钮
@property (weak, nonatomic) IBOutlet UIButton *playBtn;

// 创建cell的方法
+ (instancetype)videoTableViewCell:(UITableView *)tableView;
@end

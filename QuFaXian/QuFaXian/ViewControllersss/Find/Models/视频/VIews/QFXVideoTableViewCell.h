//
//  QFXVideoTableViewCell.h
//  QuFaXian
//
//  Created by hzy on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFXVideoMeowsModel.h"

@interface QFXVideoTableViewCell : UITableViewCell

// 数据模型
@property (nonatomic, strong) QFXVideoMeowsModel *videoData;

// 创建cell的方法
+ (instancetype)videoTableViewCell:(UITableView *)tableView;

@property (nonatomic, assign) CGFloat height;

@end

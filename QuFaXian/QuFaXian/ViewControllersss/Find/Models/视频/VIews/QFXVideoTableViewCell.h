//
//  QFXVideoTableViewCell.h
//  QuFaXian
//
//  Created by hzy on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFXMeowsModel.h"

@interface QFXVideoTableViewCell : UITableViewCell

// 数据模型
@property (nonatomic, strong) QFXMeowsModel *videoData;



// 播放按钮
@property (weak, nonatomic) IBOutlet UIButton *playBtn;

// 创建cell的方法
+ (instancetype)videoTableViewCell:(UITableView *)tableView;

@property (nonatomic, assign) CGFloat height;
@end

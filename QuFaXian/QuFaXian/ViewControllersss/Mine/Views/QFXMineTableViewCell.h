//
//  QFXMineTableViewCell.h
//  QuFaXian
//
//  Created by hzy on 16/5/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingMessage.h"
@interface QFXMineTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;

@property (nonatomic, strong) SettingMessage *settingMessageModel;

+ (instancetype)mineTableViewCellWithTable:(UITableView *)tableView;

@end

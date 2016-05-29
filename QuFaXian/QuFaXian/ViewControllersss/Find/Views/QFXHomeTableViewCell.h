//
//  QFXHomeTableViewCell.h
//  QuFaXian
//
//  Created by hzy on 16/5/22.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QFXEntity_List;

@interface QFXHomeTableViewCell : UITableViewCell

@property (nonatomic, strong) QFXEntity_List *homeDataModel;

@property (nonatomic, assign) CGFloat height;

+ (instancetype)homeTableViewCellWithTable:(UITableView *)tableView;

@end

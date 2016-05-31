//
//  QFXHomeTableViewCell.h
//  QuFaXian
//
//  Created by hzy on 16/5/22.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QFXEntity_List;
//@class QFXHomeMeowModel;

@interface QFXHomeTableViewCell : UITableViewCell

@property (nonatomic, strong) QFXEntity_List *homeDataModel;
//@property (nonatomic, strong) QFXHomeMeowModel *homeDataModel;


@property (nonatomic, assign) CGFloat height;

@property (nonatomic, copy) NSString *dataID;


+ (instancetype)homeTableViewCellWithTable:(UITableView *)tableView;

@end

//
//  QFXHomeTableViewCell.m
//  QuFaXian
//
//  Created by hzy on 16/5/22.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXHomeTableViewCell.h"

@implementation QFXHomeTableViewCell

+ (instancetype)homeTableViewCellWithTable:(UITableView *)tableView
{
    static NSString *ID = @"reuse_homeCell";
    QFXHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"QFXHomeTableViewCell" owner:nil options:nil].lastObject;
    }
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

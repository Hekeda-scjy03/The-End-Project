//
//  GoodsCell.m
//  01-团购案例
//
//  Created by hzy on 16/1/18.
//  Copyright © 2016年 hzy. All rights reserved.
//

#import "QFXDynmaicCell.h"

@interface QFXDynmaicCell ()
// 头像
@property (weak, nonatomic) IBOutlet UIImageView *iconImageVIew;
// 标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
// 描述
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
// 未读按钮
@property (weak, nonatomic) IBOutlet UIButton *weiduBtn;
// 未读按钮的点击事件
- (IBAction)weiduBtnClick;

@end

@implementation QFXDynmaicCell
#pragma mark - 创建cell
+ (instancetype)dynmaicCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"dynmaic_cell";
    QFXDynmaicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"QFXDynmaicCell" owner:nil options:nil] firstObject];
    }
    return cell;

}

#pragma mark - 未读按钮的点击事件
- (IBAction)weiduBtnClick {
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end

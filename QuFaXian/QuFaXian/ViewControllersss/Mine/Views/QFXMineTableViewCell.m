//
//  QFXMineTableViewCell.m
//  QuFaXian
//
//  Created by hzy on 16/5/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXMineTableViewCell.h"

@interface QFXMineTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation QFXMineTableViewCell

+ (instancetype)mineTableViewCellWithTable:(UITableView *)tableView
{
    static NSString *ID = @"mine_cell";
    QFXMineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"QFXMineTableViewCell" owner:nil options:nil].lastObject;
        }
    return cell;
}

- (void)setSettingMessageModel:(SettingMessage *)settingMessageModel
{
    _settingMessageModel = settingMessageModel;
    self.titleLbl.text = settingMessageModel.title;
    self.imgView.image = [UIImage imageNamed:settingMessageModel.titleImage];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

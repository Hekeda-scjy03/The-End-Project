//
//  QFXVideoTableViewCell.m
//  QuFaXian
//
//  Created by hzy on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXVideoTableViewCell.h"

@interface QFXVideoTableViewCell ()

// 底部存放标题标签的View
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *storeViewHeight;

// 头像按钮距离顶部的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconBtnMarginTopValue;

// 头像按钮的宽度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconBtnWidth;
// 头像按钮的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconBtnHeight;

// 播放按钮距离顶部的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *playBtnMarginTopValue;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *playBtnWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *playBtnHeight;

@end

@implementation QFXVideoTableViewCell

+ (instancetype)videoTableViewCell:(UITableView *)tableView
{
    static NSString *ID = @"video_tableViewCell";
    QFXVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"QFXVideoTableViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

/*
- (void)layoutSubviews
{
    // 设置storeViewHeight的高度
    self.storeViewHeight.constant = CGRectGetMaxY(self.descriptionLabel.frame) + 26;
    
    // 重置cell的frame
    CGRect temp = self.frame;
    temp.size.height = self.storeViewHeight.constant / (99 / 235);
    self.frame = temp;
    
    self.iconBtnMarginTopValue.constant = self.frame.size.height * (89 / 235);
    self.iconBtnWidth.constant = self.frame.size.width * (45 / 235);
    self.iconBtnHeight.constant = self.iconBtnWidth.constant;
    
    
    self.playBtnMarginTopValue.constant = self.frame.size.height * (13 / 235);
    self.playBtnWidth.constant = self.frame.size.width * (55 / 375);
    self.playBtnHeight.constant = self.playBtnWidth.constant;
}
*/



//- (void)setVideoDataModel:(QFXVideoDataModel *)videoDataModel
//{
//    _videoDataModel = videoDataModel;
//    [self layoutIfNeeded];
//    self.videoDataModel.cellHeight = CGRectGetMaxY(self.descriptionLabel.frame) + 26 + 10;
//}



- (void)awakeFromNib {
    
    self.titleLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 40;
    self.descriptionLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 30;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  QFXVideoTableViewCell.m
//  QuFaXian
//
//  Created by hzy on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXVideoTableViewCell.h"
#import <UIButton+WebCache.h>
#import <UIImageView+WebCache.h>
#import <SDImageCache.h>

@interface QFXVideoTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

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

#pragma mark - 创建cell
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

#pragma mark - 设置数据
- (void)setVideoData:(QFXVideoMeowsModel *)videoData
{
    _videoData = videoData;
    self.titleLabel.text = videoData.title;
    self.descriptionLabel.text = videoData.desc;
    
    [self.iconBtn.imageView sd_setImageWithURL:[NSURL URLWithString:videoData.group.logo_url]];
    self.videoTypeLabel.text = videoData.group.name;
    
    // 设置按钮图片
    [self.iconBtn sd_setImageWithURL:[NSURL URLWithString:videoData.group.logo_url] forState:(UIControlStateNormal)];
    
    [self.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:videoData.thumb.raw]];
    
    // 设置cell高度
    [self setupCellHeight];
    
    
}

#pragma mark - 设置cell高度
- (void)setupCellHeight
{
    // 计算titleLabel的高度
    NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:17.f]};
    
    CGFloat titleLabelHeight = [self.titleLabel.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size.height;
    
     // 计算descriptionLabel的高度
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14.f]};
    
    CGFloat descriptionLabelHeight = [self.descriptionLabel.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-30, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.height;
    
    
    descriptionLabelHeight = descriptionLabelHeight > 67 ? 67 : descriptionLabelHeight;
    
   
    
    
    
     // 计算descriptionLabel的最大Y值
    CGFloat descriptionLabelMaxY = CGRectGetMinY(self.titleLabel.frame) + titleLabelHeight + 10 + descriptionLabelHeight;
  
    
    self.storeViewHeight.constant = descriptionLabelMaxY + 20;
    
    self.height = CGRectGetMinY(self.storeLabelView.frame) + self.storeViewHeight.constant;
//    [self setNeedsLayout];

}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

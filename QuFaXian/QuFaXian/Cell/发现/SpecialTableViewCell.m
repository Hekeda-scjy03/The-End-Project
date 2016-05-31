//
//  SpecialTableViewCell.m
//  QuFaXian
//
//  Created by licong on 16/5/30.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "SpecialTableViewCell.h"
#import "SpecialEntityList.h"
#import <UIImageView+WebCache.h>
@implementation SpecialTableViewCell

- (void)setListModel:(SpecialEntityList *)listModel{
    _listModel = listModel;
    
    [self.backImg sd_setImageWithURL:[NSURL URLWithString:listModel.cellImg]];
    
    self.creatorName.text = listModel.creatorName;
    self.category.text = listModel.category;
    
    [self.head.imageView sd_setImageWithURL:[NSURL URLWithString:listModel.creatorHead]];
    
    self.title.text = listModel.title;
    
    self.context.text = listModel.des;
    
    self.likeNum.text = [NSString stringWithFormat:@"%@",listModel.likeNum];
    
    self.commentNum.text = [NSString stringWithFormat:@"%@",listModel.commentNum];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  GroupContentTableViewCell.m
//  QuFaXian
//
//  Created by licong on 16/5/15.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "GroupContentTableViewCell.h"
#import "CubeDetailModel.h"
#import <UIImageView+WebCache.h>
#import "QFXTools.h"
@implementation GroupContentTableViewCell

- (void)setCubeDetail:(CubeDetailModel *)cubeDetail{
    _cubeDetail = cubeDetail;
    
    [self.groupHeadImage.imageView sd_setImageWithURL:[NSURL URLWithString:cubeDetail.senderHeadImg]];
    
    self.groupName.text = cubeDetail.senderName;
    self.groupDescription.text = cubeDetail.senderDes;
    
    self.groupTime.text = [QFXTools dateStringToTimeString:[cubeDetail.time stringValue]];
    
    self.groupTitle.text = cubeDetail.title;
    self.groupContent.text = cubeDetail.cellText;
    
    self.likeNum.text = [cubeDetail.likeNum stringValue];
    
    self.cotentNum.text = [cubeDetail.commentNum stringValue];
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - button点击事件
- (IBAction)clickBtnMethod:(id)sender {
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        default:
            break;
    }
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  CreaterContentTableViewCell.m
//  QuFaXian
//
//  Created by licong on 16/5/15.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "CreaterContentTableViewCell.h"
#import "CubeDetailModel.h"
#import <UIImageView+WebCache.h>
@implementation CreaterContentTableViewCell

- (void)setCubeDetail:(CubeDetailModel *)cubeDetail{
    _cubeDetail = cubeDetail;
    
    self.timeLabel.text = cubeDetail.time;
    
    self.typeLabel.text = cubeDetail.category;
    
    [self.backImage sd_setImageWithURL:[NSURL URLWithString:cubeDetail.backgroundImg]];
    
    self.subTitle.text = cubeDetail.intro;
    self.title.text = cubeDetail.title;
    self.descriptonOfContents.text = cubeDetail.des;
    self.likeNum.text = cubeDetail.cellZanNum;
    self.commentNum.text = cubeDetail.cellCommentNum;
    
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    

}

#pragma mark - 点击事件
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

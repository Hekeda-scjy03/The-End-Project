//
//  ContentsStateTableViewCell.m
//  QuFaXian
//
//  Created by licong on 16/5/15.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "ContentsStateTableViewCell.h"
#import "CubeDetailModel.h"
@implementation ContentsStateTableViewCell

- (void)setCubeDetail:(CubeDetailModel *)cubeDetail{
    self.timeLabel.text = cubeDetail.time;
    self.contentStateSubTitle.text = [NSString stringWithFormat:@"%d张图",24]; //image_count
    self.contentStateType.text = cubeDetail.des;
    self.contentStateTitle.text = cubeDetail.title;
    self.commentNum.text = cubeDetail.cellCommentNum;
    self.likeNum.text = cubeDetail.cellZanNum;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

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

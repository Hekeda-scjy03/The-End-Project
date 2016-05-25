//
//  FindCreaterListTableViewCell.m
//  QuFaXian
//
//  Created by licong on 16/5/11.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "FindCreatorListTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "CreatorModel.h"
@implementation FindCreatorListTableViewCell

- (void)setCreatorModel:(CreatorModel *)creatorModel{
    _creatorModel = creatorModel;
    
    [self.header sd_setImageWithURL:[NSURL URLWithString:creatorModel.headImg]];
    self.stateDes.text = creatorModel.des;
    self.stateName.text = creatorModel.name;
    
    self.memberNum.text = [NSString stringWithFormat:@"%@个成员",creatorModel.membersNum];
    self.topicNum.text = [NSString stringWithFormat:@"%@内容",creatorModel.topicsNum];
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

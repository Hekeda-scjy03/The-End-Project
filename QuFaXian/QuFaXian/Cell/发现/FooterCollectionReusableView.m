//
//  CollectionReusableView.m
//  QuFaXian
//
//  Created by licong on 16/5/11.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "FooterCollectionReusableView.h"
#import "ActivityModel.h"
#import <UIImageView+WebCache.h>
@interface FooterCollectionReusableView ()

@property (weak, nonatomic) IBOutlet UILabel *footerName;

@property (weak, nonatomic) IBOutlet UIImageView *footerBackImage;

@property (weak, nonatomic) IBOutlet UILabel *footerIntroduce;

@property (weak, nonatomic) IBOutlet UILabel *participantNum;

@end

@implementation FooterCollectionReusableView

- (void)setActivityModel:(ActivityModel *)activityModel{
    _activityModel = activityModel;
    
    self.footerName.text = activityModel.title;
    [self.footerBackImage sd_setImageWithURL:[NSURL URLWithString:activityModel.backImage]];
    
    self.participantNum.text = [NSString stringWithFormat:@"%@人参加",activityModel.participationNum];
    self.footerIntroduce.text = activityModel.des;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end

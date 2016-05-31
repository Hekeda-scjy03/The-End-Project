//
//  SpecialTableViewCell.h
//  QuFaXian
//
//  Created by licong on 16/5/30.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SpecialEntityList;
@interface SpecialTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *backImg;

@property (weak, nonatomic) IBOutlet UILabel *creatorName;

@property (weak, nonatomic) IBOutlet UILabel *category;

@property (weak, nonatomic) IBOutlet UIButton *head;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *context;

@property (weak, nonatomic) IBOutlet UILabel *likeNum;

@property (weak, nonatomic) IBOutlet UILabel *commentNum;

@property (nonatomic, strong) SpecialEntityList *listModel;

@end

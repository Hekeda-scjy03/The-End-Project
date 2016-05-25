//
//  FindCreaterListTableViewCell.h
//  QuFaXian
//
//  Created by licong on 16/5/11.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CreatorModel;
@interface FindCreatorListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *header;

@property (weak, nonatomic) IBOutlet UILabel *stateName;

@property (weak, nonatomic) IBOutlet UILabel *memberNum;

@property (weak, nonatomic) IBOutlet UILabel *topicNum;

@property (weak, nonatomic) IBOutlet UILabel *stateDes;

@property (nonatomic, strong) CreatorModel *creatorModel;

@end

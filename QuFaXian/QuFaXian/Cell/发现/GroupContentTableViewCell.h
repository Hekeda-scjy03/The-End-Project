//
//  GroupContentTableViewCell.h
//  QuFaXian
//
//  Created by licong on 16/5/15.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupContentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *groupHeadImage;

@property (weak, nonatomic) IBOutlet UILabel *groupName;

@property (weak, nonatomic) IBOutlet UILabel *groupDescription;

@property (weak, nonatomic) IBOutlet UILabel *groupTime;

@property (weak, nonatomic) IBOutlet UILabel *groupTitle;

@property (weak, nonatomic) IBOutlet UILabel *groupContent;

@property (weak, nonatomic) IBOutlet UIImageView *groupContentImg;

@property (weak, nonatomic) IBOutlet UILabel *likeNum;

@property (weak, nonatomic) IBOutlet UILabel *cotentNum;


@end

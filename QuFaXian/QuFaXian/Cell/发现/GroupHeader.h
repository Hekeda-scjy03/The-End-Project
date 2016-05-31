//
//  GroupHeader.h
//  QuFaXian
//
//  Created by licong on 16/5/15.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CubeModel;
@interface GroupHeader : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UIImageView *backImage;

@property (weak, nonatomic) IBOutlet UILabel *groupName;

@property (weak, nonatomic) IBOutlet UILabel *groupMemberNum;

@property (weak, nonatomic) IBOutlet UILabel *groupIntroduction;

//点击该view会获取成员列表
@property (weak, nonatomic) IBOutlet UIView *groupMemberMore;

@property (nonatomic, strong) CubeModel *cubeModel;

@property (nonatomic, strong) NSArray *imageDictArray;

@property (weak, nonatomic) IBOutlet UIImageView *headF;

@property (weak, nonatomic) IBOutlet UIImageView *headS;

@property (weak, nonatomic) IBOutlet UIImageView *headT;

@property (weak, nonatomic) IBOutlet UIImageView *headFour;

@property (weak, nonatomic) IBOutlet UIImageView *headFif;

@end

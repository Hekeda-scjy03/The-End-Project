//
//  GroupHeader.h
//  QuFaXian
//
//  Created by licong on 16/5/15.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupHeader : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UILabel *groupName;

@property (weak, nonatomic) IBOutlet UILabel *groupMemberNum;

@property (weak, nonatomic) IBOutlet UILabel *groupIntroduction;

//点击该view会获取成员列表
@property (weak, nonatomic) IBOutlet UIView *groupMemberMore;


@end

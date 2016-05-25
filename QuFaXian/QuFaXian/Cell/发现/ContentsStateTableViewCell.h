//
//  ContentsStateTableViewCell.h
//  QuFaXian
//
//  Created by licong on 16/5/15.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CubeDetailModel;
@interface ContentsStateTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backImage;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentStateTitle;

@property (weak, nonatomic) IBOutlet UILabel *contentStateSubTitle;

@property (weak, nonatomic) IBOutlet UILabel *contentStateType;

@property (weak, nonatomic) IBOutlet UILabel *commentNum;

@property (weak, nonatomic) IBOutlet UILabel *likeNum;

@property (nonatomic, strong) CubeDetailModel *cubeDetail;

@end

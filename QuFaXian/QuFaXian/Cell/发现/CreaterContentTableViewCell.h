//
//  CreaterContentTableViewCell.h
//  QuFaXian
//
//  Created by licong on 16/5/15.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CubeDetailModel;
@interface CreaterContentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *backImage;

@property (weak, nonatomic) IBOutlet UILabel *subTitle;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *descriptonOfContents;

@property (weak, nonatomic) IBOutlet UILabel *likeNum;

@property (weak, nonatomic) IBOutlet UILabel *commentNum;

@property (nonatomic, strong) CubeDetailModel *cubeDetail;

@end

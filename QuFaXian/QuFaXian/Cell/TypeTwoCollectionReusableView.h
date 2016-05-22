//
//  TypeTwoCollectionReusableView.h
//  QuFaXian
//
//  Created by licong on 16/5/22.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CubeDetailModel;

@interface TypeTwoCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIButton *headImage;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *time;

@property (weak, nonatomic) IBOutlet UILabel *texts;

@property (weak, nonatomic) IBOutlet UILabel *likeNum;

@property (weak, nonatomic) IBOutlet UILabel *commentNum;

@property (nonatomic, strong) CubeDetailModel *cubeDetail;

@end

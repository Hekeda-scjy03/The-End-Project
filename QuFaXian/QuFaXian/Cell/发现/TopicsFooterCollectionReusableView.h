//
//  TopicsFooterCollectionReusableView.h
//  QuFaXian
//
//  Created by licong on 16/5/14.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpecialModel.h"
@interface TopicsFooterCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIImageView *topicImage;

@property (weak, nonatomic) IBOutlet UILabel *specialTitle;

@property (weak, nonatomic) IBOutlet UILabel *contentNum;

@property (weak, nonatomic) IBOutlet UIImageView *specialNameImage;

@property (nonatomic, strong) SpecialModel *specialModel;

@end

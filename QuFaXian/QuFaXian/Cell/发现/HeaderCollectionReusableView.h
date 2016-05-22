//
//  HeaderCollectionReusableView.h
//  QuFaXian
//
//  Created by licong on 16/5/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCViewPagerView.h"

@interface HeaderCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet LCViewPagerView *viewPager;

@property (weak, nonatomic) IBOutlet UIImageView *directoryBtn;

@property (weak, nonatomic) IBOutlet UIButton *creatorBtn;

@property (nonatomic, strong) NSMutableArray *bannerList;

@end

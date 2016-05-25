//
//  HeaderCollectionReusableView.h
//  QuFaXian
//
//  Created by licong on 16/5/21.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCViewPagerView.h"

typedef void(^HeaderBtnClickBlock)(NSInteger tag);

@interface HeaderCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet LCViewPagerView *viewPager;

@property (weak, nonatomic) IBOutlet UIImageView *directoryBtn;

@property (nonatomic, strong) NSMutableArray *bannerList;

@property (nonatomic, copy) HeaderBtnClickBlock headerBtnClickBlock;

@end

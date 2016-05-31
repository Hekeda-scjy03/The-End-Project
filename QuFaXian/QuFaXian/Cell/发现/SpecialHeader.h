//
//  SpecialHeader.h
//  QuFaXian
//
//  Created by licong on 16/5/30.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SpecialCellModel;
@interface SpecialHeader : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UIImageView *specialHeaderBackImg;

@property (weak, nonatomic) IBOutlet UILabel *specialHeaderTitle;

@property (weak, nonatomic) IBOutlet UILabel *specialHeaderContentNum;

@property (nonatomic, strong) SpecialCellModel *specialModel;

@end

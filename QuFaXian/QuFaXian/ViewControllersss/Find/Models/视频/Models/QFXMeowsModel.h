//
//  MeowsModel.h
//  QuFaXian
//
//  Created by hzy on 16/5/26.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFXGroupModel.h"
#import "QFXThumbModel.h"
#import "QFXCategory.h"

@interface QFXMeowsModel : NSObject




// 视频的标题
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, strong) QFXGroupModel *group;
@property (nonatomic, strong) QFXThumbModel *thumb;
@property (nonatomic, strong) QFXCategory *category;


@end

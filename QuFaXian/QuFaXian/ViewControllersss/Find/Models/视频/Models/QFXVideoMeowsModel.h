//
//  MeowsModel.h
//  QuFaXian
//
//  Created by hzy on 16/5/26.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFXVideoGroupModel.h"
#import "QFXVideoThumbModel.h"
#import "QFXVideoCategory.h"

@interface QFXVideoMeowsModel : NSObject




// 视频的标题
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, strong) QFXVideoGroupModel *group;
@property (nonatomic, strong) QFXVideoThumbModel *thumb;
@property (nonatomic, strong) QFXVideoCategory *category;


@end

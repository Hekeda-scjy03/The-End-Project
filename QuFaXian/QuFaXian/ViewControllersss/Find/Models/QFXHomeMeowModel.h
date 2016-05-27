//
//  QFXMeowModel.h
//  QuFaXian
//
//  Created by hzy on 16/5/28.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFXHomeGroupModel.h"
#import "QFXHomeThumbModel.h"
#import "QFXHomeUserModel.h"
#import "QFXHomeCategoryModel.h"

@interface QFXHomeMeowModel : NSObject
// 作者
@property (nonatomic, copy) NSString *author;
// 正文
@property (nonatomic, copy) NSString *text;
// 标题
@property (nonatomic, copy) NSString *title;
// 描述
@property (nonatomic, copy) NSString *desc;
// 评论数
@property (nonatomic, copy) NSString *comment_count;
// 类型
@property (nonatomic, copy) NSString *meow_type;
// id
@property (nonatomic, copy) NSString *ID;




@property (nonatomic, strong) QFXHomeGroupModel *group;
@property (nonatomic, strong) QFXHomeThumbModel *thumb;
@property (nonatomic, strong) QFXHomeUserModel *user;
@property (nonatomic, strong) QFXHomeCategoryModel *category;



@end

//
//  QFXStatusCacheTool.h
//  FMDB封装
//
//  Created by hzy on 16/5/11.
//  Copyright © 2016年 hzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QFXStatusCacheTool : NSObject

/*
  8张表:
  推荐：t_explore
  关注：t_following
  视频：t_video
  音乐：t_music
  画册：t_gallery
  发现：t_found
  动态：t_dynamic
  我的：t_me
 */

// 存数据的方法
// 数组 statuses 保存的是网络请求之后返回的数据
+ (void)saveWithStatus:(NSArray *)statuses intoTable:(NSString *)tableName;


// 取数据
+ (NSArray *)getStatusWithTableName:(NSString *)tableName;

@end

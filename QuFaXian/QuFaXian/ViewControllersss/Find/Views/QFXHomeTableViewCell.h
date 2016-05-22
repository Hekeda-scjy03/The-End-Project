//
//  QFXHomeTableViewCell.h
//  QuFaXian
//
//  Created by hzy on 16/5/22.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFXHomeTableViewCell : UITableViewCell
// ----------------第一种类型------------------
@property (weak, nonatomic) IBOutlet UIView *typeViewAboutImageAndDes;
// 背景图片
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
// 视频播放按钮
@property (weak, nonatomic) IBOutlet UIButton *videoPlayBnt;
// 音乐播放按钮
@property (weak, nonatomic) IBOutlet UIButton *musicPlayBtn;
// 类型
@property (weak, nonatomic) IBOutlet UILabel *catagyLabel;
// 时间
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
// 底部视图
@property (weak, nonatomic) IBOutlet UIView *bottomView;
// 标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
// 描述
@property (weak, nonatomic) IBOutlet UILabel *desLabel;
// 收藏按钮
@property (weak, nonatomic) IBOutlet UIButton *shoucangBtn;
// 点赞按钮
@property (weak, nonatomic) IBOutlet UIButton *dianzanBtn;
// 评论按钮
@property (weak, nonatomic) IBOutlet UIButton *pinglunBtn;

// ----------------第二种类型(图片)------------------
@property (weak, nonatomic) IBOutlet UIView *typeViewAboutImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel2;
@property (weak, nonatomic) IBOutlet UILabel *desLabel2;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel2;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage2;
@property (weak, nonatomic) IBOutlet UIButton *shoucangBtn2;
@property (weak, nonatomic) IBOutlet UIButton *dianZanBtn2;
@property (weak, nonatomic) IBOutlet UIButton *pingLunBtn2;

// ----------------第三种类型(九宫格)------------------
@property (weak, nonatomic) IBOutlet UIView *typeViewAboutSudoku;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel3;
@property (weak, nonatomic) IBOutlet UILabel *desLabel3;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel3;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewTag0;







+ (instancetype)homeTableViewCellWithTable:(UITableView *)tableView;

@end

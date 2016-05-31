//
//  QFXHomeTableViewCell.m
//  QuFaXian
//
//  Created by hzy on 16/5/22.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "QFXHomeTableViewCell.h"
#import "QFXEntity_List.h"
//#import "QFXHomeMeowModel.h"
#import <UIButton+WebCache.h>
#import <UIImageView+WebCache.h>
#import <SDImageCache.h>
#import "QFXHomeDetailsViewController.h"

@interface QFXHomeTableViewCell ()



// ----------------第一种类型------------------
@property (weak, nonatomic) IBOutlet UIView *typeViewAboutImageAndDes;
// 背景图片
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
// 视频播放按钮
@property (weak, nonatomic) IBOutlet UIButton *videoPlayBnt;
- (IBAction)videPlayBtnClick:(id)sender;

// 音乐播放按钮
@property (weak, nonatomic) IBOutlet UIButton *musicPlayBtn;
- (IBAction)musicPlayBtnClick:(id)sender;

// 类型
@property (weak, nonatomic) IBOutlet UILabel *catagyLabel;

@property (weak, nonatomic) IBOutlet UIImageView *musicIcon;

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
@property (weak, nonatomic) IBOutlet UIView *imageViewSuperView;



@property (nonatomic, strong) NSMutableArray *rawArray;


@end

@implementation QFXHomeTableViewCell


#pragma mark - 创建cell
+ (instancetype)homeTableViewCellWithTable:(UITableView *)tableView
{
    static NSString *ID = @"reuse_homeCell";
    QFXHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"QFXHomeTableViewCell" owner:nil options:nil].lastObject;
    }
    return cell;
}

#pragma mark - 模型的set方法
-(void)setHomeDataModel:(QFXEntity_List *)homeDataModel
{
    _homeDataModel = homeDataModel;
    
    // 展示第一种样式
    [self showTypeViewAboutImageAndDes:homeDataModel];
    
    // 展示第二种样式
    [self showTypeViewAboutImage:homeDataModel];
    
    // 展示第三种样式
    [self showTyprViewAboutSudoku:homeDataModel];
    
    
    
    
    
    
}

#pragma mark - 设置cell高度
- (void)setupCellHeight
{
    //----------- 第1种情况 --------------
    // 计算titleLabel的高度
    NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:17.f]};
    
    CGFloat titleLabelHeight = [self.titleLabel.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size.height;
    
    // 计算descriptionLabel的高度
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12.f]};
    
    CGFloat descriptionLabelHeight = [self.desLabel.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.height;
    
    descriptionLabelHeight = descriptionLabelHeight > 57 ? 57 : descriptionLabelHeight;
    
    // 计算bottomView的高度
    CGFloat bottomViewH = 5 + titleLabelHeight + 10 + descriptionLabelHeight +20 + self.shoucangBtn.frame.size.height + 10;
    
    // 计算背景imageView的最大y值
    CGFloat backgroundImageViewMaxY = CGRectGetMaxY(self.backgroundImage.frame);
   
    // 计算cell的高度
    self.height = bottomViewH + backgroundImageViewMaxY;
    
    
}

#pragma mark - 展示第1种样式的cell
- (void)showTypeViewAboutImageAndDes:(QFXEntity_List *)homeDataModel
{
    NSString *meow_type = homeDataModel.meow.meow_type;
    
    if (([meow_type isEqualToString:@"4"]) || ([meow_type isEqualToString:@"9"])) {
        
        
         [self setupTypeViewAboutImageAndDesData:homeDataModel];
        
        
    }else if (([meow_type isEqualToString:@"7"])){// 视频
        
        self.videoPlayBnt.hidden = NO;
        
        [self setupTypeViewAboutImageAndDesData:homeDataModel];
        
    }
    else if (([meow_type isEqualToString:@"8"])){// 音乐
        self.musicPlayBtn.hidden = NO;
        self.musicIcon.hidden = NO;
        [self setupTypeViewAboutImageAndDesData:homeDataModel];
    }
    
}

#pragma mark - 展示第2种样式的cell
- (void)showTypeViewAboutImage:(QFXEntity_List *)homeDataModel
{
    NSString *meow_type = homeDataModel.meow.meow_type;
    ;
    
    if ((([meow_type isEqualToString:@"3"]) && (homeDataModel.meow.pics.count == 0)) || ([meow_type isEqualToString:@"2"])) {
        self.typeViewAboutImageAndDes.hidden = YES;
        self.typeViewAboutImage.hidden = NO;
        self.typeViewAboutSudoku.hidden = YES;
       
        [self setupTypeViewAboutImageData:homeDataModel];
    }
}

#pragma mark - 展示第3种样式的cell
- (void)showTyprViewAboutSudoku:(QFXEntity_List *)homeDataModel
{
    NSString *meow_type = homeDataModel.meow.meow_type;
    ;
    
    if (([meow_type isEqualToString:@"3"]) && (homeDataModel.meow.pics.count != 0)) {
        
        
        // 获取pics数组
        NSMutableArray *rawArray = [NSMutableArray array];
        for (QFXHomePicsModel *pics in homeDataModel.meow.pics) {
            [rawArray addObject:pics.raw];
        }
        self.rawArray = rawArray;
        
        if (rawArray.count != 9) {
            self.typeViewAboutImageAndDes.hidden = YES;
            self.typeViewAboutImage.hidden = NO;
            self.typeViewAboutSudoku.hidden = YES;
            [self setupTypeViewAboutImageData:homeDataModel];

        }else{
            self.typeViewAboutImageAndDes.hidden = YES;
            self.typeViewAboutImage.hidden = YES;
            self.typeViewAboutSudoku.hidden = NO;
            [self setupTypeViewAboutSudokuData:homeDataModel];
        }
    }
}



#pragma mark - 设置第1种样式的cell的数据
- (void)setupTypeViewAboutImageAndDesData:(QFXEntity_List *)homeDataModel
{
    // 设置图片
    [self.backgroundImage sd_setImageWithURL:[NSURL URLWithString:homeDataModel.meow.thumb.raw]];
    
    if (homeDataModel.meow.thumb.raw.length == 0) {
        QFXHomeImages *image = homeDataModel.meow.images[0];
        [self.backgroundImage sd_setImageWithURL:[NSURL URLWithString:image.raw]];
    }
    
    // 设置类型
    self.catagyLabel.text =[NSString stringWithFormat:@"#%@",self.homeDataModel.meow.category.name];
    
    // 设置标题
    self.titleLabel.text = homeDataModel.meow.title;
    
    // 设置描述
    self.desLabel.text = homeDataModel.meow.desc;
    
    self.dataID = homeDataModel.meow.ID;
    
    [self setupCellHeight];
    
}

#pragma mark - 设置第2种样式的cell的数据
- (void)setupTypeViewAboutImageData:(QFXEntity_List *)homeDataModel
{
    
    if (self.rawArray.count != 0) {
        [self.backgroundImage2 sd_setImageWithURL:[NSURL URLWithString:self.rawArray[0]]];
    }else{
        // 设置图片
        [self.backgroundImage2 sd_setImageWithURL:[NSURL URLWithString:homeDataModel.meow.thumb.raw]];
    }
    
    // 设置类型
    self.categoryLabel2.text =[NSString stringWithFormat:@"#%@",self.homeDataModel.meow.category.name];
    
    
    NSString *titleText = homeDataModel.meow.title;
    NSString *descText = homeDataModel.meow.desc;
    if (titleText.length == 0) {
        titleText = homeDataModel.meow.user.name;
    }
    if (descText.length == 0) {
        descText = homeDataModel.meow.text;
    }
    
    // 设置标题
    self.titleLabel2.text = titleText;
    
    // 设置描述
    self.desLabel2.text = descText;
    
    self.dataID = homeDataModel.meow.ID;
    
    // 计算cell的高度
    self.height = CGRectGetMaxY(self.pingLunBtn2.frame) + 90;
}

#pragma mark - 设置第3种样式的cell的数据
- (void)setupTypeViewAboutSudokuData:(QFXEntity_List *)homeDataModel
{
    
   NSArray *imageViewArray = [self.imageViewSuperView subviews];
    
//    NSMutableArray *rawArray = [NSMutableArray array];
//    
//    for (QFXHomePicsModel *pics in homeDataModel.meow.pics) {
//        
//        [rawArray addObject:pics.raw];
//    }
    
    
    for (int i = 0; i < self.rawArray.count; i++) {
        [imageViewArray[i] sd_setImageWithURL:[NSURL URLWithString:self.rawArray[i]]];
}
    
    
    
    
    // 设置图片
//    [self.backgroundImage2 sd_setImageWithURL:[NSURL URLWithString:homeDataModel.meow.thumb.raw]];
    
    // 设置类型
    self.categoryLabel3.text =[NSString stringWithFormat:@"#%@",self.homeDataModel.meow.category.name];
    
    
    NSString *titleText = homeDataModel.meow.title;
    NSString *descText = homeDataModel.meow.desc;
    if (titleText.length == 0) {
        titleText = homeDataModel.meow.user.name;
    }
    if (descText.length == 0) {
        descText = homeDataModel.meow.text;
    }
    
    // 设置标题
    self.titleLabel3.text = titleText;
    
    // 设置描述
    self.desLabel3.text = descText;
    
    self.dataID = homeDataModel.meow.ID;
    
    // 计算cell的高度
    self.height = self.frame.size.width + 70;
    
}

#pragma mark - 视频播放按钮的点击事件
- (IBAction)videPlayBtnClick:(id)sender {

}
#pragma mark - 音乐播放按钮的点击事件
- (IBAction)musicPlayBtnClick:(id)sender {
    
}

#pragma mark - 获取其父控件所在控制器
- (UIViewController*)getSupVC {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end

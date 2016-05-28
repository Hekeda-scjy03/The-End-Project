//
//  DirectoryListCell.m
//  QuFaXian
//
//  Created by licong on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "DirectoryListCell.h"
#import "DirectoryModel.h"
#import "TypeNineModel.h"
#import <UIImageView+WebCache.h>
#import <MJRefresh.h>
@implementation DirectoryListCell

- (void)setTypeNineModel:(TypeNineModel *)typeNineModel{
    _typeNineModel = typeNineModel;

    if ([_directoryModel.meowtype integerValue] == 9) {
        [self.image sd_setImageWithURL:[NSURL URLWithString:typeNineModel.leftImgFromArray]];
    }
}

-(void)setDirectoryModel:(DirectoryModel *)directoryModel{

    _directoryModel = directoryModel;
    
    if ([directoryModel.meowtype integerValue] != 9) {
        [self.image sd_setImageWithURL:[NSURL URLWithString:directoryModel.leftImg]];
    }
    
    
    self.title.text = directoryModel.title;
    
    if ([directoryModel.meowtype integerValue]== 4) {
        if ([directoryModel.introduce isEqualToString:@""]) {
            self.subTitle.text = directoryModel.title;
        }else{
            self.subTitle.text = directoryModel.introduce;
        }
    }else if ([directoryModel.meowtype integerValue]== 7 || [directoryModel.meowtype integerValue]== 8 || [directoryModel.meowtype integerValue]== 9){
        if ([directoryModel.des isEqualToString:@""]) {
            self.subTitle.text = directoryModel.title;
        }else{
            self.subTitle.text = directoryModel.des;
        }
    }
    
    
    self.authorName.text = directoryModel.author;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

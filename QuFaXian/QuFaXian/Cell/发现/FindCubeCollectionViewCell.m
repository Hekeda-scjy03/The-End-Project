//
//  FindCubeCollectionViewCell.m
//  QuFaXian
//
//  Created by licong on 16/5/11.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "FindCubeCollectionViewCell.h"
#import "CubeModel.h"
#import <UIImageView+WebCache.h>
@interface FindCubeCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *cubeType;

@property (weak, nonatomic) IBOutlet UIImageView *cubeImg;

@property (weak, nonatomic) IBOutlet UILabel *cubeTitle;

@property (weak, nonatomic) IBOutlet UILabel *cubeIntroduce;

@end

@implementation FindCubeCollectionViewCell

- (void)setCubeModel:(CubeModel *)cubeModel{
    _cubeModel = cubeModel;
    self.cubeType.text = cubeModel.category;
    [self.cubeImg sd_setImageWithURL:[NSURL URLWithString:cubeModel.cubeImage]];
    
    self.cubeTitle.text = cubeModel.name;
    self.cubeIntroduce.text = cubeModel.des;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end

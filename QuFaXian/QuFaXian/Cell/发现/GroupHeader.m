//
//  GroupHeader.m
//  QuFaXian
//
//  Created by licong on 16/5/15.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "GroupHeader.h"
#import <UIImageView+WebCache.h>
#import "CubeModel.h"
#import "CubeDetailModel.h"
@implementation GroupHeader

- (void)setCubeModel:(CubeModel *)cubeModel{
    _cubeModel = cubeModel;
    
    [self.backImage sd_setImageWithURL:[NSURL URLWithString:cubeModel.topBackImg]];
    
    self.groupName.text = cubeModel.name;
    
    self.groupMemberNum.text = [NSString stringWithFormat:@"%@人已加入",cubeModel.memberNum];
    
    self.groupIntroduction.text = cubeModel.des;
    
    
}

- (void)setImageDictArray:(NSArray *)imageDictArray{
    _imageDictArray = imageDictArray;
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in _imageDictArray) {
        NSString *url = [dic objectForKey:@"avatar_url"];
        [tempArray addObject:url];
    }
    
    [self.headF sd_setImageWithURL:[NSURL URLWithString:tempArray[0]]];
    [self.headS sd_setImageWithURL:[NSURL URLWithString:tempArray[1]]];
    [self.headT sd_setImageWithURL:[NSURL URLWithString:tempArray[2]]];
    [self.headFour sd_setImageWithURL:[NSURL URLWithString:tempArray[3]]];
    [self.headFif sd_setImageWithURL:[NSURL URLWithString:tempArray[4]]];

}


- (void)awakeFromNib{
    [super awakeFromNib];
    self.headF.layer.cornerRadius = 15.f;
    self.headS.layer.cornerRadius = 15.f;
    self.headT.layer.cornerRadius = 15.f;
    self.headFour.layer.cornerRadius = 15.f;
    self.headFif.layer.cornerRadius = 15.f;
    
}



@end

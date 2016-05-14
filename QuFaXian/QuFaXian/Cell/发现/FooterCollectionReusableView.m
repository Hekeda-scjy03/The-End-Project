//
//  CollectionReusableView.m
//  QuFaXian
//
//  Created by licong on 16/5/11.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "FooterCollectionReusableView.h"

@interface FooterCollectionReusableView ()


@property (weak, nonatomic) IBOutlet UIImageView *footerHeadImg;

@property (weak, nonatomic) IBOutlet UILabel *footerName;

@property (weak, nonatomic) IBOutlet UIImageView *footerBackImage;

@property (weak, nonatomic) IBOutlet UILabel *footerIntroduce;


@end

@implementation FooterCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end

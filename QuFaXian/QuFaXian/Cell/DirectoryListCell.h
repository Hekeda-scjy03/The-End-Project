//
//  DirectoryListCell.h
//  QuFaXian
//
//  Created by licong on 16/5/18.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DirectoryModel;
@class TypeNineModel;
@interface DirectoryListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *subTitle;

@property (weak, nonatomic) IBOutlet UILabel *authorName;

@property (nonatomic, strong) DirectoryModel *directoryModel;

@property (nonatomic, strong) TypeNineModel *typeNineModel;

@end

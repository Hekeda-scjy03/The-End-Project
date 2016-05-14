//
//  QFXCustomViewController.h
//  QuFaXian
//
//  Created by licong on 16/5/5.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

//左右两边的barbuttonitem样式
typedef NS_OPTIONS(NSUInteger, ViewControllerItemType){
    VCItemTypeSearch =1,
    VCItemTypeLeftAdd = VCItemTypeSearch <<1, //加号
    VCItemTypeShare = VCItemTypeSearch <<2,
    VCItemTypeMore = VCItemTypeSearch <<3,
};

//navigation的title
typedef enum navTitle{
    TitleRecommendValue,
    TitleFindValue,
    TitleDynamicValue,
}NavTitle;

@interface QFXCustomViewController : UIViewController

//初始化navigationbar
- (instancetype)initVCwithItemType:(ViewControllerItemType)itemType withNavTitle:(NavTitle)navTitle;

//定义枚举属性
@property (nonatomic, assign) ViewControllerItemType itemType;

@property (nonatomic, assign) NavTitle navTtle;

@end

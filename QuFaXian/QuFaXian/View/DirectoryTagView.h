//
//  DirectoryTagView.h
//  QuFaXian
//
//  Created by licong on 16/5/28.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DirectoryTagView : UIView

@property (weak, nonatomic) IBOutlet UIButton *tagBtn;

- (void)addTarget:(id)target action:(SEL)action withTitle:(NSString *)title;

@end

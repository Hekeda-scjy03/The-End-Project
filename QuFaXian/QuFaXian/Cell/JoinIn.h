//
//  JoinIn.h
//  QuFaXian
//
//  Created by licong on 16/5/17.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JoinIn : UIView

@property (weak, nonatomic) IBOutlet UIButton *joinBtn;

- (void)addTarget:(id)target action:(SEL)action;

- (void) setTitle:(NSString *)title;

@end

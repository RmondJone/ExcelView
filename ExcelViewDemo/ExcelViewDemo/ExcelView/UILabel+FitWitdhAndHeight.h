//
//  UILabel+FitWitdhAndHeight.h
//  ExcelViewDemo
//
//  Created by 郭翰林 on 2017/2/15.
//  Copyright © 2017年 郭翰林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (FitWitdhAndHeight)
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;
@end

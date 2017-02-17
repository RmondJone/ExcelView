//
//  UILabel+FitWitdhAndHeight.m
//  ExcelViewDemo
//
//  Created by 郭翰林 on 2017/2/15.
//  Copyright © 2017年 郭翰林. All rights reserved.
//

#import "UILabel+FitWitdhAndHeight.h"

@implementation UILabel (FitWitdhAndHeight)
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}
@end

//
//  ExcelLockSection.h
//  ExcelViewDemo
//
//  Created by 郭翰林 on 2017/4/4.
//  Copyright © 2017年 郭翰林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExcelLockSection : UIView
@property (retain, nonatomic) IBOutlet UIView *lockView;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lockViewWidthConstraint;
@end

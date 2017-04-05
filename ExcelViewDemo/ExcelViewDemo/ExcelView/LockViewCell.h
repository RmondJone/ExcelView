//
//  LockViewCell.h
//  ExcelViewDemo
//
//  Created by 郭翰林 on 2017/4/4.
//  Copyright © 2017年 郭翰林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LockViewCell : UITableViewCell
@property(nonatomic,retain) NSMutableArray *mRowMaxHeights;//记录每行最大高度，自适应高度
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

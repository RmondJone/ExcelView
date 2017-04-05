//
//  ScrollViewCell.h
//  ExcelViewDemo
//
//  Created by 郭翰林 on 2017/4/4.
//  Copyright © 2017年 郭翰林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewCell : UITableViewCell
@property(nonatomic,retain) NSMutableArray *mXTableDatas;//横向单行数据列表
@property(nonatomic,retain) NSMutableArray *mColumeMaxWidths;//记录每列最大的宽度，自适应宽度
@property(nonatomic,retain) NSMutableArray *mRowMaxHeights;//记录每行最大高度，自适应高度
@end

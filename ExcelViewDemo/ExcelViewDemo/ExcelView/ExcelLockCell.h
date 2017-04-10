//
//  ExcelLockCell.h
//  ExcelViewDemo
//
//  Created by 郭翰林 on 2017/4/4.
//  Copyright © 2017年 郭翰林. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NSMutableArray *(^XTableDatas) ();
typedef NSMutableArray *(^YTableDatas) ();
typedef NSMutableArray *(^ColumeMaxWidths) ();
typedef NSMutableArray *(^FristRowDatas) ();
typedef NSMutableArray *(^RowMaxHeights) ();
typedef BOOL (^IsLockFristRow) ();
typedef UIColor *(^FristRowBackGround) ();
typedef UIFont *(^LockTextFont) ();
typedef UIScrollView *(^HeadScrollViewBolck)();
/**
 滚动视图滑动到最左侧的Block
 */
typedef void (^ScrollViewToLeftBlock)(CGPoint contentOffset);
/**
 滚动视图滑动到最右侧的Block
 */
typedef void(^ScrollViewToRightBlock)(CGPoint contentOffset);
@interface ExcelLockCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *lockViewTableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (retain, nonatomic) UITableView *scrollViewTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fristColumnWidth;

/**
 滚动视图滑动到最左侧的Block
 */
@property(nonatomic,copy) ScrollViewToLeftBlock mLeftblock;
/**
 滚动视图滑动到最右侧的Block
 */
@property(nonatomic,copy) ScrollViewToRightBlock mRightblock;


-(void) setXTableDatas:(XTableDatas) xTableDatas;
-(void) setYTableDatas:(YTableDatas) yTableDatas;
-(void) setColumeMaxWidths:(ColumeMaxWidths) mColumeMaxWidths;
-(void) setFristRowDatas:(FristRowDatas) mFristRowDatas;
-(void) setRowMaxHeights:(RowMaxHeights) mRowMaxHeights;
-(void) setIsLockFristRowBolck:(IsLockFristRow) isLockFristRow;
-(void) setFristRowBackGroundBolck:(FristRowBackGround) mFristRowBackGround;
-(void) setLockTextFontBolck:(LockTextFont) mTextFont;
-(void) setHeadScrollView:(HeadScrollViewBolck) mHeadScrollView;
-(void) initView;
-(void)initViewWithScrollViewLeftBolck:(ScrollViewToLeftBlock) leftblock AndScrollViewRightBolck:(ScrollViewToRightBlock) rightblock;
@end

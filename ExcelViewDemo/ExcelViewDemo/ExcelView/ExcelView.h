//
//  ExcelView.h
//  xjbmmcIos
//
//  Created by 郭翰林 on 2017/2/8.
//
//

#import <UIKit/UIKit.h>
#import "UILabel+FitWitdhAndHeight.h"
/**
 滚动视图滑动到最左侧的Block
 */
typedef void (^ScrollViewToLeftBlock)(CGPoint contentOffset);
/**
  滚动视图滑动到最右侧的Block
 */
typedef void(^ScrollViewToRightBlock)(CGPoint contentOffset);

@interface ExcelView : UIView<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
/**
 表格主视图
 */
@property(nonatomic,retain) UITableView *mTableView;
/**
 是否锁定第一列
 */
@property BOOL isLockFristColumn;
/**
 是否锁定第一行
 */
@property BOOL isLockFristRow;
/**
 是否存在第一列列标题
 */
@property BOOL isColumnTitlte;
/**
 列标题名称（表格左上角数据）
 */
@property(nonatomic,copy) NSString *columnTitlte;
/**
 第一行表头数据（不包括表格左上角数据，只接收字符串）
 */
@property(nonatomic,retain) NSMutableArray *topTableHeadDatas;
/**
 第一列表头数据（不包括表格左上角数据，只接收字符串）

 */
@property(nonatomic,retain) NSMutableArray *leftTabHeadDatas;
/**
 表格数据（2维数组，不包括第一列和第一行数据，只接收字符串，例：@[@[],@[],....]）
 */
@property(nonatomic,retain) NSMutableArray *tableDatas;

/**
 表格数据（2维数组，每一行为一个子单元，只接受字符串，例：@[@[],@[],....]
 设置该属性之后，columnTitlte、topTableHeadDatas、leftTabHeadDatas、tableDatas将被重置。
 */
@property(nonatomic,retain) NSMutableArray *allTableDatas;

/**
 设置字体
 */
@property(nonatomic,retain) UIFont *textFont;

/**
 第一行背景颜色
 */
@property(nonatomic,retain) UIColor *fristRowBackGround;
/**
 列最大宽度
 */
@property(nonatomic) CGFloat columnMaxWidth;
/**
 列最小宽度
 */
@property(nonatomic) CGFloat columnMinWidth;
/**
 显示，必须调用该方法或者调用showWith:方法，视图才会展现
 */
-(void)show;
/**
 滚动视图滑动到最左侧的Block
 */
@property(nonatomic,copy) ScrollViewToLeftBlock mLeftblock;
/**
 滚动视图滑动到最右侧的Block
 */
@property(nonatomic,copy) ScrollViewToRightBlock mRightblock;
/**
 显示，并加入滚动视图监听回调

 @param leftblock 滚动视图滑动到最左侧的Block
 @param rightblock 滚动视图滑动到最右侧的Block
 */
-(void)showWithLeftBlock:(ScrollViewToLeftBlock)leftblock AndWithRigthBlock:(ScrollViewToRightBlock) rightblock;
@end

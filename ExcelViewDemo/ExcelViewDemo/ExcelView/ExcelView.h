//
//  ExcelView.h
//  xjbmmcIos
//
//  Created by 郭翰林 on 2017/2/8.
//
//

#import <UIKit/UIKit.h>
#import "UILabel+FitWitdhAndHeight.h"
@interface ExcelView : UIView<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
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
 显示，必须调用该方法，视图才会展现
 */
-(void)show;
@end

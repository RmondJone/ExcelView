# ExcelView
IOS表格自定义视图，支持XIB布局，支持代码布局，支持锁双向表头。<br>

## 效果展示

![image](https://github.com/RmondJone/ExcelView/blob/master/show.gif)

## 更新日志

* 更新时间2017年02月11日09:48:27  -----ExcelView V1.0.0

* 更新时间2017年02月17日11:17:14  -----ExcelView V1.0.1  

  添加表格宽度自适应,添加自定义第一行背景色属性和设置表格字体属性

* 更新时间2017年02月27日15:58:07  -----ExcelView V1.0.2   

  添加表格高度自适应,添加设置单元格最大列宽

* 更新时间2017年02月28日20:23:50  -----ExcelView V1.0.3   

  添加表格数据添加形式，原有数据添加形式保留，以每行数据为基本单元构造二维数组

* 更新时间2017年03月17日15:22:02  -----ExcelView V1.0.4   

  部分BUG修改，新增最小列宽属性

* 更新时间2017年03月18日12:17:40  -----ExcelView V1.0.5   

  新增滚动视图监听Block，滑动到最左侧或者最右侧自定义处理事件，防止有部分滚动视图嵌套表格的需求

* 更新时间2017年04月05日11:20:31  -----ExcelView V1.0.6   

  版本重大BUG修改,数据过多时会引起异常奔溃

  滚动时滚动视图数组不断增大从而引起遍历时间过长滚动缓慢问题（已重新设计方案）

  列表先左移再上移会错行问题。

* 更新时间2017年04月05日15:51:24  -----ExcelView V1.0.7   

  表格BUG修改,Cell复用问题导致的表格刷新,表头和表内容视图错列问题。

  Cell值初始化未清空导致的表格刷新滚动视图contentSize不对的问题。

* 更新时间2017年04月10日18:01:46  -----ExcelView V1.0.8  

  表格BUG修改，Iphone6 Plus手机表格内容视图没有适配的BUG修改

## API使用说明

```objective-c
    self.leftTableDataArray=(NSMutableArray *)@[@"塔城",@"哈密",@"和田",@"阿勒泰",@"克州"];
    self.rightTableHeadArray=(NSMutableArray *)@[@"当日收入（万）",@"同比",@"环比",@"当月收入（万）",@"同比",@"环比",@"当年收入（万）",@"同比",@"环比"];
    self.excelDataArray=(NSMutableArray *)@[@[@"2.9",@"2%",@"3%",@"3.0",@"4%",@"5%",@"18",@"4.5%",@"6.8%"],@[@"2.9",@"2%",@"3%",@"3.0",@"4%",@"5%",@"18",@"4.5%",@"6.8%"],@[@"2.9",@"2%",@"3%",@"3.0",@"4%",@"5%",@"18",@"4.5%",@"6.8%"],@[@"2.9",@"2%",@"3%",@"3.0",@"4%",@"5%",@"18",@"4.5%",@"6.8%"],@[@"2.9",@"2%",@"3%",@"3.0",@"4%",@"5%",@"18",@"4.5%",@"6.8%"]];

    self.allTableDataArray=[NSMutableArray arrayWithCapacity:10];
    NSMutableArray *fristDatas=[NSMutableArray arrayWithCapacity:10];
    [fristDatas addObject:@"标题"];
    for (int i=0; i<22; i++) {
       [fristDatas addObject:[NSString stringWithFormat:@"标题%d",i]];
    }
    [self.allTableDataArray addObject:fristDatas];
    for (int i=0; i<99; i++) {
       NSMutableArray *rowDatas=[NSMutableArray arrayWithCapacity:10];
       [rowDatas addObject:[NSString stringWithFormat:@"标题%d",i]];
       for (int j=0; j<22;j++) {
           [rowDatas addObject:[NSString stringWithFormat:@"数据%d",j]];
       }
       [self.allTableDataArray addObject:rowDatas];
    }

    //代码方式添加
    ExcelView *excelView=[[ExcelView alloc]initWithFrame:CGRectMake(0, 280, UIScreenWidth, 270)];
    excelView.topTableHeadDatas=self.rightTableHeadArray;
    excelView.leftTabHeadDatas=self.leftTableDataArray;
    excelView.tableDatas=self.excelDataArray;
    excelView.isLockFristColumn=YES;
    excelView.isLockFristRow=YES;
    excelView.isColumnTitlte=YES;
    excelView.columnTitlte=@"地区";
    [excelView show];
    [self.view addSubview:excelView];


    //xib布局添加方式
    self.mExcelView.allTableDatas=self.allTableDataArray;
    self.mExcelView.isLockFristColumn=YES;
    self.mExcelView.isLockFristRow=YES;
    self.mExcelView.isColumnTitlte=YES;
    self.mExcelView.columnTitlte=@"地区";
    self.mExcelView.columnMaxWidth=200;
    self.mExcelView.columnMinWidth=100;
    [self.mExcelView showWithLeftBlock:^(CGPoint contentOffset) {
        NSLog(@"滚动到了最左侧！");
        NSLog(@"偏移量：%f",contentOffset.x);
    } AndWithRigthBlock:^(CGPoint contentOffset) {
        NSLog(@"滚动到了最右侧！");
        NSLog(@"偏移量：%f",contentOffset.x);
    }];


```
## 目前支持可自定义属性

```objective-c
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
 显示，必须调用该方法，视图才会展现
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


```
## 使用说明
* 直接复制项目根目录里ExcelView文件夹到你的项目中
* 在需要用的地方引入 #import "ExcelView.h" 头文件，或者直接在PCH文件中引入

## 问题反馈
* 联系方式：QQ(2318560278）
* 技术交流群：QQ(264587303)
* Demo作者：郭翰林

//
//  ViewController.m
//  ExcelViewDemo
//
//  Created by 郭翰林 on 2017/2/10.
//  Copyright © 2017年 郭翰林. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,retain) NSMutableArray *leftTableDataArray;//表格第一列数据
@property(nonatomic,retain) NSMutableArray *excelDataArray;//表格数据
@property(nonatomic,retain) NSMutableArray *rightTableHeadArray;//表格第一行表头数据
@property(nonatomic,retain) NSMutableArray *allTableDataArray;//表格所有数据
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftTableDataArray=(NSMutableArray *)@[@"塔城",@"哈密",@"和田",@"阿勒泰",@"克州"];
    self.rightTableHeadArray=(NSMutableArray *)@[@"当日收入（万）",@"同比",@"环比",@"当月收入（万）",@"同比",@"环比",@"当年收入（万）",@"同比",@"环比"];
    self.excelDataArray=(NSMutableArray *)@[@[@"2.91111111111111111",@"2%",@"3%",@"3.0",@"4%",@"5%",@"18",@"4.5%",@"6.8%"],@[@"2.9",@"2%",@"3%",@"3.0",@"4%",@"5%",@"18",@"4.5%",@"6.8%"],@[@"2.9",@"2%",@"3%",@"3.0",@"4%",@"5%",@"18",@"4.5%",@"6.8%"],@[@"2.9",@"2%",@"3%",@"3.0",@"4%11111111111111111111",@"5%",@"18",@"4.5%",@"6.8%"],@[@"2.9",@"2%",@"3%",@"3.0",@"4%",@"5%",@"18",@"4.5%",@"6.8%"]];
    
    
    self.allTableDataArray=(NSMutableArray *)@[@[@"地区",@"当日收入（万）",@"同比",@"环比",@"当月收入（万）",@"同比",@"环比",@"当年收入（万）",@"同比",@"环比"],@[@"塔城",@"2.91111111111111111",@"2%",@"3%",@"3.0",@"4%",@"5%",@"18",@"4.5%",@"6.8%"],@[@"哈密",@"2.9",@"2%",@"3%",@"3.0",@"4%",@"5%",@"18",@"4.5%",@"6.8%"],@[@"和田",@"2.9",@"2%",@"3%",@"3.0",@"4%",@"5%",@"18",@"4.5%",@"6.8%"],@[@"阿勒泰",@"2.9",@"2%",@"3%",@"3.0",@"4%11111111111111111111",@"5%",@"18",@"4.5%",@"6.8%"],@[@"克州",@"2.9",@"2%",@"3%",@"3.0",@"4%",@"5%",@"18",@"4.5%",@"6.8%"]];
    
    //代码方式添加
    ExcelView *excelView=[[ExcelView alloc]initWithFrame:CGRectMake(0, 280, UIScreenWidth, 270)];
    excelView.topTableHeadDatas=self.rightTableHeadArray;
    excelView.leftTabHeadDatas=self.leftTableDataArray;
    excelView.tableDatas=self.excelDataArray;
    excelView.isLockFristColumn=NO;
    excelView.isLockFristRow=NO;
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
    [self.mExcelView show];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ExcelLockCell.m
//  ExcelViewDemo
//
//  Created by 郭翰林 on 2017/4/4.
//  Copyright © 2017年 郭翰林. All rights reserved.
//

#import "ExcelLockCell.h"
#import "LockViewCell.h"
#import "ScrollViewCell.h"
#include <math.h>
@interface ExcelLockCell()
@property(nonatomic,retain) NSMutableArray *mXTableDatas;//横向单行数据列表
@property(nonatomic,retain) NSMutableArray *mYTableDatas;//如果锁定第一列则设置第一列数据集合
@property(nonatomic,retain) NSMutableArray *mFristRowDatas;//第一行数据
@property(nonatomic,retain) NSMutableArray *mColumeMaxWidths;//记录每列最大的宽度，自适应宽度
@property(nonatomic,retain) NSMutableArray *mRowMaxHeights;//记录每行最大高度，自适应高度
@property BOOL isLockFristRow;//是否锁第一行
@property(nonatomic,retain) UIColor *fristRowBackGround;// 第一行背景颜色
@property(nonatomic,retain) UIFont *textFont;
@property CGFloat mScrollViewContentWidth;//滚动视图内容宽度
@property CGFloat mScrollViewContentHeight;//滚动视图内容高度
@property UIScrollView *mHeadScrollView;//父视图头部滚动视图
@property(nonatomic,retain) NSMutableArray *mScollViews;
@end

@implementation ExcelLockCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

#pragma mark 初始化
-(void)initViewWithScrollViewLeftBolck:(ScrollViewToLeftBlock)leftblock AndScrollViewRightBolck:(ScrollViewToRightBlock)rightblock{
    self.mLeftblock=leftblock;
    self.mRightblock=rightblock;
    [self initView];
}
/**
 初始化视图
 */
-(void) initView{
    [self initData];
    //重设视图
    self.fristColumnWidth.constant=[self.mColumeMaxWidths[0] floatValue];
    self.scrollViewTableView=[[UITableView alloc]init];
    self.scrollViewTableView.frame=CGRectMake(0, 0, _mScrollViewContentWidth, _mScrollViewContentHeight);
    self.scrollView.contentSize=CGSizeMake(self.mScrollViewContentWidth, self.mScrollViewContentHeight);
    self.scrollView.bounces=NO;
    self.scrollView.delegate=self;
    [self.scrollView addSubview:self.self.scrollViewTableView];
    [self.mScollViews addObject:self.scrollView];
    //初始化tableView
    self.lockViewTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.lockViewTableView registerNib:[UINib nibWithNibName:@"LockViewCell" bundle:nil] forCellReuseIdentifier:@"LockViewCell"];
    self.lockViewTableView.scrollEnabled=NO;
    self.lockViewTableView.delegate=self;
    self.lockViewTableView.dataSource=self;
    self.scrollViewTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.scrollViewTableView registerNib:[UINib nibWithNibName:@"ScrollViewCell" bundle:nil] forCellReuseIdentifier:@"ScrollViewCell"];
    self.scrollViewTableView.scrollEnabled=NO;
    self.scrollViewTableView.delegate=self;
    self.scrollViewTableView.dataSource=self;
}
/**
 初始化数据
 */
-(void)initData{
    if(self.mScollViews!=nil){
        [self.mScollViews removeAllObjects];
    }else{
        self.mScollViews=[NSMutableArray arrayWithCapacity:10];
    }
    if (self.isLockFristRow) {
        [self.mRowMaxHeights removeObjectAtIndex:0];
        [self.mYTableDatas removeObjectAtIndex:0];
    }
    self.mScrollViewContentWidth=0;
    self.mScrollViewContentHeight=0;
    for (int i=0; i<self.mRowMaxHeights.count; i++) {
        self.mScrollViewContentHeight+=[self.mRowMaxHeights[i] floatValue];
    }
    for (int i=1; i<self.mColumeMaxWidths.count; i++) {
        self.mScrollViewContentWidth+=[self.mColumeMaxWidths[i] floatValue];
    }
    //    NSLog(@"mRowMaxHeights:%@",self.mRowMaxHeights);
    //    NSLog(@"mYTableDatas:%@",self.mYTableDatas);
    //    NSLog(@"mXTableDatas%@",self.mXTableDatas);
//        NSLog(@"mScrollViewContentWidth:%f",self.mScrollViewContentWidth);
//        NSLog(@"mScrollViewContentHeight:%f",self.mScrollViewContentHeight);
    
}

#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.lockViewTableView) {
        LockViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"LockViewCell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        if (!cell) {
            cell=[[[NSBundle mainBundle]loadNibNamed:@"LockViewCell" owner:nil options:nil]lastObject];
        }
        cell.label.text=self.mYTableDatas[indexPath.row];
        cell.label.numberOfLines=0;
        cell.label.font=self.textFont;
        cell.label.textAlignment=NSTextAlignmentCenter;
        if (!self.isLockFristRow && indexPath.row==0) {
            cell.label.textColor=RGB(94, 153, 251);
            cell.layer.borderWidth=0.6;
            cell.layer.borderColor=[UIColor whiteColor].CGColor;
            cell.contentView.layer.backgroundColor=self.fristRowBackGround.CGColor;
        }else{
            cell.label.textColor=RGB(84, 84, 84);
            cell.layer.borderWidth=0.6;
            cell.layer.borderColor=[UIColor groupTableViewBackgroundColor].CGColor;
        }
        return cell;
    }else if(tableView==self.scrollViewTableView){
        ScrollViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ScrollViewCell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        if (!cell) {
            cell=[[[NSBundle mainBundle]loadNibNamed:@"ScrollViewCell" owner:nil options:nil]lastObject];
        }
        NSMutableArray *rowDatas=[NSMutableArray arrayWithCapacity:10];
        if (!self.isLockFristRow) {
            if (indexPath.row==0) {
                rowDatas=self.mFristRowDatas;
            }else{
                rowDatas=self.mXTableDatas[indexPath.row-1];
            }
        }else{
            rowDatas=self.mXTableDatas[indexPath.row];
        }
        //添加视图
        int x=0;
        if (!self.isLockFristRow && indexPath.row==0) {
            for (int i=0; i<rowDatas.count; i++) {
                UIView *view=[[UIView alloc]initWithFrame:CGRectMake(x, 0, [self.mColumeMaxWidths[i+1] floatValue], [self.mRowMaxHeights[indexPath.row] floatValue])];
                UILabel *dataView=[[UILabel alloc]initWithFrame:view.bounds];
                dataView.text=rowDatas[i];
                dataView.textColor=RGB(94, 153, 251);
                dataView.textAlignment=NSTextAlignmentCenter;
                dataView.numberOfLines=0;
                dataView.font=self.textFont;
                [view addSubview:dataView];
                view.layer.borderWidth=0.6;
                view.layer.borderColor=[UIColor whiteColor].CGColor;
                view.layer.backgroundColor=self.fristRowBackGround.CGColor;
                [cell addSubview:view];
                x+=view.frame.size.width;
            }
        }else{
            for (int i=0; i<rowDatas.count; i++) {
                UIView *view=[[UIView alloc]initWithFrame:CGRectMake(x, 0, [self.mColumeMaxWidths[i+1] floatValue], [self.mRowMaxHeights[indexPath.row] floatValue])];
                UILabel *dataView=[[UILabel alloc]initWithFrame:view.bounds];
                dataView.text=rowDatas[i];
                dataView.textColor=RGB(84, 84, 84);
                dataView.textAlignment=NSTextAlignmentCenter;
                dataView.numberOfLines=0;
                dataView.font=self.textFont;
                [view addSubview:dataView];
                view.layer.borderWidth=0.6;
                view.layer.borderColor=[UIColor groupTableViewBackgroundColor].CGColor;
                [cell addSubview:view];
                x+=view.frame.size.width;
            }
            
        }
        return cell;
    }
    return nil;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mRowMaxHeights.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.mRowMaxHeights[indexPath.row] floatValue];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark 滚动视图回调监听
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    for (UIScrollView *view in self.mScollViews) {
        view.contentOffset=scrollView.contentOffset;
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView==self.scrollView) {
        if(scrollView.contentOffset.x==0){
//            NSLog(@"滑动到最左侧！");
            if (self.mLeftblock!=nil) {
                self.mLeftblock(scrollView.contentOffset);
            }
        }
        CGFloat scrollViewWidth=scrollView.contentSize.width;
        CGFloat scrollViewOffestX=scrollView.contentOffset.x;
        if (floor(scrollViewWidth-scrollViewOffestX)==floor(self.frame.size.width-[self.mColumeMaxWidths[0] floatValue])) {
//            NSLog(@"滑动到最右侧！");
            if (self.mRightblock!=nil) {
                self.mRightblock(scrollView.contentOffset);
            }
        }
    }
}

#pragma mark 属性初始化
-(void) setXTableDatas:(XTableDatas) xTableDatas{
    if (self.mXTableDatas!=nil) {
        [self.mXTableDatas removeAllObjects];
    }else{
        self.mXTableDatas =[NSMutableArray arrayWithCapacity:10];
    }
    [self.mXTableDatas addObjectsFromArray:xTableDatas()];
}
-(void)setYTableDatas:(YTableDatas)yTableDatas{
    if (self.mYTableDatas!=nil) {
        [self.mYTableDatas removeAllObjects];
    }else{
        self.mYTableDatas =[NSMutableArray arrayWithCapacity:10];
    }
    [self.mYTableDatas addObjectsFromArray:yTableDatas()];
}
-(void)setColumeMaxWidths:(ColumeMaxWidths)mColumeMaxWidths{
    if (self.mColumeMaxWidths!=nil) {
        [self.mColumeMaxWidths removeAllObjects];
    }else{
        self.mColumeMaxWidths =[NSMutableArray arrayWithCapacity:10];
    }
    [self.mColumeMaxWidths addObjectsFromArray:mColumeMaxWidths()];
}
-(void)setRowMaxHeights:(RowMaxHeights)mRowMaxHeights{
    if (self.mRowMaxHeights!=nil) {
        [self.mRowMaxHeights removeAllObjects];
    }else{
        self.mRowMaxHeights =[NSMutableArray arrayWithCapacity:10];
    }
    [self.mRowMaxHeights addObjectsFromArray:mRowMaxHeights()];
}
-(void)setFristRowDatas:(FristRowDatas)mFristRowDatas{
    if (self.mFristRowDatas!=nil) {
        [self.mFristRowDatas removeAllObjects];
    }else{
        self.mFristRowDatas =[NSMutableArray arrayWithCapacity:10];
    }
    [self.mFristRowDatas addObjectsFromArray:mFristRowDatas()];
}
-(void)setIsLockFristRowBolck:(IsLockFristRow)isLockFristRow{
    self.isLockFristRow=isLockFristRow();
}
-(void)setFristRowBackGroundBolck:(FristRowBackGround)mFristRowBackGround{
    self.fristRowBackGround=mFristRowBackGround();
}
-(void)setLockTextFontBolck:(LockTextFont)mTextFont{
    self.textFont=mTextFont();
}
-(void)setHeadScrollView:(HeadScrollViewBolck)mHeadScrollView{
    self.mHeadScrollView=mHeadScrollView();
    if (self.mScollViews!=nil) {
        [self.mScollViews addObject:self.mHeadScrollView];
    }
}

@end

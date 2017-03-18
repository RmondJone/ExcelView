//
//  ExcelLockCell.h
//  xjbmmcIos
//
//  Created by 郭翰林 on 2017/2/9.
//
//

#import <UIKit/UIKit.h>
#define RGB(a, b, c) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:1.0f]
#define RGBA(a, b, c, d) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:d]
@interface ExcelLockCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIView *lockView;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lockViewWidthConstraint;

@end

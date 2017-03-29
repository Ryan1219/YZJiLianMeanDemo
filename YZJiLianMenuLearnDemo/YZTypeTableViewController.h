//
//  YZTypeTableViewController.h
//  YZJiLianMenuLearnDemo
//
//  Created by zhangliangwang on 16/2/7.
//  Copyright © 2016年 zhangliangwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZTypeTableViewController;

/**  <#注释#> **/
@protocol YZTypeTableViewControllerDelegate <NSObject>

@optional
- (void)typeTableViewController:(YZTypeTableViewController *)typeTableViewController didSelectSubtype:(NSArray *)subType;

@end

@interface YZTypeTableViewController : UITableViewController

/**  <#注释#> **/
@property (nonatomic,weak) id<YZTypeTableViewControllerDelegate>delegate;

@end

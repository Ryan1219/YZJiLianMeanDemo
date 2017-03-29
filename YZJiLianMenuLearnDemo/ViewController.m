//
//  ViewController.m
//  YZJiLianMenuLearnDemo
//
//  Created by zhangliangwang on 16/2/7.
//  Copyright © 2016年 zhangliangwang. All rights reserved.
//

#import "ViewController.h"
#import "YZTypeTableViewController.h"
#import "YZSubTypeTableViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];


    CGFloat aWidth = self.view.frame.size.width;
    CGFloat aHeight = self.view.frame.size.height;
    
    
    YZSubTypeTableViewController *subtypeCtrl = [[YZSubTypeTableViewController alloc] init];
    subtypeCtrl.view.frame = CGRectMake(aWidth/2, 0, aWidth/2, aHeight);
    [self addChildViewController:subtypeCtrl];
    [self.view addSubview:subtypeCtrl.view];

    
    YZTypeTableViewController *typeCtrl = [[YZTypeTableViewController alloc] init];
    typeCtrl.delegate = subtypeCtrl;
    typeCtrl.view.frame = CGRectMake(0, 0, aWidth/2, aHeight);
    [self addChildViewController:typeCtrl];
    [self.view addSubview:typeCtrl.view];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

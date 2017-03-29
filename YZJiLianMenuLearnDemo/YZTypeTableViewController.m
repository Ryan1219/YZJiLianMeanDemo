//
//  YZTypeTableViewController.m
//  YZJiLianMenuLearnDemo
//
//  Created by zhangliangwang on 16/2/7.
//  Copyright © 2016年 zhangliangwang. All rights reserved.
//

#import "YZTypeTableViewController.h"
#import "YZTypeModel.h"

@interface YZTypeTableViewController ()

/** <#注释#> **/
@property (nonatomic,strong) NSArray *dataList;



@end

@implementation YZTypeTableViewController

static NSString *TypeTableViewController = @"TypeTableViewController";



/**  <#注释#> **/
- (NSArray *)dataList
{
    if (!_dataList) {
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"type" ofType:@"plist"]];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            
            [tempArray addObject:[YZTypeModel typeModelWithDict:dict]];
        }
        
        _dataList = tempArray;
        
        
    }
    return _dataList;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TypeTableViewController];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TypeTableViewController];
    
    YZTypeModel *typeModel = self.dataList[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:typeModel.image];
    cell.imageView.highlightedImage = [UIImage imageNamed:typeModel.highImage];
    cell.textLabel.text = typeModel.typeName;
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.highlightedTextColor = [UIColor redColor];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if ([self.delegate respondsToSelector:@selector(typeTableViewController:didSelectSubtype:)]) {
        
        YZTypeModel *typeModel = self.dataList[indexPath.row];
        [self.delegate typeTableViewController:self didSelectSubtype:typeModel.subtype];
    }
}



@end

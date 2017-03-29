//
//  YZSecondViewController.m
//  YZJiLianMenuLearnDemo
//
//  Created by zhangliangwang on 16/2/7.
//  Copyright © 2016年 zhangliangwang. All rights reserved.
//

#import "YZSecondViewController.h"
#import "YZTypeModel.h"
#define YZSCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define YZSCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

static NSString *leftIndentifier = @"leftIndentifier";
static NSString *rightIndentifier = @"rightIndentifier";


@interface YZSecondViewController () <UITableViewDataSource,UITableViewDelegate>

/** leftTableView **/
@property (nonatomic,strong) UITableView *leftTableView;
/** rightTableView **/
@property (nonatomic,strong) UITableView *rightTableView;

/** <#注释#> **/
@property (nonatomic,strong) NSArray *dataList;



@end

@implementation YZSecondViewController

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
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    self.navigationItem.title = @"Second";
    
    
    [self createLeftTableView];
    [self createRightTableView];
    
    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
}

- (void)createLeftTableView {
    
    UITableView *left = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, YZSCREEN_WIDTH/2, YZSCREEN_HEIGHT) style:UITableViewStylePlain];
    left.dataSource = self;
    left.delegate  =self;
    [self.view addSubview:left];
    self.leftTableView = left;
    
}


- (void)createRightTableView {
    
    UITableView *right = [[UITableView alloc] initWithFrame:CGRectMake(YZSCREEN_WIDTH/2, 0, YZSCREEN_WIDTH/2, YZSCREEN_HEIGHT) style:UITableViewStylePlain];
    right.dataSource = self;
    right.delegate  =self;
    [self.view addSubview:right];
    self.rightTableView = right;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTableView) return self.dataList.count;
    
//    if (tableView == self.rightTableView) {
    
    YZTypeModel *typeModel = self.dataList[self.leftTableView.indexPathForSelectedRow.row];
    return typeModel.subtype.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.leftTableView)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:leftIndentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:leftIndentifier];
        }
        
        YZTypeModel *typeModel = self.dataList[indexPath.row];
        
        cell.imageView.image = [UIImage imageNamed:typeModel.image];
        cell.imageView.highlightedImage = [UIImage imageNamed:typeModel.highImage];
        
        cell.textLabel.text = typeModel.typeName;
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.highlightedTextColor = [UIColor redColor];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rightIndentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rightIndentifier];
        }
        
        YZTypeModel *typeModel = self.dataList[self.leftTableView.indexPathForSelectedRow.row];
        cell.textLabel.text = typeModel.subtype[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.leftTableView) {
        [self.rightTableView reloadData];
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 49;
}































@end

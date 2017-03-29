//
//  YZTypeModel.m
//  YZJiLianMenuLearnDemo
//
//  Created by zhangliangwang on 16/2/7.
//  Copyright © 2016年 zhangliangwang. All rights reserved.
//

#import "YZTypeModel.h"

@implementation YZTypeModel
+ (instancetype)typeModelWithDict:(NSDictionary *)dict {
    
    YZTypeModel *typeModel = [[self alloc] init];
    [typeModel setValuesForKeysWithDictionary:dict];
    
    return typeModel;
}

@end

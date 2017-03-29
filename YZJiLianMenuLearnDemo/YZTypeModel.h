//
//  YZTypeModel.h
//  YZJiLianMenuLearnDemo
//
//  Created by zhangliangwang on 16/2/7.
//  Copyright © 2016年 zhangliangwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZTypeModel : NSObject

/** <#注释#> **/
@property (nonatomic,copy) NSString *typeName;
/** <#注释#> **/
@property (nonatomic,copy) NSString *image;
/** <#注释#> **/
@property (nonatomic,copy) NSString *highImage;
/** <#注释#> **/
@property (nonatomic,strong) NSArray *subtype;

+ (instancetype)typeModelWithDict:(NSDictionary *)dict;

@end

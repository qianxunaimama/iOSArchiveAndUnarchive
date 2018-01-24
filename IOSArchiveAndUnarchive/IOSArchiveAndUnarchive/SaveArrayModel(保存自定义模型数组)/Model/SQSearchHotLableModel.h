//
//  SQSearchHotLableModel.h
//  IOSArchiveAndUnarchive
//
//  Created by zxj on 2018/1/24.
//  Copyright © 2018年 zxj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQSearchHotLableModel : NSObject<NSCoding>

@property (copy, nonatomic) NSString *sort;//排序号
@property (copy, nonatomic) NSString *name;//标签名称
@property (copy, nonatomic) NSString *linkUrl;//标签类型 1搜索 2活动
@property (copy, nonatomic) NSString *linkType;//跳转类型 1APP内部跳转 2网页跳转

- (instancetype)initWithDict:(NSDictionary *)dict;
@end

//
//  ZXJUserModelOne.m
//  IOSArchiveAndUnarchive
//
//  Created by zxj on 17/2/24.
//  Copyright © 2017年 zxj. All rights reserved.
//

#import "ZXJUserModelOne.h"

@implementation ZXJUserModelOne

static ZXJUserModelOne *sharedModelOne;

#pragma mark - 在ios中，所有对象的内存空间的分配最终都会调用allocwithzone方法

+ (id)allocWithZone:(struct _NSZone *)zone{
    
    static ZXJUserModelOne *tools;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        tools = [super allocWithZone:zone];
    });
    return tools;
}

+ (instancetype)sharedModelOne{
    
    return [[self alloc]init];
}

#pragma mark - init方法可选实现，如果需要在init里面做相关初始化工作的话，标准写法最好加上init方法

- (instancetype)init{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (sharedModelOne == nil) {
            sharedModelOne = [super init];
        }
    });
    return sharedModelOne;
}

@end

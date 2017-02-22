//
//  ZXJUserModel.m
//  IOSArchiveAndUnarchive
//
//  Created by zxj on 17/2/22.
//  Copyright © 2017年 zxj. All rights reserved.
//

#import "ZXJUserModel.h"

@implementation ZXJUserModel

static ZXJUserModel *instance = nil;

+ (instancetype)sharedInstance{
    
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static ZXJUserModel *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [super allocWithZone:zone];
        
    });
    return _instance;
}

- (instancetype)init{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [[self class] getTheFilePath];
        NSLog(@"path is %@",path);
        instance = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if (instance ==  nil) {
            instance = [super init];
        }
       
    });
    return instance;
}
@end

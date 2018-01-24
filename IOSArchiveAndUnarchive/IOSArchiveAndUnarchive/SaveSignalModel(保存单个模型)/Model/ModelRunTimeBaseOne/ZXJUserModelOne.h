//
//  ZXJUserModelOne.h
//  IOSArchiveAndUnarchive
//
//  Created by zxj on 17/2/24.
//  Copyright © 2017年 zxj. All rights reserved.
//

#import "ZXJRunTimeBaseModelOne.h"

@interface ZXJUserModelOne : ZXJRunTimeBaseModelOne

@property (nonatomic ,strong) NSString *name;

@property (nonatomic,assign) NSInteger age;

+ (instancetype)sharedModelOne;

@end

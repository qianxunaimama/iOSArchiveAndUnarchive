//
//  ZXJPerson.h
//  IOSArchiveAndUnarchive
//
//  Created by zxj on 17/2/21.
//  Copyright © 2017年 zxj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXJPerson : NSObject<NSCoding>

@property (nonatomic,strong) NSString *name;

@property (nonatomic,assign) NSInteger age;

@end

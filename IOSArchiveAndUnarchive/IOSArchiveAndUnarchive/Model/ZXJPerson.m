//
//  ZXJPerson.m
//  IOSArchiveAndUnarchive
//
//  Created by zxj on 17/2/21.
//  Copyright © 2017年 zxj. All rights reserved.
//

#import "ZXJPerson.h"

@implementation ZXJPerson

#pragma mark - 存档
- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    NSLog(@"调用了encodeWithCoder方法");
    
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age" ];
}

#pragma mark - 解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age  = [aDecoder decodeIntegerForKey:@"age"];
    }
    return self;
}
@end

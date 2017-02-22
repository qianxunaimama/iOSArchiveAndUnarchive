//
//  ZXJStudent.m
//  IOSArchiveAndUnarchive
//
//  Created by zxj on 17/2/21.
//  Copyright © 2017年 zxj. All rights reserved.
//

#import "ZXJStudent.h"

@interface ZXJStudent()<NSCoding>

@end

@implementation ZXJStudent

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [super encodeWithCoder:aCoder];
    
    [aCoder encodeDouble:self.weight forKey:@"weight"];
}

#pragma mark - decode
-(instancetype)initWithCoder:(NSCoder *)aDecoder{

    if (self = [super initWithCoder:aDecoder]) {
        
        self.weight = [aDecoder decodeDoubleForKey:@"weight"];
    }
    return self;
}

@end

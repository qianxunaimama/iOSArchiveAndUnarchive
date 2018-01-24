//
//  SQSearchHotLableModel.m
//  IOSArchiveAndUnarchive
//
//  Created by zxj on 2018/1/24.
//  Copyright © 2018年 zxj. All rights reserved.
//

#import "SQSearchHotLableModel.h"

@implementation SQSearchHotLableModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.sort = [dict objectForKey:@"sort"];
        self.name = [dict objectForKey:@"name"];
        self.linkUrl = [dict objectForKey:@"linkUrl"];
        self.linkType = [dict objectForKey:@"linkType"];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.sort   = [aDecoder decodeObjectForKey:@"sort"];
        self.name   = [aDecoder decodeObjectForKey:@"name"];
        self.linkUrl    = [aDecoder decodeObjectForKey:@"linkUrl"];
        self.linkType   = [aDecoder decodeObjectForKey:@"linkType"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.sort forKey:@"sort"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.linkUrl forKey:@"linkUrl"];
    [aCoder encodeObject:self.linkType forKey:@"linkType"];
}

@end

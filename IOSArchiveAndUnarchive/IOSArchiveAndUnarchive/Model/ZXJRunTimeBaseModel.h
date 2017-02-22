//
//  ZXJRunTimeBaseModel.h
//  IOSArchiveAndUnarchive
//
//  Created by zxj on 17/2/21.
//  Copyright © 2017年 zxj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXJRunTimeBaseModel : NSObject<NSCoding>

@property (nonatomic,assign) BOOL synchronize;

+ (NSString *)getTheFilePath;
    
@end

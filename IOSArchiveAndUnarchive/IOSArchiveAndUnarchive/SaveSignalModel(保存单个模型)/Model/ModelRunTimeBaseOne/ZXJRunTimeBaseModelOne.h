//
//  ZXJRunTimeBaseModelOne.h
//  IOSArchiveAndUnarchive
//
//  Created by zxj on 17/2/24.
//  Copyright © 2017年 zxj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXJRunTimeBaseModelOne : NSObject<NSCoding>

- (BOOL)saveUserInfo;

- (id)getUserInfo;

- (void)clearUserInfo;

@end


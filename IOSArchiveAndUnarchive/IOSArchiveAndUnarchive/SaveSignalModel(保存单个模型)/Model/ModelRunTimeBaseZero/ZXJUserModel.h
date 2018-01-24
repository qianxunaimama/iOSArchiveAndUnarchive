//
//  ZXJUserModel.h
//  IOSArchiveAndUnarchive
//
//  Created by zxj on 17/2/22.
//  Copyright © 2017年 zxj. All rights reserved.
//

#import "ZXJRunTimeBaseModel.h"

@interface ZXJUserModel : ZXJRunTimeBaseModel

@property (nonatomic,strong) NSString *userName;

@property (nonatomic,strong) NSNumber *userAge;

+ (instancetype)sharedInstance;

@end

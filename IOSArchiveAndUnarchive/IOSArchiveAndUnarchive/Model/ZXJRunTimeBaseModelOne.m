//
//  ZXJRunTimeBaseModelOne.m
//  IOSArchiveAndUnarchive
//
//  Created by zxj on 17/2/24.
//  Copyright © 2017年 zxj. All rights reserved.
//

#import "ZXJRunTimeBaseModelOne.h"
#import <objc/runtime.h>

@implementation ZXJRunTimeBaseModelOne

#pragma mark - 获得模型类所在的文件夹地址
+ (NSString *)getTheFilePath{

    NSString *selfClassName = NSStringFromClass([self class]);
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:selfClassName];
    return path;
}

#pragma mark - 归档
- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    unsigned int count = 0;
    
    // 获取所有成员变量
    Ivar *ivar = class_copyIvarList([self class], &count);
    
    for (int i = 0 ; i < count; i++) {
        
        Ivar ivarItem = ivar[i];
        
        const char *name  = ivar_getName(ivarItem);
        
        // 将每个成员变量名转换为NSString对象类型
        NSString *key = [NSString stringWithUTF8String:name];
        
        // 利用KVC取值
        id value = [self valueForKey:key];
        
        // 进行归档
        [aCoder encodeObject:value forKey:key];
        
        // 这两步就相当于 [encoder encodeObject:@(self.age) forKey:@"age"];
    }
    
    free(ivar);
}

#pragma mark - 解档
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        
        unsigned int count = 0;
        
        // 获取类中所有成员变量名
        Ivar *ivar = class_copyIvarList([self class], &count);
        
        for (int i = 0; i < count; i++) {
           
            Ivar ivarItem = ivar[i];
            
            const char *name = ivar_getName(ivarItem);
            
            NSString *key = [NSString stringWithUTF8String:name];
            
            // 根据变量名进行解档取值
            id value = [aDecoder decodeObjectForKey:key];
            
            // 利用KVC对属性赋值
            [self setValue:value forKey:key];
            
            // 这两步就相当于以前的 self.age = [decoder decodeObjectForKey:@"age"];
            
        }
        free(ivar);
    }
    return self;
}

- (BOOL)saveUserInfo{
    
    NSString *path = [[self class] getTheFilePath];
    
    NSLog(@"path is %@",path);
   
    return [NSKeyedArchiver archiveRootObject:self toFile:path];
    
}

- (id)getUserInfo{
    
    NSString *path = [[self class] getTheFilePath];
    id user = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return user;
}

-(NSString *)description{

    NSMutableString *descriptionString = [NSMutableString stringWithFormat:@"\n-------\n%@\n",[self class]];
    
    unsigned int count = 0;
    //取得所有成员变量名
    Ivar *ivar = class_copyIvarList([self class], &count);
    for (int i = 0; i < count ;i++) {
        
        Ivar ivarItem = ivar[i];
        
        const char *name = ivar_getName(ivarItem);
        
        NSString *key = [NSString stringWithUTF8String:name];
        
        NSString *value = [self valueForKey:key];
        
        NSString *keyAndValue = [NSString stringWithFormat:@"%@ - %@\n",key,value];
       
        [descriptionString appendString:keyAndValue];
    
    }
    [descriptionString appendString:@"---------"];
    return [descriptionString copy];
}
@end

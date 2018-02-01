//
//  ViewController.m
//  IOSArchiveAndUnarchive
//
//  Created by zxj on 17/2/21.
//  Copyright © 2017年 zxj. All rights reserved.
//

#import "ViewController.h"
#import "ZXJPerson.h"
#import "ZXJStudent.h"
#import "ZXJUserModel.h"
#import "ZXJUserModelOne.h"

#import "SQSearchHotLableModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIButton *writeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [writeBtn setFrame:CGRectMake(100, 150, 100, 50)];
    writeBtn.backgroundColor = [UIColor orangeColor];
    [writeBtn setTitle:@"保存数据" forState:UIControlStateNormal];
    [writeBtn addTarget:self action:@selector(writeData) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:writeBtn];
    
    UIButton *readBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [readBtn setFrame:CGRectMake(100, 250, 100, 50)];
    readBtn.backgroundColor = [UIColor orangeColor];
    [readBtn setTitle:@"读取数据" forState:UIControlStateNormal];
    [readBtn addTarget:self action:@selector(readData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:readBtn];
    
    UIButton *saveArrayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveArrayBtn setFrame:CGRectMake(100, 350, 100, 50)];
    saveArrayBtn.backgroundColor = [UIColor orangeColor];
    [saveArrayBtn setTitle:@"保存数组" forState:UIControlStateNormal];
    [saveArrayBtn addTarget:self action:@selector(saveArray) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveArrayBtn];

    UIButton *readArrayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [readArrayBtn setFrame:CGRectMake(100, 450, 100, 50)];
    readArrayBtn.backgroundColor = [UIColor orangeColor];
    [readArrayBtn setTitle:@"读取数组" forState:UIControlStateNormal];
    [readArrayBtn addTarget:self action:@selector(readArray) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:readArrayBtn];
}

#pragma mark - 缓存历史记录
- (NSString *)filePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filename = [path stringByAppendingPathComponent:@"searchHistory.plist"];
    
    NSFileManager* fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:filename]) {
        [fm createFileAtPath:filename contents:nil attributes:nil];
    }
    return filename;
}

//TODO:保存model数组
- (void)saveArray{
    NSMutableArray *mutArray = [NSMutableArray array];
    for (NSInteger i = 0; i<10; i++) {
        SQSearchHotLableModel *model = [SQSearchHotLableModel new];
        model.sort = [NSString stringWithFormat:@"%ld",i];
        model.name = @"zzz";
        model.linkUrl = @"1";
        model.linkType = @"1";
        [mutArray addObject:model];
    }
    [NSKeyedArchiver archiveRootObject:mutArray toFile:[self filePath]];
}
//TODO:读取model数组
- (void)readArray{
    NSArray *historyArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
    if (historyArray.count) {
        for (SQSearchHotLableModel *model in historyArray) {
            NSLog(@"model.sort is %@ --model.name is %@--model.linkType is %@",model.sort,model.name,model.linkType);
        }
    }
}
//#pragma mark - runTime写法1的归档
//- (void)writeData{
//    
//    ZXJUserModelOne *userOne = [ZXJUserModelOne sharedModelOne];
//    userOne.name = @"zxj";
//    userOne.age  = 100;
//    if ([userOne saveUserInfo]) {
//        NSLog(@"保存成功");
//    }else{
//        NSLog(@"保存失败");
//    }
//    
//}
//
//#pragma mark - runTime写法1的解档
//- (void)readData{
//    
//    ZXJUserModelOne *userOne = [ZXJUserModelOne sharedModelOne];
//    
//    userOne = [userOne getUserInfo];
//    
//    NSLog(@"get data is %@",userOne);
//    
//    [userOne clearUserInfo];
//    
//    NSLog(@"after clear is %@",userOne);
//    
////    NSLog(@"get data  is  %@ -- %ld",userOne.name,userOne.age);
//}

//#pragma mark - runTime的归解档(写法有问题)
- (void)writeData{

    ZXJUserModel *user = [ZXJUserModel sharedInstance];
    user.userName = @"ZXJ";
    user.userAge  = @100;
    if ([user synchronize]) {
        NSLog(@"归档成功");
    }else{
        NSLog(@"归档失败");
    }
}

- (void)readData{

    ZXJUserModel *user = [ZXJUserModel sharedInstance];
    NSString *path = [ZXJUserModel getTheFilePath];
    user = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"user  is  %@",user);
}

//#pragma mark - 儿子的归解档
//- (void)writeData{
//    
//    ZXJStudent *person = [[ZXJStudent alloc]init];
//    person.name = @"人物";
//    person.age  = 10;
//    person.weight = 100.0;
//    
//    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
//    NSString *path = [docPath stringByAppendingString:@"person.juanjuan"];
//    NSLog(@"path is %@",path);
//    
//    //将自定义的对象保存到文件中
//    [NSKeyedArchiver archiveRootObject:person toFile:path];
//    
//    
//}
//
//- (void)readData{
//    
//    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
//    NSString *path = [docPath stringByAppendingString:@"person.juanjuan"];
//    NSLog(@"path is %@",path);
//    
//    // 从文件中读取对象
//    ZXJStudent *person = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
//    
//    NSLog(@"%@,%ld,%f",person.name,(long)person.age,person.weight);
//}


//#pragma mark - 爸爸的归解档
//- (void)writeData{
//    
//    ZXJPerson *person = [[ZXJPerson alloc]init];
//    person.name = @"人物";
//    person.age  = 10;
//    
//    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
//    NSString *path = [docPath stringByAppendingString:@"person.juanjuan"];
//    NSLog(@"path is %@",path);
//    
//    //将自定义的对象保存到文件中
//    [NSKeyedArchiver archiveRootObject:person toFile:path];
//    
//    
//}
//
//- (void)readData{
//    
//    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
//    NSString *path = [docPath stringByAppendingString:@"person.juanjuan"];
//    NSLog(@"path is %@",path);
//    
//    // 从文件中读取对象
//    ZXJPerson *person = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
//    
//    NSLog(@"%@,%ld",person.name,(long)person.age);
//}
@end

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
}


#pragma mark - runTime的归解档
- (void)writeData{

    ZXJUserModel *user = [ZXJUserModel sharedInstance];
    user.userName = @"ZXJ";
    user.userAge  = 100;
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

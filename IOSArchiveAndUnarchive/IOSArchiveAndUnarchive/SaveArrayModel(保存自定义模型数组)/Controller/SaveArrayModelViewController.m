//
//  SaveArrayModelViewController.m
//  IOSArchiveAndUnarchive
//
//  Created by zxj on 2018/1/24.
//  Copyright © 2018年 zxj. All rights reserved.
//

#import "SaveArrayModelViewController.h"

@interface SaveArrayModelViewController ()

@end

@implementation SaveArrayModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *readBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [readBtn setFrame:CGRectMake(100, 250, 100, 50)];
    readBtn.backgroundColor = [UIColor orangeColor];
    [readBtn setTitle:@"读取数据" forState:UIControlStateNormal];
    [readBtn addTarget:self action:@selector(readData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:readBtn];
}

-(void)readData{
    
}
@end

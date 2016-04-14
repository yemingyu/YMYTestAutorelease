//
//  ViewController.m
//  YMYTestAutorelease
//
//  Created by yemingyu on 4/13/16.
//  Copyright © 2016 yemingyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSError *error;
    [self loopThroughDictionaryTest1:@{@"a":@(123)} error:&error];
    [self loopThroughDictionaryTest2:@{@"a":@(123)} error:&error];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (id)loopThroughDictionaryTest1:(NSDictionary *)dict error:(NSError * __autoreleasing *)error
{
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
//            if (error && error != nil)
//            {
                *error = [NSError errorWithDomain:@"ymy" code:1 userInfo:nil];
//            }
    }];
    return *error;
    // *error 在这里已经被dict的做枚举遍历时创建的autorelease pool释放掉了 ：(
}

- (void)loopThroughDictionaryTest2:(NSDictionary *)dict error:(NSError **)error
{
    __block NSError* tempError; // 加__block保证可以在Block内被修改
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
//        if (error && error != nil)
//        {
            tempError = [NSError errorWithDomain:@"ymy" code:0 userInfo:nil];
//        }
    }];
    if (error != nil) {
        *error = tempError;
    }
}

@end

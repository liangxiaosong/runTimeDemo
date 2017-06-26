//
//  ChageVariableViewController.m
//  RunTimeDemo
//
//  Created by LPPZ-User01 on 2017/6/26.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

#import "ChageVariableViewController.h"
#import "Person.h"
#import <objc/message.h>

@interface ChageVariableViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ChageVariableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    Person *person = [[Person alloc] init];
    person.name = @"小明";
    self.person = person;
    NSLog(@"姓名：%@",person.name);

    UIButton *but = [[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 100)/2, 100, 100, 30)];
    [but setTitle:@"更改变量" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(but) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)but {
    unsigned int count = 0;
    Ivar *ivar = class_copyIvarList([Person class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar var = ivar[i];
        const char *varName = ivar_getName(var);
        NSString *nameStr = [NSString stringWithUTF8String:varName];
        if ([nameStr isEqualToString:@"_name"]) {
            object_setIvar(self.person, var, @"明哥");
            break;
        }
    }
    NSLog(@"更改后的名字：%@",self.person.name);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

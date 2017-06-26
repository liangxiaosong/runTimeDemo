//
//  ExchangeMethodViewController.m
//  RunTimeDemo
//
//  Created by LPPZ-User01 on 2017/6/26.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

#import "ExchangeMethodViewController.h"
#import "Person.h"
#import <objc/message.h>

@interface ExchangeMethodViewController ()
@property (nonatomic, strong) Person        *person;
@end

@implementation ExchangeMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.person = [[Person alloc] init];
    NSLog(@"%@",[self.person eat]);

    UIButton *but = [[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 100)/2, 100, 100, 30)];
    [but setTitle:@"交换方法" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(but) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)but {
    Method m1 = class_getInstanceMethod([self.person class], @selector(eat));
    Method m2 = class_getInstanceMethod([self.person class], @selector(jump));
    method_exchangeImplementations(m1, m2);
    NSLog(@"%@",[self.person eat]);
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

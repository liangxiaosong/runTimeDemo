//
//  AddMethodViewController.m
//  RunTimeDemo
//
//  Created by LPPZ-User01 on 2017/6/26.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

#import "AddMethodViewController.h"
#import "Person.h"
#import <objc/message.h>

@interface AddMethodViewController ()

@property (nonatomic, strong) Person        *person;

@end

@implementation AddMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.person = [[Person alloc] init];

    UIButton *but = [[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 100)/2, 100, 100, 30)];
    [but setTitle:@"添加方法" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(but) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)but {
    /**
        方法1
     */
    class_addMethod([self.person class], @selector(guess), (IMP)guessAnswer, "v@:");
    if ([self.person respondsToSelector:@selector(guess)]) {
        [self.person performSelector:@selector(guess)];
    }else {
        NSLog(@"Sorry,I don't know");
    }

    /**
        方法2
     */
    //动态的添加方法 1
    [self.person performSelector:@selector(fly:) withObject:@"1000"];

}

void guessAnswer(id self,SEL _cmd) {
    NSLog(@"He is from GuangTong");
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

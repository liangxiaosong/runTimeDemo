//
//  AddExtentionVariableViewController.m
//  RunTimeDemo
//
//  Created by LPPZ-User01 on 2017/6/26.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

#import "AddExtentionVariableViewController.h"
#import "Person+MutipleName.h"

@interface AddExtentionVariableViewController ()
@property(nonatomic,retain) Person *person;
@end

@implementation AddExtentionVariableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.person = [[Person alloc] init];
    self.person.chineseName = @"哈哈";
    NSLog(@"%@",self.person.chineseName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

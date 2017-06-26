//
//  ViewController.m
//  RunTimeDemo
//
//  Created by LPPZ-User01 on 2017/5/3.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>
#import "ChageVariableViewController.h"
#import "ExchangeMethodViewController.h"
#import "AddMethodViewController.h"
#import "AddExtentionVariableViewController.h"

static NSString * const cellId = @"tableViewCellId";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) NSMutableArray    *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = [NSMutableArray arrayWithObjects:@"动态的改变变量",@"动态的交换方法",@"动态的添加方法",@"动态为扩展添加属性", nil];

    /**
        1.self.xxx 通过访问的方法的引用：包含了set和get方法。而通过下划线是获取自己的实例变量，不包含set和get的方法
        2.self.xxx是对属性的访问；而_xxx是对局部变量的访问。所有被声明为属性的成员，再ios5之前需要使用编译指令@synthesize 来告诉编译器帮助生成属性的getter和setter方法，之后这个指令可以不用认为的指定了，默认情况下编译器会帮助我们生成。编译器在生成getter，setter方法时是有优先级的，他首先查找当前的类中用户是否定义属性的getter，setter方法，如果有，则编译器会跳过，不会再生成，使用用户定义的方法。也就是说你在使用self.xxx时是调用一个getter方法。会使引用计数加一，而_xxx不会使用引用技术加一的
     */

    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ChageVariableViewController *vc = [[ChageVariableViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1) {
        ExchangeMethodViewController *ExchangeMethodVC = [[ExchangeMethodViewController alloc] init];
        [self.navigationController pushViewController:ExchangeMethodVC animated:YES];
    }else if (indexPath.row == 2) {
        AddMethodViewController *AddMethodVC = [[AddMethodViewController alloc] init];
        [self.navigationController pushViewController:AddMethodVC animated:YES];
    }else {
        AddExtentionVariableViewController *AddExtentionVariableVC = [[AddExtentionVariableViewController alloc] init];
        [self.navigationController pushViewController:AddExtentionVariableVC animated:YES];
    }
}

#pragma mark - setter / getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}


- (void)classMain {
    /*获取成员变量
     这里有成员变量，就不会漏掉属性；如果有属性，可能会漏掉成员变量；
     
     {
     int _a; // 成员变量
     }

     @property (nonatomic, assign) NSInteger attitudes_count; // 属性


    unsigned int count = 0;
//     获取类中的所有成员变量
    Ivar *ivarList = class_copyIvarList([Person class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivarList[i];
        // 获取成员变量名字
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSLog(@"%@",ivarName);
    }
*/
/*--------------------------------#我是分割线---------------------------------------*/
    /*获取属性
    unsigned int count = 0;
   objc_property_t *property_t = class_copyPropertyList([Person class], &count);
    for (int i = 0; i < count; i ++) {
        objc_property_t *pro = &property_t[i];
        NSLog(@"%@",[NSString stringWithUTF8String:property_getName(*pro)]);
    }
     */
/*--------------------------------------#动态添加方法-----------------------*/
    /*
    Person *p = [[Person alloc] init];
    [p performSelector:@selector(run:) withObject:@10];
     */

    /*-----------------------#实现NSCoding的自动归档和解档------------------------*/
}

@end

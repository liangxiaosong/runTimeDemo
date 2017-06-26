//
//  Person.m
//  RunTimeDemo
//
//  Created by LPPZ-User01 on 2017/5/3.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person

void fly(id self, SEL sel,NSNumber *meter) {
    NSLog(@"飞%@米",meter);
}

//有未实现的 ‘对象方法’的时候就会调用这个方法，在这个方法中进行动态添加方法的处理
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == NSSelectorFromString(@"fly:")) {
        // 动态添加run方法
        // class: 给哪个类添加方法
        // SEL: 添加哪个方法，即添加方法的方法编号
        // IMP: 方法实现 => 函数 => 函数入口 => 函数名（添加方法的函数实现（函数地址））
        // type: 方法类型，(返回值+参数类型) v:void @:对象->self :表示SEL->_cmd
        class_addMethod(self, sel, (IMP)fly, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

- (NSString *)eat {
    return @"eat";
}

- (NSString *)jump {
    return @"jump";
}

@end

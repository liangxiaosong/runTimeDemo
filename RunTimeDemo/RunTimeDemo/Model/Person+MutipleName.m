//
//  Person+MutipleName.m
//  RunTimeDemo
//
//  Created by LPPZ-User01 on 2017/6/26.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

#import "Person+MutipleName.h"
#import <objc/message.h>

char name;

@implementation Person (MutipleName)

- (void)setChineseName:(NSString *)chineseName {
    objc_setAssociatedObject(self, &name, chineseName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)chineseName{
    return objc_getAssociatedObject(self, &name);
}


@end

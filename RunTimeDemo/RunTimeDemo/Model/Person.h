//
//  Person.h
//  RunTimeDemo
//
//  Created by LPPZ-User01 on 2017/5/3.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString                   *name;
@property (nonatomic, assign) NSInteger                   age;

- (NSString *)eat;

- (NSString *)jump;

@end

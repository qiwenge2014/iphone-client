//
//  Book.m
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "Book.h"

@implementation Book

//mapping
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary: @{@"description":@"desc"}];
}

@end

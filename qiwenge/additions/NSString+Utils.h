//
//  NSString+Utils.h
//  qiwenge
//
//  Created by Eric on 14-9-12.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

- (NSString *)replaceAll:(NSString *)oldStr to:(NSString *)newStr;

- (NSString *)trim;

- (NSString *)appendQueryStringKey:(NSString*)key intValue:(NSInteger)value;

- (NSString *)appendQueryStringKey:(NSString*)key stringValue:(NSString*)value;

@end

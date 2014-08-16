//
//  ApiUtils.m
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "ApiUtils.h"

#define         HOST_NAME               @"http://api.qiwenge.com/%@"
#define         FORMAT_ONE_PARAMS       [NSString stringWithFormat:HOST_NAME,@"%@"]
#define         BOOKS                   @"books"

@implementation ApiUtils

+(NSString *)getBooks{
    return [NSString stringWithFormat:FORMAT_ONE_PARAMS,BOOKS];
}

@end

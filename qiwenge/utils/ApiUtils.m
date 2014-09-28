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
#define         FORMAT_TWO_PARAMS       [NSString stringWithFormat:HOST_NAME,@"%@/%@"]
#define         BOOKS                   @"books"
#define         CATEGORIES              @"categories"
#define         RECOMMEND               @"recommend"
#define         TOP                     @"top"
#define         CHAPTERS                @"chapters"

@implementation ApiUtils

+(NSString *)getBooks{
    return [NSString stringWithFormat:FORMAT_ONE_PARAMS,BOOKS];
}

+(NSString *)getCategories{
    return [NSString stringWithFormat:FORMAT_ONE_PARAMS,CATEGORIES];
}

+(NSString *)getRecommendBooks{
    return [NSString stringWithFormat:FORMAT_TWO_PARAMS,BOOKS,RECOMMEND];
}

+(NSString *)getRank{
     return [NSString stringWithFormat:FORMAT_TWO_PARAMS,BOOKS,TOP];
}

+(NSString *)getBookChapter{
     return [NSString stringWithFormat:FORMAT_ONE_PARAMS,CHAPTERS];
}

@end

//
//  ApiUtils.h
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiUtils : NSObject

+(NSString *)getBooks;

+(NSString *)getCategories;

+(NSString *)getRecommendBooks;

+(NSString *)getRank;

+(NSString *)getBookChapter;

@end

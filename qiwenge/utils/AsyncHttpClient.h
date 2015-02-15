//
//  AsyncHttpClient.h
//  qiwenge
//
//  Created by Eric on 14-8-28.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

//typedef void(^HTTPCallBack)(ServiceResult *result);

typedef void(^SuccessHandler)(id result);

typedef void(^FailureHandler)(NSString *failureMessage);

@interface AsyncHttpClient : NSObject

+(void)get:(NSString *)url classOf:(Class)classOf success:(SuccessHandler)success failure:(FailureHandler)failure;

+(void)getFromResultNode:(NSString *)url classOf:(Class)classOf success:(SuccessHandler)success failure:(FailureHandler)failure;

@end

//
//  AsyncHttpClient.m
//  qiwenge
//
//  Created by Eric on 14-8-28.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "AsyncHttpClient.h"
#import "Books.h"

@implementation AsyncHttpClient


+(void)get:(NSString *)url classOf:(Class)classOf success:(SuccessHandler)success failure:(FailureHandler)failure{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id result=[[classOf alloc] initWithString:operation.responseString error:nil];
        success(result);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

@end

//
//  AsyncHttpClient.m
//  qiwenge
//
//  Created by Eric on 14-8-28.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "AsyncHttpClient.h"

@implementation AsyncHttpClient

//请求数据，解析为JSONModel
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

//请求数据，并把result节点下的数据，解析为JSONModel
+(void)getFromResultNode:(NSString *)url classOf:(Class)classOf success:(SuccessHandler)success failure:(FailureHandler)failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id jsonObject=[NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dict=(NSDictionary *)jsonObject;
        NSDictionary *subDict=[dict objectForKey:@"result"];
        id result=[[classOf alloc] initWithDictionary:subDict error:nil];
        success(result);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end

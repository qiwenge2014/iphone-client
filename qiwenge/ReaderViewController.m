//
//  ReaderViewController.m
//  qiwenge
//
//  Created by Eric on 15/1/19.
//  Copyright (c) 2015年 qiwenge. All rights reserved.
//

#import "ReaderViewController.h"
#import "ResultItem.h"

@interface ReaderViewController ()

@end

@implementation ReaderViewController

-(void)passArguments:(id)id{
    if(id){
        self.chapter=id;
        NSLog(@"title:%@",self.chapter.title);
        NSLog(@"id%@",self.chapter.getId);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getChapter];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)getChapter{
    NSString *url=[ApiUtils getChapter:self.chapter.getId];
    NSLog(@"url:%@",url);
    [AsyncHttpClient getFromResultNode:url classOf:[Chapter class] success:^(id result) {
        Chapter *chapter=result;
        [self.lbContent setText:chapter.content];
        [self.lbContent autoResizeHeight];
    } failure:^(NSString *failureMessage) {
       
    }];
}

@end

//
//  ChapterViewController.m
//  qiwenge
//
//  Created by Eric on 14-9-27.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "ChapterViewController.h"
#import "ChapterList.h"
#import "ChapterCell.h"

@interface ChapterViewController ()

@end

@implementation ChapterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initNavigationBarWithTopTitle:@"章节" leftTitle:@"返回" rightTitle:nil];
    [self getChapters];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)requestData{
    [super requestData];
    [self getChapters]; 
}

-(void)passArguments:(id)id{
    if(id){
        _book=id;
             NSLog(@"passArguments,%@",_book._id.$id);
    }
}

-(void)getChapters{
    NSLog(@"getChapters");
    NSString *url=[ApiUtils getBookChapter];
    url=[url appendQueryStringKey:@"book_id" stringValue:_book.getId];
    url=[url appendQueryStringKey:@"limit" intValue:9999];
    NSLog(@"url:%@",url);
    [AsyncHttpClient get:url classOf:[ChapterList class] success:^(id result) {
        ChapterList *chapters=result;
        NSArray *array=chapters.result;
        [self requestSuccess:array];
    } failure:^(NSString *failureMessage) {
        
    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ChapterCell *cell=[tableView dequeueReusableCellWithIdentifier:[ChapterCell getCellReuseIdentifier]];
    if (!cell) {
        cell=[ChapterCell getCellFromXib];
    }
    Chapter *chapter=[self.data objectAtIndex:indexPath.row];
    [cell bindData:chapter];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  RankViewController.m
//  qiwenge
//
//  Created by Eric on 14-8-22.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "RankViewController.h"
#import "BooksCell.h"
#import "AFNetworking.h"
#import "JSONModel.h"
#import "Books.h"
#import "Book.h"
#import "BookDetailViewController.h"

@interface RankViewController ()

@end

@implementation RankViewController 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setEnableFooterPage:YES];
    [self setEnablePullToRefresh:YES];
    [self requestData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)requestData{
    [super requestData];
    [self getBooks];
}

-(void)getBooks{
    NSString *url=[ApiUtils getRank];
    url=[url appendQueryStringKey:@"status" intValue:1];
    url=[url appendQueryStringKey:@"page" intValue:self.pageindex];
    url=[url appendQueryStringKey:@"limit" stringValue:@"20"];
    [AsyncHttpClient get:url classOf:[Books class] success:^(id result) {
        Books *books=result;
        NSArray *array=books.result;
        [self requestSuccess:array]; 
    } failure:^(NSString *failureMessage) {
        [self requestFailed];
    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row<self.data.count) {
        BooksCell *cell=[tableView dequeueReusableCellWithIdentifier:[BooksCell getCellReuseIdentifier]];
        if (!cell) {
            cell=[BooksCell getCellFromXib];
        }
        Book *book=[self.data objectAtIndex:indexPath.row];
        [cell bindData:book];
        return cell;
    }
    return [super tableView:self.mTableView cellForRowAtIndexPath:indexPath];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.mDelegate skipToBookDetail:[self.data objectAtIndex:indexPath.row]];
}


@end

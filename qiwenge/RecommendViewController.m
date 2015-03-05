//
//  RecommendViewController.m
//  qiwenge
//
//  Created by Eric on 14-8-22.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "RecommendViewController.h"
#import "BooksCell.h"
#import "AFNetworking.h"
#import "JSONModel.h"
#import "Books.h"
#import "Book.h"

@interface RecommendViewController ()

@end

@implementation RecommendViewController

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
    
    [self setEnablePullToRefresh:YES];
    [self setEnableFooterPage:YES];
    
    [self requestData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getBooks{
    NSString *url=[ApiUtils getRecommendBooks];
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

-(void)requestData{
    [super requestData];
    [self getBooks];
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
    return  [super tableView:self.mTableView cellForRowAtIndexPath:indexPath];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; 

    [self.mDelegate skipToBookDetail:[self.data objectAtIndex:indexPath.row]];
}


@end

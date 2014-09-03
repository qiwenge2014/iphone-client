//
//  BookShelfViewController.m
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "BookShelfViewController.h"
#import "BooksCell.h"
#import "AFNetworking.h"
#import "JSONModel.h"
#import "Books.h"
#import "Book.h"
#import "BookDetailViewController.h"

@interface BookShelfViewController ()

@end

@implementation BookShelfViewController

@synthesize mDelegate;

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
    self.data =[[NSMutableArray alloc] init];
    [self getBooks];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void)getBooks{
    NSString *url=[ApiUtils getBooks];
    [AsyncHttpClient get:url classOf:[Books class] success:^(id result) {
        Books *books=result;
        NSArray *array=books.result;
        [self.data addObjectsFromArray:array];
        [self.mTableView reloadData];
    } failure:^(NSString *failureMessage) {
        
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BooksCell *cell=[tableView dequeueReusableCellWithIdentifier:[BooksCell getCellReuseIdentifier]];
    if (!cell) {
        cell=[BooksCell getCellFromXib];
    }
    Book *book=[self.data objectAtIndex:indexPath.row];
    [cell bindData:book];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     Book *book=[self.data objectAtIndex:indexPath.row];
    [mDelegate skipToBookDetail:book];
}

@end

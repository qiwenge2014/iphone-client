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
    self.data =[[NSMutableArray alloc] init];
    [self getBooks];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getBooks{
    NSString *url=[ApiUtils getBooks];
    url=[NSString stringWithFormat:@"%@?limit=20",url];
    [AsyncHttpClient get:url classOf:[Books class] success:^(id result) {
        Books *books=result;
        NSArray *array=books.result;
        [self.data addObjectsFromArray:array];
        [self.mTableView reloadData];
    } failure:nil];
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

@end

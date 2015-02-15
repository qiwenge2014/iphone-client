//
//  CategoryViewController.m
//  qiwenge
//
//  Created by Eric on 14-8-22.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoryCell.h"
#import "AFNetworking.h"
#import "JSONModel.h"
#import "CategoryList.h"
#import "CategoryItem.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController

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

-(void)getBooks{
    NSString *url=[ApiUtils getCategories];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        CategoryList *books=[[CategoryList alloc] initWithString:operation.responseString error:nil];
        NSArray *array=books.result;
        [self.data addObjectsFromArray:array];
        [self.mTableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return self.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCell *cell=[tableView dequeueReusableCellWithIdentifier:[CategoryCell getCellReuseIdentifier]];
    if(!cell){
        cell=[CategoryCell getCellFromXib]; 
    }
    CategoryItem *category=[self.data objectAtIndex:indexPath.row];
    cell.labelTitle.text=category.name;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; 
}

@end

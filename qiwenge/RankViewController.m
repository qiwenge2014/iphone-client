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

int pageindex=1;
BOOL isLoading=false;

EGORefreshTableHeaderView *refreshView;
BOOL reloading;

@interface RankViewController ()

@end

@implementation RankViewController

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
    
    if(refreshView == nil)
    {
//        refreshView = [[EGORefreshTableHeaderView alloc]
//                                           initWithFrame:CGRectMake(0.0f, 0.0f - self.mTableView.bounds.size.height,
//                                          self.view.frame.size.width, self.mTableView.bounds.size.height)];
//        
//
         CGRect tableViewBounds = self.mTableView.bounds;
//        refreshView = [[EGORefreshTableHeaderView alloc]
//                       initWithFrame:CGRectMake(0, 0 - tableViewBounds.size.height, tableViewBounds.size.width, tableViewBounds.size.height)
//                                                         arrowImageName:@"icon_pull_to_refresh"
//                                                              textColor:[UIColor redColor]];
      
        
         refreshView = [[EGORefreshTableHeaderView alloc]
                                                  initWithFrame:CGRectMake(0, 0 - tableViewBounds.size.height, tableViewBounds.size.width, tableViewBounds.size.height)
                                                                                   arrowImageName:@"icon_pull_to_refresh"
                                                                                        textColor:[UIColor redColor]];
        refreshView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
        refreshView.backgroundColor = [UIColor backgoundColor]; 
        refreshView.delegate = self;
        refreshView.pullingTitle=@"释放刷新";
        refreshView.normalTitle=@"下拉刷新";
        refreshView.LoadingTitle=@"正在加载";
        [self.mTableView addSubview:refreshView];
    }
    [refreshView refreshLastUpdatedDate];
    self.data =[[NSMutableArray alloc] init];
    [self getBooks];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getBooks{
    if (isLoading) {
        return;
    }
    isLoading=true;
    NSString *url=[ApiUtils getRank];
    url=[url appendQueryStringKey:@"status" intValue:1];
    url=[url appendQueryStringKey:@"page" intValue:pageindex];
    url=[url appendQueryStringKey:@"limit" stringValue:@"20"];
    NSLog(@"%@url:",url);
    [AsyncHttpClient get:url classOf:[Books class] success:^(id result) {
        Books *books=result;
        NSArray *array=books.result;
        if (pageindex==1) {
            [self.data removeAllObjects];
        }
        
        [self.data addObjectsFromArray:array];
        [self.mTableView reloadData];
        isLoading=false;
        [self finishedRefreshLoading];
    } failure:^(NSString *failureMessage) {
        isLoading=false;
        [self finishedRefreshLoading];
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
    [mDelegate skipToBookDetail:[self.data objectAtIndex:indexPath.row]];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [refreshView egoRefreshScrollViewDidScroll:scrollView];
    if (isLoading) {
        return;
    }
    if(self.mTableView.contentOffset.y >= (self.mTableView.contentSize.height - self.mTableView.bounds.size.height)){
        pageindex++;
        [self getBooks];
    }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [refreshView egoRefreshScrollViewDidEndDragging:scrollView];
}

-(void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view{
    NSLog(@"egoRefreshTableHeaderDidTriggerRefresh");
    pageindex=1;
    [self getBooks];
}

-(BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view{
    return reloading;
}

-(void)finishedRefreshLoading{
    reloading = false;
    [refreshView egoRefreshScrollViewDataSourceDidFinishedLoading:self.mTableView];
}

@end

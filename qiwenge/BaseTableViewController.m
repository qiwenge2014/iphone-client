//
//  BaseTableViewController.m
//  qiwenge
//
//  Created by Eric on 14-9-16.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setEnableFooterPage:(BOOL)enablePage{
    _enableFooterPage=enablePage;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int count=self.data.count;
    if(_enableFooterPage)count=count+1;
    return count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_enableFooterPage&&indexPath.row==self.data.count) {
        return 44;
    }
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_enableFooterPage&&indexPath.row==self.data.count) {
        FooterPageCell *pageCell=[tableView dequeueReusableCellWithIdentifier:[FooterPageCell getCellReuseIdentifier]];
        if(!pageCell){
            NSLog(@"create footer");
            pageCell=[FooterPageCell getCellFromXib];
        }
        return pageCell;
    }
    return nil;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    [self checkLoadMore];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self.refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}

-(void)checkLoadMore{
    if(self.enableFooterPage&&self.loadStatus==Normal&&self.mTableView.contentOffset.y >= (self.mTableView.contentSize.height - self.mTableView.bounds.size.height)){
        [self loadMore];
    }
}

//－－－－－－－－－－－－－－－pullToRefresh start－－－－－－－－－－－－－－－

-(void)setEnablePullToRefresh:(BOOL)enable{
    if (enable) {
        CGRect tableViewBounds = self.mTableView.bounds;
        self.refreshHeaderView = [[EGORefreshTableHeaderView alloc]
                                  initWithFrame:CGRectMake(0, 0 - tableViewBounds.size.height, tableViewBounds.size.width, tableViewBounds.size.height)
                                  arrowImageName:@"icon_pull_to_refresh"
                                  textColor:[UIColor lbTitleColor]];
        self.refreshHeaderView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
        self.refreshHeaderView.backgroundColor = [UIColor backgoundColor];
        self.refreshHeaderView.delegate = self;
        self.refreshHeaderView.pullingTitle=@"释放刷新";
        self.refreshHeaderView.normalTitle=@"下拉刷新";
        self.refreshHeaderView.LoadingTitle=@"正在加载";
        [self.mTableView addSubview:self.refreshHeaderView];
    }else if(self.refreshHeaderView){
        [self.refreshHeaderView removeFromSuperview];
        self.refreshHeaderView=nil;
    }
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view {
    return self.loadStatus != Normal;
}

-(void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view {
    [self refreshStart];
}

//－－－－－－－－－－－－－－－pullToRefresh end－－－－－－－－－－－－－－－

-(void)loadMore{
    self.loadStatus=Paging;
    _pageindex++;
    [self requestData];
}

-(void)refreshStart{
    if (self.loadStatus == Normal) {
        self.pageindex=1;
        self.loadStatus = Refreshing;
        [self requestData];
    }
}

-(void)refreshFinished{
    self.loadStatus=Normal;
    [self.refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.mTableView];
}

-(void)requestSuccess:(NSArray *)array{
    NSLog(@"requestSuccess");
    [self refreshFinished];
    
    if (self.pageindex==1) {
        [self.data removeAllObjects];
    }
    [self.data addObjectsFromArray:array];
    
    [self.mTableView reloadData];
}

-(void)requestFailed{
     NSLog(@"requestFailed");
    [self refreshFinished];
}

-(void)requestData{
    NSLog(@"requestData");
}

@end

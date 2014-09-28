//
//  BaseTableViewController.h
//  qiwenge
//
//  Created by Eric on 14-9-16.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

typedef enum {
    Normal,
    Refreshing,
    Paging
}LoadStatus;

@interface BaseTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate >

@property (nonatomic, nonatomic) IBOutlet UITableView *mTableView;

@property (strong, nonatomic) NSMutableArray *data;

@property (nonatomic, strong) EGORefreshTableHeaderView *refreshHeaderView; 

@property (nonatomic, assign) NSInteger limit;

@property (nonatomic, assign) NSInteger pageindex;

@property (nonatomic, assign) LoadStatus loadStatus;

@property (nonatomic, assign) BOOL enableFooterPage;

-(void)setEnablePullToRefresh:(BOOL)enable;

-(void)setEnableFooterPage:(BOOL)enablePage;

-(void)requestSuccess:(NSArray *)array;

-(void)requestFailed;

-(void)requestData;

@end

//
//  RankViewController.h
//  qiwenge
//
//  Created by Eric on 14-8-22.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowBookDelegate.h"

@interface RankViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    id<ShowBookDelegate> mDelegate;
}

@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@property (strong, nonatomic) NSMutableArray *data;

@property (retain, nonatomic) id mDelegate;

@end

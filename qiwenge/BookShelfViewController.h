//
//  BookShelfViewController.h
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"
#import "ShowBookDelegate.h"

@interface BookShelfViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    id<ShowBookDelegate> mDelegate;
}

@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (strong, nonatomic) NSMutableArray *data;
@property (retain, nonatomic) id mDelegate;

@end

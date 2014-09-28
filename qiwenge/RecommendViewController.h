//
//  推荐
//  RecommendViewController.h
//  qiwenge
//
//  Created by Eric on 14-8-22.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"
#import "ShowBookDelegate.h"

@interface RecommendViewController : BaseTableViewController 

@property (retain, nonatomic) id<ShowBookDelegate> mDelegate;

@end

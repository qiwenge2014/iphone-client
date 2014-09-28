//
//  ChapterViewController.h
//  qiwenge
//
//  Created by Eric on 14-9-27.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"
#import "Book.h"

@interface ChapterViewController : BaseTableViewController <PassArgumentsDelegate>

@property (assign, nonatomic) Book *book;

@end

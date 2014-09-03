//
//  BookDetailViewController.h
//  qiwenge
//
//  Created by Eric on 14-8-30.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassArgumentsDelegate.h"
#import "Book.h"

@interface BookDetailViewController : UIViewController<PassArgumentsDelegate>
{
    Book *_book;
}

@property (weak, nonatomic) IBOutlet UILabel *lableTitle;

@property (weak, nonatomic) IBOutlet UIButton *btnChapter;

@property (weak, nonatomic) IBOutlet UIButton *btnAdd;

@property (assign, nonatomic) Book *book;

@end

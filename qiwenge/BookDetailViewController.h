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
#import "ChapterViewController.h"

@interface BookDetailViewController : UIViewController<PassArgumentsDelegate>
{
    Book *_book;
}

@property (weak, nonatomic) IBOutlet UIScrollView *mScrollView;

@property (weak, nonatomic) IBOutlet UIImageView *mCover;

@property (weak, nonatomic) IBOutlet UIView *mViewDesc;

@property (weak, nonatomic) IBOutlet UILabel *lableTitle;

@property (weak, nonatomic) IBOutlet UILabel *lableDesc;

@property (weak, nonatomic) IBOutlet UILabel *lbAuthor;

@property (weak, nonatomic) IBOutlet UILabel *lbCategory;

@property (weak, nonatomic) IBOutlet UILabel *lbStatus;

@property (weak, nonatomic) IBOutlet UIButton *btnChapter;

@property (weak, nonatomic) IBOutlet UIButton *btnAdd;

@property (assign, nonatomic) Book *book;

- (IBAction)skipToChapter:(id)sender;


@end

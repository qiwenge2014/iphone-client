//
//  BooksCell.h
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"
#import "Book.h"

@interface BooksCell : BaseCell

@property (weak, nonatomic) IBOutlet UIImageView *ivCover;

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;

@property (weak, nonatomic) IBOutlet UILabel *lbAuthor;

@property (weak, nonatomic) IBOutlet UILabel *lbDesc;

-(void)bindData:(Book *)book;

@end

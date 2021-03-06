//
//  BooksCell.m
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "BooksCell.h"

@implementation BooksCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)bindData:(Book *)book{
    if(book){
        self.lbTitle.text=book.title;
        self.lbAuthor.text=book.author;
        self.lbDesc.text=book.desc;
        [self.ivCover setBookCover:book.cover];
        [self.ivCover showBorder];
    }
}
 

@end

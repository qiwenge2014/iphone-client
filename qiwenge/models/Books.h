//
//  Books.h
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "JSONModel.h"
#import "Book.h"

@protocol Book
@end

@interface Books : JSONModel

@property (assign, nonatomic) int total;

@property (strong, nonatomic) NSArray<Book> *result;

@end

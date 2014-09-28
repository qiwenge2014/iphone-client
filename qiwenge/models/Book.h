//
//  Book.h
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "JSONModel.h"

@interface Book : BaseJsonModel

@property(strong, nonatomic) NSString *title;

@property(strong, nonatomic) NSString *author;

@property(strong, nonatomic) NSString *desc;

@property(strong, nonatomic) NSString *cover;

@property(strong, nonatomic) NSArray *categories;

@end

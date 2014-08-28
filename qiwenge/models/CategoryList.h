//
//  CategoryList.h
//  qiwenge
//
//  Created by Eric on 14-8-22.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "JSONModel.h"
#import "CategoryItem.h"

@protocol CategoryItem
@end

@interface CategoryList : JSONModel

@property (assign, nonatomic) int total;

@property (strong, nonatomic) NSArray<CategoryItem> *result;

@end

//
//  ChapterList.h
//  qiwenge
//
//  Created by Eric on 14-9-27.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "JSONModel.h"
#import "Chapter.h"

@protocol Chapter
@end

@interface ChapterList : JSONModel

@property (assign, nonatomic) int total;

@property (strong, nonatomic) NSArray<Chapter> *result;

@end

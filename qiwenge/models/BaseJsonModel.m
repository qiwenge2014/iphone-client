//
//  BaseJsonModel.m
//  qiwenge
//
//  Created by Eric on 14-9-27.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "BaseJsonModel.h"

@implementation BaseJsonModel

-(NSString *)getId{
    return self._id.$id;
}

@end

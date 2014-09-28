//
//  BaseJsonModel.h
//  qiwenge
//
//  Created by Eric on 14-9-27.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "Id.h"

@interface BaseJsonModel : JSONModel

@property(strong ,nonatomic) Id *_id;

-(NSString *)getId;

@end

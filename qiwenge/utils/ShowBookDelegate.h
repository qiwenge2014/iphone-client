//
//  ShowBookDelegate.h
//  qiwenge
//
//  Created by Eric on 14-9-3.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@protocol ShowBookDelegate <NSObject>

- (void)skipToBookDetail:(Book *)book;

@end

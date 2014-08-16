//
//  BaseCell.h
//  MyFs
//
//  Created by Eric on 14-3-2.
//  Copyright (c) 2014年 Sky. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseCell : UITableViewCell

+ (NSString *)getCellReuseIdentifier;

+ (id)getCellFromXib;

@end

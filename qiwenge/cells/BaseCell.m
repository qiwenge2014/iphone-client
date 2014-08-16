//
//  BaseCell.m
//  MyFs
//
//  Created by Eric on 14-3-2.
//  Copyright (c) 2014年 Sky. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

+(NSString *)getCellReuseIdentifier
{
     return NSStringFromClass([self class]);
}

+ (id)getCellFromXib {
    Class cellClass = [self class];
    NSString *cellClassName = NSStringFromClass(cellClass);
    NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:cellClassName owner:nil options:nil];
    for (NSObject *item in nibArray) {
        if ([item isMemberOfClass:cellClass]) {
            return item;
        }
    }
    return nil;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end

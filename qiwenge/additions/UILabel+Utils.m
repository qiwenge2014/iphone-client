//
//  UILabel+Utils.m
//  FishSaying
//
//  Created by aazhou on 13-9-26.
//  Copyright (c) 2013年 joyotime. All rights reserved.
//

#import "UILabel+Utils.h"

@implementation UILabel (Utils)

- (void)autoResizeHeight {
    self.numberOfLines = 0;
    self.size = [self sizeThatFits:CGSizeMake(self.size.width, 5000)];
}


@end

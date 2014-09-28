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
    if ([self respondsToSelector:@selector(sizeThatFits:)]) {
        self.size = [self sizeThatFits:CGSizeMake(self.size.width, 5000)];
    }
    else {
        CGSize theSize = [self.text sizeWithFont:self.font
                               constrainedToSize:CGSizeMake(self.size.width, 5000)
                                   lineBreakMode:self.lineBreakMode];
        self.sizeH = theSize.height;
    }
}

@end

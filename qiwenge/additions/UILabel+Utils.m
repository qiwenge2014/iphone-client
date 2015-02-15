//
//  UILabel+Utils.m
//  qiwenge
//
//  Created by Eric on 14-9-25.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "UILabel+Utils.h"

@implementation UILabel (Utils)

-(void)setBookDesc:(NSString *)txt{
    [self setText:txt];
}

- (void)autoResizeHeight {
    self.numberOfLines = 0; 
    self.size = [self sizeThatFits:CGSizeMake(self.size.width, 5000)];
}

-(void)setLineSpacing:(int)spacing{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
}

@end

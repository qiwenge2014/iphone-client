//
//  UIButton+Utils.m
//  qiwenge
//
//  Created by Eric on 14-9-26.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "UIButton+Utils.h"

@implementation UIButton (Utils)

-(void)setStyleOfBookDetail{
    
    [self setBackgroundImage:[self imageWithColor:[UIColor backgoundColor]]
                    forState:UIControlStateNormal ];
    
    [self setBackgroundImage:[self imageWithColor:[UIColor mainDressColor]]
                    forState:UIControlStateHighlighted];
    
    [self.layer setBorderWidth:1];
    [self.layer setBorderColor:[[UIColor mainDressColor] CGColor]];
}

-(UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,[color CGColor]);
    CGContextFillRect(context, rect);
    UIImage * image = [[UIImage alloc] init];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

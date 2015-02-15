//
//  UIImageView+Utils.m
//  qiwenge
//
//  Created by Eric on 14-9-25.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "UIImageView+Utils.h"

@implementation UIImageView (Utils)

-(void)setImageWithUrl:(NSString *)url{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"icon_place_holder.png"] options:SDWebImageRefreshCached];
}

-(void)setBookCover:(NSString *)url{
    [self setImageWithUrl:url];
    [self showBorder];
}

-(void)showBorder{
    self.layer.borderWidth=1;
    self.layer.borderColor=[UIColor coverBorder].CGColor;
}

@end

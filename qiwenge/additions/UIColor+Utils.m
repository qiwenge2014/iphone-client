//
//  UIColor+Utils.m
//  MyFs
//
//  Created by Eric on 14-2-20.
//  Copyright (c) 2014年 Sky. All rights reserved.
//

#import "UIColor+Utils.h"

#define     BACKGOURND_COLOR                @"#ffffff"
#define     SECOND_BACKGOURND_COLOR         @"#eeeeee"
#define     ACTIONBAR_BG_COLOR              @"#303030"
#define     COVER_BORDER_COLOR              @"#c7c7c7"
#define     MAIN_DRESS_COLOR                @"#ee7a31"
#define     LB_TITLE_COLOR                  @"#606060"
#define     LB_DESC_COLOR                   @"#838383"

@implementation UIColor (Utils)

+(UIColor *)backgoundColor{
    return [UIColor colorWithHex:BACKGOURND_COLOR];
}

+(UIColor *)sendBackgoundColor{
    return [UIColor colorWithHex:SECOND_BACKGOURND_COLOR];
}

+(UIColor *)actionbarBgColor{
     return [UIColor colorWithHex:ACTIONBAR_BG_COLOR];
}

+(UIColor *)coverBorder{
    return [UIColor colorWithHex:COVER_BORDER_COLOR];
}

+(UIColor *)mainDressColor{
    return [UIColor colorWithHex:MAIN_DRESS_COLOR];
}

+(UIColor *)lbTitleColor{
    return [UIColor colorWithHex:LB_TITLE_COLOR];
}

+(UIColor *)lbDescColor{
    return [UIColor colorWithHex:LB_DESC_COLOR];
}

+ (UIColor *)colorWithHex:(NSString *)hexColor {
    hexColor = [hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([hexColor length] < 6) {
        return nil;
    }
    
    if ([hexColor hasPrefix:@"#"]) {
        hexColor = [hexColor substringFromIndex:1];
    }
    
    NSRange range = NSMakeRange(0, 2);
    NSString *rs = [hexColor substringWithRange:range];
    range.location = 2;
    NSString *gs = [hexColor substringWithRange:range];
    range.location = 4;
    NSString *bs = [hexColor substringWithRange:range];
    
    unsigned int r, g, b, a;
    [[NSScanner scannerWithString:rs] scanHexInt:&r];
    [[NSScanner scannerWithString:gs] scanHexInt:&g];
    [[NSScanner scannerWithString:bs] scanHexInt:&b];
    
    if ([hexColor length] == 8) {
        range.location = 4;
        NSString *as = [hexColor substringWithRange:range];
        [[NSScanner scannerWithString:as] scanHexInt:&a];
    } else {
        a = 255;
    }
    
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:((float)a / 255.0f)];
}


@end

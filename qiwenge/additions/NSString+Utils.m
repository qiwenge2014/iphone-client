//
//  NSString+Utils.m
//  qiwenge
//
//  Created by Eric on 14-9-12.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

-(NSString *)trim{
     return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSString *)appendQueryStringKey:(NSString *)key intValue:(NSInteger)value
{
    return [self appendQueryStringKey:key stringValue:[NSString stringWithFormat:@"%i", value]];
}

-(NSString *)appendQueryStringKey:(NSString *)key stringValue:(NSString *)value{
    value=[value urlEncodingWithUTF8Encoding];
    if ([self rangeOfString:@"?"].length==0) {
        return [NSString stringWithFormat:@"%@?%@=%@", [self trim], key, value];
    }
    else {
        if ([self rangeOfString:@"&"].location==(self.length - 1)) {
            return [NSString stringWithFormat:@"%@%@=%@", [self trim], key,value];
        }
        else {
            return [NSString stringWithFormat:@"%@&%@=%@", [self trim], key, value];
        }
    }

}

- (NSString *)urlEncodingWithUTF8Encoding {
    return [self urlEncoding:NSUTF8StringEncoding];
}
- (NSString *)urlEncoding:(NSStringEncoding)encoding {
	NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                             (CFStringRef)self,
                                                                                             NULL,
                                                                                             (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                             CFStringConvertNSStringEncodingToEncoding(encoding)));
    return result;
}

@end

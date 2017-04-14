//
//  MRYoutubeUtility.m
//  YoutubePlayerDemo
//
//  Created by Monu Rathor on 11/04/17.
//  Copyright © 2017 Monu. All rights reserved.
//

#import "MRYoutubeUtility.h"

@implementation MRYoutubeUtility

+ (NSDictionary *)dictionaryFromString:(NSString *)string{
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    NSArray *fields = [string componentsSeparatedByString:@"&"];
    for (NSString *field in fields)
    {
        NSArray *pair = [field componentsSeparatedByString:@"="];
        if (pair.count == 2)
        {
            NSString *key = pair[0];
            NSString *value = [pair[1] stringByRemovingPercentEncoding];
            value = [value stringByReplacingOccurrencesOfString:@"+" withString:@" "];
            dictionary[key] = value;
        }
    }
    return [dictionary copy];
}

+ (NSURL *)getURLFromString:(NSString *)string{
    return string ? [NSURL URLWithString:string] : nil;
}

@end

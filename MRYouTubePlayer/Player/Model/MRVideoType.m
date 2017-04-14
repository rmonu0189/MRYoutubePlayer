//
//  MRVideoType.m
//  YoutubePlayerDemo
//
//  Created by Monu Rathor on 11/04/17.
//  Copyright © 2017 Monu. All rights reserved.
//

#import "MRVideoType.h"
#import "MRYoutubeUtility.h"

@implementation MRVideoType

- (nullable instancetype)initWithDictionary:(nonnull NSDictionary *)videoDictionary{
    self = [super init];
    
    _itag = videoDictionary[@"itag"] ? [videoDictionary[@"itag"] integerValue] : 0;
    _quality = videoDictionary[@"quality"] ? videoDictionary[@"quality"] : @"";
    _type = videoDictionary[@"type"] ? videoDictionary[@"type"] : @"";
    _url = [MRYoutubeUtility getURLFromString:videoDictionary[@"url"]];
    
    NSLog(@"%@", videoDictionary);
    
    return self;
}

@end

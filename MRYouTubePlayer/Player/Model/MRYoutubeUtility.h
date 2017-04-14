//
//  MRYoutubeUtility.h
//  YoutubePlayerDemo
//
//  Created by Monu Rathor on 11/04/17.
//  Copyright © 2017 Monu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRYoutubeUtility : NSObject

+ (NSDictionary *)dictionaryFromString:(NSString *)string;

+ (NSURL *)getURLFromString:(NSString *)string;

@end

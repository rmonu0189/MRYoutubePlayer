//
//  MRVideoType.h
//  YoutubePlayerDemo
//
//  Created by Monu Rathor on 11/04/17.
//  Copyright © 2017 Monu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRVideoType : NSObject

- (nullable instancetype)initWithDictionary:(nonnull NSDictionary *)videoDictionary;

@property (nonatomic, assign) NSInteger itag;

@property (nonatomic, copy, nullable) NSString *quality;

@property (nonatomic, copy, nullable) NSString *type;

@property (nonatomic, strong, nullable) NSURL *url;

@end

//
//  MRYoutubeVideo.h
//  YoutubePlayerDemo
//
//  Created by Monu Rathor on 11/04/17.
//  Copyright © 2017 Monu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRYoutubeUtility.h"
#import "MRVideoType.h"
#import "MRPlayerViewController.h"

@interface MRYouTubeVideo : NSObject

- (nullable instancetype)initWithVideoId:(nonnull NSString *)videoId Dictionary:(nonnull NSDictionary *)videoDictionary;

- (nullable MRVideoType *)getVideoWithQuality:(MRYouTubeVideoQuality)quality;

/**
 *  --------------------------------
 *  @name Accessing video properties
 *  --------------------------------
 */
@property (nonatomic, readonly, nonnull) NSString *videoId;

@property (nonatomic, readonly, nonnull) NSString *title;

@property (nonatomic, readonly) NSTimeInterval duration;

@property (nonatomic, readonly, nullable) NSURL *smallThumbnailURL;

@property (nonatomic, readonly, nullable) NSURL *mediumThumbnailURL;

@property (nonatomic, readonly, nullable) NSURL *largeThumbnailURL;

@end

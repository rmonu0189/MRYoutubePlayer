//
//  MRPlayerViewController.h
//  YoutubePlayerDemo
//
//  Created by Monu Rathor on 11/04/17.
//  Copyright © 2017 Monu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

typedef NS_ENUM(NSUInteger, MRYouTubeVideoQuality) {
    /**
     *  Video: 240p MPEG-4 Visual | 0.175 Mbit/s
     *  Audio: AAC | 36 kbit/s
     */
    MRYouTubeVideoQualitySmall240  = 36,
    
    /**
     *  Video: 360p H.264 | 0.5 Mbit/s
     *  Audio: AAC | 96 kbit/s
     */
    MRYouTubeVideoQualityMedium360 = 18,
    
    /**
     *  Video: 720p H.264 | 2-3 Mbit/s
     *  Audio: AAC | 192 kbit/s
     */
    MRYouTubeVideoQualityHD720     = 22,
};

@interface MRPlayerViewController : MPMoviePlayerViewController

- (nonnull instancetype)initWithYouTubeVideoId:(nonnull NSString *)videoId Quality:(MRYouTubeVideoQuality)quality;

@property (nonatomic, copy, nonnull) NSString *videoId;

@end

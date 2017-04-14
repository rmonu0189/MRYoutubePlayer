//
//  MRPlayerViewController.m
//  YoutubePlayerDemo
//
//  Created by Monu Rathor on 11/04/17.
//  Copyright © 2017 Monu. All rights reserved.
//

#import "MRPlayerViewController.h"
#import "MRYoutubeVideo.h"
#import "MRYoutubeConnection.h"

@interface MRPlayerViewController ()

@property (nonatomic, assign) MRYouTubeVideoQuality quality;

@property (nonatomic, strong) MRYouTubeVideo *video;

@end

@implementation MRPlayerViewController

- (nonnull instancetype)initWithYouTubeVideoId:(nonnull NSString *)videoId Quality:(MRYouTubeVideoQuality)quality{
    
    if (!(self = [super initWithContentURL:nil])) { return nil; }

    self.moviePlayer.shouldAutoplay = YES;
    [self.moviePlayer setMovieSourceType:MPMovieSourceTypeStreaming];
    _quality = quality;
    if (videoId) self.videoId = videoId;
    
    return self;
}

- (void)setVideoId:(nonnull NSString *)videoId{
    
    if ([videoId isEqualToString:self.videoId]) {
        return;
    }
    
    if (self.video) {
        [self.moviePlayer stop];
    }
    
    _videoId = [videoId copy];
    [[MRYoutubeConnection shared] getVideoInformation:videoId completionHandler:^(MRYouTubeVideo *video, NSError *error) {
        if (!error) {
            if (video) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.video = video;
                    self.moviePlayer.contentURL = [self.video getVideoWithQuality:self.quality].url;
                    [self.moviePlayer prepareToPlay];
                });
            }
        }
    }];
}

@end

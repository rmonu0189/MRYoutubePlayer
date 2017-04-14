//
//  MRInlinePlayer.m
//  YoutubePlayerDemo
//
//  Created by Monu Rathor on 14/04/17.
//  Copyright © 2017 Monu. All rights reserved.
//

#import "MRInlinePlayer.h"
#import <MediaPlayer/MediaPlayer.h>
#import "MRYoutubeConnection.h"

@interface MRInlinePlayer ()

@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;

@property (nonatomic, strong) MRYouTubeVideo *video;

@property (nonatomic, assign) MRYouTubeVideoQuality quality;

@property (nonatomic, copy, nonnull) NSString *videoId;

@end

@implementation MRInlinePlayer

- (instancetype)initWithFrame:(CGRect)frame Quality:(MRYouTubeVideoQuality)quality{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.quality = quality;
        [self addPlayerView];
    }
    
    return self;
}

- (void)addPlayerView{
    
    if (!self.moviePlayer){
        self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:nil];
        self.moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
        self.moviePlayer.view.frame = self.bounds;
        self.moviePlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.moviePlayer.shouldAutoplay = YES;
        [self.moviePlayer setMovieSourceType:MPMovieSourceTypeStreaming];
        [self addSubview:self.moviePlayer.view];
    }
}

- (void)setVideoId:(nonnull NSString *)videoId Quality:(MRYouTubeVideoQuality)quality{
    self.quality = quality;
    self.videoId = videoId;
}

- (void)setVideoId:(nonnull NSString *)videoId{
    
    if ([videoId isEqualToString:self.videoId]) {
        return;
    }
    
    [self addPlayerView];
    
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

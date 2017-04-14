//
//  MRInlinePlayer.h
//  YoutubePlayerDemo
//
//  Created by Monu Rathor on 14/04/17.
//  Copyright © 2017 Monu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MRPlayerViewController.h"

@interface MRInlinePlayer : UIView

- (nonnull instancetype)initWithFrame:(CGRect)frame Quality:(MRYouTubeVideoQuality)quality;

- (void)setVideoId:(nonnull NSString *)videoId;

- (void)setVideoId:(nonnull NSString *)videoId Quality:(MRYouTubeVideoQuality)quality;

@end

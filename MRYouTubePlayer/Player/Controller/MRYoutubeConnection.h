//
//  MRYoutubeConnection.h
//  YoutubePlayerDemo
//
//  Created by Monu Rathor on 11/04/17.
//  Copyright © 2017 Monu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRYoutubeVideo.h"

@interface MRYoutubeConnection : NSObject

+ (instancetype)shared;

- (void)getVideoInformation:(NSString *)videoId completionHandler:(void (^)(MRYouTubeVideo *video, NSError *error))completionHandler;

@end

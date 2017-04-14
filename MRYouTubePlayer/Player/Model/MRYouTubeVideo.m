//
//  MRYoutubeVideo.m
//  YoutubePlayerDemo
//
//  Created by Monu Rathor on 11/04/17.
//  Copyright © 2017 Monu. All rights reserved.
//

#import "MRYoutubeVideo.h"

@interface MRYouTubeVideo ()

@property (nonatomic, readwrite, nonnull) NSString *videoId;

@property (nonatomic, readwrite, nonnull) NSString *title;

@property (nonatomic, readwrite) NSTimeInterval duration;

@property (nonatomic, readwrite, nullable) NSURL *smallThumbnailURL;

@property (nonatomic, readwrite, nullable) NSURL *mediumThumbnailURL;

@property (nonatomic, readwrite, nullable) NSURL *largeThumbnailURL;

@property (nonatomic, strong) MRVideoType *smallVideo;

@property (nonatomic, strong) MRVideoType *mediunVideo;

@property (nonatomic, strong) MRVideoType *largeVideo;

@end

@implementation MRYouTubeVideo

- (nullable instancetype)initWithVideoId:(nonnull NSString *)videoId Dictionary:(nonnull NSDictionary *)videoDictionary{
    
    self = [super init];
    
    if (self) {
        
        _videoId = videoId;
        _title = videoDictionary[@"title"] ?: @"";
        _duration = [videoDictionary[@"length_seconds"] doubleValue];
        
        NSString *smallThumbnail = videoDictionary[@"thumbnail_url"] ?: videoDictionary[@"iurl"];
        NSString *mediumThumbnail = videoDictionary[@"iurlsd"] ?: videoDictionary[@"iurlhq"] ?: videoDictionary[@"iurlmq"];
        NSString *largeThumbnail = videoDictionary[@"iurlmaxres"];
        
        _smallThumbnailURL = [MRYoutubeUtility getURLFromString:smallThumbnail];
        _mediumThumbnailURL = [MRYoutubeUtility getURLFromString:mediumThumbnail];
        _largeThumbnailURL = [MRYoutubeUtility getURLFromString:largeThumbnail];
        
        NSString *streamMap = videoDictionary[@"url_encoded_fmt_stream_map"];
        NSString *httpLiveStream = videoDictionary[@"hlsvp"];
        NSString *adaptiveFormats = videoDictionary[@"adaptive_fmts"];
        
        if (streamMap.length > 0 || httpLiveStream.length > 0){
            NSMutableArray *streamQueries = [[streamMap componentsSeparatedByString:@","] mutableCopy];
            [streamQueries addObjectsFromArray:[adaptiveFormats componentsSeparatedByString:@","]];
            
            NSMutableDictionary *streamURLs = [NSMutableDictionary new];
            
            if (httpLiveStream) streamURLs[@"HTTPLiveStreaming"] = [NSURL URLWithString:httpLiveStream];
            
            for (NSString *streamQuery in streamQueries)
            {
                NSDictionary *stream = [MRYoutubeUtility dictionaryFromString:streamQuery];
                MRVideoType *video = [[MRVideoType alloc] initWithDictionary:stream];
                if (video.itag == 22) {
                    _largeVideo = video;
                }
                else if (video.itag == 18) {
                    _mediunVideo = video;
                }
                else if (video.itag == 36) {
                    _smallVideo = video;
                }
            }
        }
        
    }
    
    return self;
}

- (MRVideoType *)getVideoWithQuality:(MRYouTubeVideoQuality)quality{
    if (quality == MRYouTubeVideoQualityHD720) {
        return self.largeVideo;
    }
    else if(quality == MRYouTubeVideoQualityMedium360){
        return self.mediunVideo;
    }
    else{
        return self.smallVideo;
    }
}

@end

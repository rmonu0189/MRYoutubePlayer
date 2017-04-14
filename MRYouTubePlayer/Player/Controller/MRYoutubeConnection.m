//
//  MRYoutubeConnection.m
//  YoutubePlayerDemo
//
//  Created by Monu Rathor on 11/04/17.
//  Copyright © 2017 Monu. All rights reserved.
//

#import "MRYoutubeConnection.h"
#import "MRYoutubeUtility.h"

@interface MRYoutubeConnection ()

@property (atomic, readonly) NSURLSession *session;

@property (atomic, strong) NSURLSessionDataTask *dataTask;

@end

@implementation MRYoutubeConnection

+ (instancetype)shared
{
    static MRYoutubeConnection *sharedClient;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedClient = [self new];
    });
    return sharedClient;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    }
    return self;
}

- (void)getVideoInformation:(NSString *)videoId completionHandler:(void (^)(MRYouTubeVideo *video, NSError *error))completionHandler{
    self.dataTask = [self.session dataTaskWithRequest:[self getRequestWithVideoId:videoId] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completionHandler(nil, error);
        }
        else{
            [self handleWithData:data Response:response VideoId:videoId completionHandler:completionHandler];
        }
    }];
    [self.dataTask resume];
}

- (void)handleWithData:(NSData *)data Response:(NSURLResponse *)response VideoId:(NSString *)videoId completionHandler:(void (^)(MRYouTubeVideo *video, NSError *error))completionHandler{
    CFStringEncoding encoding = CFStringConvertIANACharSetNameToEncoding((__bridge CFStringRef)response.textEncodingName ?: CFSTR(""));
    NSString *responseString = CFBridgingRelease(CFStringCreateWithBytes(kCFAllocatorDefault, data.bytes, (CFIndex)data.length, encoding != kCFStringEncodingInvalidId ? encoding : kCFStringEncodingMacRoman, false)) ?: @"";
    MRYouTubeVideo *video = [[MRYouTubeVideo alloc] initWithVideoId:videoId Dictionary:[MRYoutubeUtility dictionaryFromString:responseString]];
    completionHandler(video, nil);
}

- (NSURLRequest *)getRequestWithVideoId:(NSString *)videoId{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[@"https://www.youtube.com/get_video_info?el=embedded&hl=en&ps=default&video_id=" stringByAppendingString:videoId]] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [request setValue:@"en" forHTTPHeaderField:@"Accept-Language"];
    return request;
}

@end

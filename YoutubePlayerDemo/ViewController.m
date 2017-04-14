//
//  ViewController.m
//  YoutubePlayerDemo
//
//  Created by Monu Rathor on 11/04/17.
//  Copyright © 2017 Monu. All rights reserved.
//

#import "ViewController.h"
#import <MRYouTubePlayer/MRPlayerViewController.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickedPlayVideo:(id)sender {
    MRPlayerViewController *player = [[MRPlayerViewController alloc] initWithYouTubeVideoId:@"yfGqwHVjWwc" Quality:MRYouTubeVideoQualityHD720];
    [self presentMoviePlayerViewControllerAnimated:player];
}

@end

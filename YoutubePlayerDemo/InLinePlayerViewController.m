//
//  InLinePlayerViewController.m
//  YoutubePlayerDemo
//
//  Created by Monu Rathor on 14/04/17.
//  Copyright © 2017 Monu. All rights reserved.
//

#import "InLinePlayerViewController.h"
#import <MRYouTubePlayer/MRInlinePlayer.h>

@interface InLinePlayerViewController ()

@property (weak, nonatomic) IBOutlet MRInlinePlayer *player;

@end

@implementation InLinePlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.player setVideoId:@"yfGqwHVjWwc" Quality:MRYouTubeVideoQualityMedium360];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

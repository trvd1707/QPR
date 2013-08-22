//
//  QPRIntroViewController.m
//  QPR
//
//  Created by Teresa Van Dusen on 8/19/13.
//  Copyright (c) 2013 QPR Institute. All rights reserved.
//

#import "QPRIntroViewController.h"

@interface QPRIntroViewController ()

@end

@implementation QPRIntroViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //Load video from URL to web view
    [self.videoView setMediaPlaybackRequiresUserAction:NO];
    self.videoView.allowsInlineMediaPlayback = YES;
    self.played = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated {
    if (!self.hasPlayed) {
        [self setupVideoPlayer:@"7AZLFXVzlt4"];
        self.played = YES;
    } else {
        //show other tabs and how to continue
    }
}

#pragma mark UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
        NSLog(@"Playing Video");

}

#pragma mark Play video function

- (void) setupVideoPlayer: (NSString*) youtubeVideoId {
    [self.videoView stopLoading];
    
    NSError *error = nil;
    
    //Prepare the HTML from the template
    NSString *template = [NSString stringWithContentsOfFile:
                          [[NSBundle mainBundle]
                           pathForResource:@"YouTubeTemplate" ofType:@"html"]
                                                   encoding:NSUTF8StringEncoding
                                                      error:&error];
    NSString *htmlStr = [NSString stringWithFormat: template,
                         self.videoView.frame.size.width, self.videoView.frame.size.height,
                         self.videoView.frame.size.width, self.videoView.frame.size.height,
                         youtubeVideoId];
    
    //Write the HTML file to disk
    NSString *tmpDir = NSTemporaryDirectory();
    NSString *tmpFile = [tmpDir
                         stringByAppendingPathComponent: @"video.html"];
    [htmlStr writeToFile: tmpFile atomically:TRUE
                encoding: NSUTF8StringEncoding error:NULL];
    //Enable autoplay
    self.videoView.mediaPlaybackRequiresUserAction = NO;
    
    //Load the HTML
    [self.videoView loadRequest:[NSURLRequest requestWithURL:
                               [NSURL fileURLWithPath:tmpFile isDirectory:NO]]];
    //Autoplay doesn't work with loadHTMLString
    //[self.webView loadHTMLString:htmlStr baseURL:nil];
}


@end

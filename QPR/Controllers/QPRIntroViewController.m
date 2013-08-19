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
    [self.videoView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"introVideoiFrame" ofType:@"html"] isDirectory:NO]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
        NSLog(@"Playing Video");

}


@end

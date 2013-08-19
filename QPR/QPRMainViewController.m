//
//  QPRMainViewController.m
//  QPR
//
//  Created by Teresa Van Dusen on 8/12/13.
//  Copyright (c) 2013 QPR Institute. All rights reserved.
//

#import "QPRMainViewController.h"

@interface QPRMainViewController ()

@end

@implementation QPRMainViewController

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
    //first time enable only the video. after video is played, enable other tabs
    for(int i=1; i< self.viewControllers.count; i++){
        UIViewController * vc= [self.viewControllers objectAtIndex:i];
        vc.view.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  QPRIntroViewController.h
//  QPR
//
//  Created by Teresa Van Dusen on 8/19/13.
//  Copyright (c) 2013 QPR Institute. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QPRIntroViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *videoView;

@end

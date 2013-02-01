//
//  SplashViewController.h
//  Umundo
//  @description - Handles the Showing of the splash screen
//
//  Created by Y Kamesh Rao on 26/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SplashViewController : UIViewController
{
	NSTimer *splashTimer;
}

- (void)createHomeTabBar;
- (void)startApp;
- (void)timeout;

@end

//
//  MyNewsAppDelegate.h
//  MyNews
//
//  Created by ANKUR AGARWAL on 17/11/08.
//  Copyright UMUNDO INC 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Application.h"

@interface MyNewsAppDelegate : NSObject <UIApplicationDelegate>
{
    IBOutlet UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end


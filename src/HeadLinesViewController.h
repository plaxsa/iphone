//
//  HeadLinesViewController.h
//  MyNews
// @Description - To show the top news on the screen, get by top news channel
//  Created by ANKUR AGARWAL on 17/11/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppProtocols.h"
#import "Items.h"


@interface HeadLinesViewController : UIViewController <UIWebViewDelegate>
{
	UIWebView		*headlineWebViewFooter;
	BOOL			isCliked;
}
- (void)getTopNews;

@end

//
//  AdsWebPageViewController.h
//  MyNews
//  @Description -  To dispaly On click google ads on the scren
//  Created by ANKUR AGARWAL on 29/12/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdsWebPageViewController : UIViewController<UIWebViewDelegate>
{
	UIWebView	*myWebView;
	NSURLRequest *urlRequest;
}
- (IBAction)backButtonTouched;
- (void)setWebURL:(NSURLRequest *)URL;
@end





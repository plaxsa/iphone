//
//  GalleryViewController.h
//  MyNews
// @Description - To dispaly Videos and Slide Shows in the screen
//  Created by ANKUR AGARWAL on 19/12/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GalleryViewController : UIViewController<UIWebViewDelegate>
{
	UIWebView		*galleryWebViewFooter;
	BOOL isClicked;
}
- (void)getGalleryNews;
- (void)loadAdsrequest;
@end

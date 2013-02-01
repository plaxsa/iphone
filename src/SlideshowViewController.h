//
//  SlideshowViewController.h
//  MyNews
//  @Description -  Class to play and handle the slide show 
//  Created by ANKUR AGARWAL on 23/12/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIEvent.h>
#import "Items.h"

@interface SlideshowViewController : UIViewController <UIScrollViewDelegate,UIWebViewDelegate>
{
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIPageControl *pageControl;
	IBOutlet UITextView *txtDescription;

	IBOutlet UIToolbar *toolBar;
	IBOutlet UIBarButtonItem *toolGallery;
	IBOutlet UIBarButtonItem *preToolButton;
	IBOutlet UIBarButtonItem *nextToolButton;
	int chaneToAutoPageNumber;
	NSTimer *timerRedraw;
	IBOutlet UILabel *lblTitle;
    NSMutableArray *viewControllers;
    // To be used when scrolls originate from the UIPageControl
    BOOL pageControlUsed;
	int count;
	SmallItemInfo **slideItemInfoInPlayer;
	UIWebView *myAdsViewNews;
	IBOutlet UIBarButtonItem *barPageControl;
	BOOL	isAdsLoaded;
	BOOL isClicked;
	BOOL	isSlidePaused;
	BOOL	isEnlargeButtonTouched;
}


- (void)saveAction:(id)sender;
- (IBAction)enlargeImageButtonTouched;
- (IBAction)leftButtonTouched;
- (IBAction)rightButtonTouched;
- (void)AutoChangePages:(int)page;
- (IBAction)PlayButtonTouched;
- (IBAction)slideBackButtonTouched;
- (IBAction)changePage:(id)sender;
- (void)loadScrollViewWithPage:(int)page;
- (void)scrollViewDidScroll:(UIScrollView *)sender;
- (void)setItemInfoForImages:(SmallItemInfo**)iteminfo;
- (void)setItemInfoCount:(int)data;

@end

//
//  SlideshowViewController.m
//  MyNews
//  @Description -  Class to play and handle the slide show 
//  Created by ANKUR AGARWAL on 23/12/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import "SlideshowViewController.h"
#import "SlideImageDispalyViewController.h"
#import "General.h"
#import "ViewManager.h"

@implementation SlideshowViewController


// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
	{
        // Custom initialization
    }
    return self;
}


// load the scroll view with number of pages which is to display
- (void)loadScrollViewWithPage:(int)page
{
    if (page < 0) return;
    if (page >= count) return;
	
    // replace the placeholder if necessary
    SlideImageDispalyViewController *controller = [viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null]) 
	{
        controller = [[SlideImageDispalyViewController alloc] initWithPageNumber:page];
		[controller setEncURL:slideItemInfoInPlayer[page]->enclosureUrl];
        [viewControllers replaceObjectAtIndex:page withObject:controller];
        [controller release];
    }
	
	// set the description text value
//	txtDescription.isEditable = NO;
	txtDescription.text = slideItemInfoInPlayer[pageControl.currentPage]->description;
	txtDescription.font = [UIFont fontWithName:@"Arial" size:15.0];
	
	// Set the text for title
	lblTitle.text = slideItemInfoInPlayer[pageControl.currentPage]->title;
	lblTitle.font = [UIFont boldSystemFontOfSize:18.0];
		
	if ( isAdsLoaded == NO)
	{
	// Display the ads image at the bottom of the screen
		CGRect screen = [[UIScreen mainScreen] bounds];
		CGRect Adsframe = CGRectMake(0.0,380, screen.size.width,35);
		if(myAdsViewNews)
		{
			[myAdsViewNews removeFromSuperview];
			RELEASEIF(myAdsViewNews);
		}
		myAdsViewNews = [[UIWebView alloc] initWithFrame:Adsframe];
		myAdsViewNews.backgroundColor = [UIColor darkGrayColor];
		myAdsViewNews.scalesPageToFit = NO;
		myAdsViewNews.delegate = self;
		myAdsViewNews.autoresizingMask = (UIViewAutoresizingNone | UIViewAutoresizingNone);
		[myAdsViewNews loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: GoogleBootom]]];
		[self.view addSubview:myAdsViewNews];
		isAdsLoaded = YES;
		isClicked = NO;
	}
	
    // add the controller's view to the scroll view
    if (nil == controller.view.superview) 
	{
        CGRect frame = scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [scrollView addSubview:controller.view];
    }
	
	// To display page number at the bottom of the screen
	NSMutableString *txtPageCount = [[NSMutableString alloc]init];
	[txtPageCount appendString:[NSString stringWithFormat:@"%d", pageControl.currentPage + 1]];
	[txtPageCount appendString:@" of"];
	[txtPageCount appendString:[NSString stringWithFormat:@" %d", count]];
	barPageControl.title = txtPageCount;
	[txtPageCount release];
	
}



// @Description - Delegate Method of UIWebView Class
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	switch ( navigationType )
	{
			// called when user click on the ads link
		case UIWebViewNavigationTypeLinkClicked:
		{		
			if ( isClicked == NO )
			{
				// set timer stop and play mode pause before sent to the ads image to display
				isAdsLoaded = NO;
				isClicked = YES;
				scrollView.userInteractionEnabled = YES;
				toolBar.hidden = NO;
				// Stop the timer
				if(timerRedraw)
				{
					if ([timerRedraw isValid])
					{
						[timerRedraw invalidate];
						timerRedraw = nil;
					}
				}
				// make dragging enabled for user
				isSlidePaused = NO;
				pageControlUsed = NO;
				
			// set the url to be load in web page
			[(AdsWebPageViewController *)[[ViewManager viewManager] viewController:ADS_WEB_VIEW] setWebURL:request];
			
			// Shows the webpage to view ads
			[self presentModalViewController:[[ViewManager viewManager] viewController:ADS_WEB_VIEW] animated:YES];
			
			return YES;
			}
			else
				return NO;
		}
			break;
	}
	return YES;
}



// called when scrolled by page control
- (void)scrollViewDidScroll:(UIScrollView *)sender 
{
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    if (pageControlUsed)
	{
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
	
    // A possible optimization would be to unload the views+controllers which are no longer visible
}




// when user start to drag on the page
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
	if ( isSlidePaused == YES )
	{
		// stop the timer when pause the animation
		if(timerRedraw)
		{
			if ([timerRedraw isValid])
			{
				[timerRedraw invalidate];
				timerRedraw = nil;
			}
		}
		isSlidePaused = NO;
		// make dragging enabled for user
		//toolGallery.title = @"Play";
	}
	
	pageControlUsed = NO;
}




// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}



//To get the item info for image url 
- (void)setItemInfoForImages:(SmallItemInfo**)iteminfo
{
	isAdsLoaded = NO;
	slideItemInfoInPlayer = iteminfo;
}


// When page changed then this method called
- (IBAction)changePage:(id)sender
{
    int page = pageControl.currentPage;
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    // update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    // Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}



// When play or paused button toucheds
- (IBAction)PlayButtonTouched
{
	// If already in a play mode the pause and stop the timer
	if ( isSlidePaused == YES )
	{
		// stop the timer when pause the animation
		if(timerRedraw)
		{
			if ([timerRedraw isValid])
			{
				[timerRedraw invalidate];
				timerRedraw = nil;
			}
		}
		isSlidePaused = NO;
		// make dragging enabled for user
		scrollView.scrollEnabled = YES;
		pageControlUsed = NO;
	}
	else
	{
		scrollView.userInteractionEnabled = NO;
		toolBar.hidden = YES;
		isSlidePaused = YES;
		// if play mode is selected the user dragging will be stop, until pause the playing show
		pageControlUsed = YES;
		chaneToAutoPageNumber = pageControl.currentPage + 1;
		timerRedraw = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
	}
	
}



// left button touched event handling , show the previous page if exist
- (IBAction)leftButtonTouched
{
	if ( isSlidePaused == NO )
	{
		int page = pageControl.currentPage;
		if (page <= 0) return;
		if (page >= count) return;
			pageControl.currentPage = page - 1;
			[self AutoChangePages:page - 1];
			
	}
	else
	{
		// stop the timer when pause the animation
		if(timerRedraw)
		{
			if ([timerRedraw isValid])
			{
				[timerRedraw invalidate];
				timerRedraw = nil;
			}
		}
		// make dragging enabled for user
		isSlidePaused = NO;
		pageControlUsed = NO;
		int page = pageControl.currentPage;
		if (page <= 0) return;
		if (page >= count) return;
		pageControl.currentPage = page - 1;
		[self AutoChangePages:page - 1];
	}
	
}



// Right button touched event handling, show the next page if available
- (IBAction)rightButtonTouched
{
	if ( isSlidePaused == NO )
	{
		int page = pageControl.currentPage;
		if (page < 0) return;
		if (page >= count) return;
			pageControl.currentPage = page+1;
			[self AutoChangePages:page + 1];
	}
	else
	{
		// stop the timer when pause the animation
		if(timerRedraw)
		{
			if ([timerRedraw isValid])
			{
				[timerRedraw invalidate];
				timerRedraw = nil;
			}
		}
		// make dragging enabled for user
		isSlidePaused = NO;
		pageControlUsed = NO;
		
		int page = pageControl.currentPage;
		if (page < 0) return;
		if (page >= count) return;
		pageControl.currentPage = page+1;
		[self AutoChangePages:page + 1];
	}
}



// To play the slide automatically
- (void)AutoChangePages:(int)page
{
	// This code to disable the prev button when start page, and next disable when at the end
//	if (page <= 0) 
//	{
//		preToolButton.enabled = NO;
//	}
//	else
//	{
//		preToolButton.enabled = YES;
//	}
//    if (page >= count-1)
//	{
//		nextToolButton.enabled = NO;
//	}
//	else
//	{
//		nextToolButton.enabled = YES;
//	}
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    // update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    // Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}



// Call on timer every time to paly the slide slow automatically
-(void) onTimer
{
		// when all the slides end, send to 1st slide and stop timer
		if (chaneToAutoPageNumber >= count)
		{
			// to send back when slides end
			if(timerRedraw)
			{
				if ([timerRedraw isValid])
				{
					[timerRedraw invalidate];
					timerRedraw = nil;
				}
			}
			
			scrollView.userInteractionEnabled = YES;
			toolBar.hidden = NO;
			
			isSlidePaused = NO;
			pageControl.currentPage = 0;
			[self AutoChangePages: 0];
			pageControlUsed = NO;
		}
		else
		{
			id arrObj = [viewControllers objectAtIndex:chaneToAutoPageNumber];
			BOOL img = [arrObj getIsimageDone];
			if ( img == YES)
			{
				pageControl.currentPage = chaneToAutoPageNumber;
				[self AutoChangePages:chaneToAutoPageNumber];
				chaneToAutoPageNumber = chaneToAutoPageNumber+1;
			}
		}
}


// Set the info which is to draw
- (void)setItemInfoCount:(int)data
{
	count = data;
}


// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad 
{
	// This is to set the previous button disabled at the start
		//preToolButton.enabled = NO;
	isEnlargeButtonTouched = NO;
	CGRect frame = self.view.frame;
	self.view.frame = frame;
	[txtDescription setText:@" "];
	lblTitle.text = @" ";
	[super viewDidLoad];
	[self viewWillAppear:YES];
}



// call every time when view will be appear
- (void)viewWillAppear:(BOOL)animated
{
	if (isEnlargeButtonTouched == NO && isClicked == NO)
	{
		// view controllers are created lazily
		// in the meantime, load the array with placeholders which will be replaced on demand
		viewControllers = [[NSMutableArray alloc] init];
		for (unsigned i = 0; i < count; i++)
		{
			[viewControllers addObject:[NSNull null]];
		}
		
		// a page is the width of the scroll view
		scrollView.pagingEnabled = YES;
		scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * count, scrollView.frame.size.height);
		scrollView.showsHorizontalScrollIndicator = NO;
		scrollView.showsVerticalScrollIndicator = NO;
		scrollView.scrollsToTop = NO;
		scrollView.delegate = self;
		 pageControl.currentPage = 0;
		pageControl.numberOfPages = count;
		
		scrollView.scrollEnabled = YES;
		pageControlUsed = NO;
		
		scrollView.userInteractionEnabled = NO;
		toolBar.hidden = YES;
		// pages are created on demand
		// load the visible page
		// load the page on either side to avoid flashes when the user starts scrolling
		[self loadScrollViewWithPage:0];
		[self loadScrollViewWithPage:1];
		
		// To make Default option as 'play'
		if ( isSlidePaused == NO )
		{
			isSlidePaused = NO;
			[self PlayButtonTouched];
		}
	}
	isEnlargeButtonTouched = NO;
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	scrollView.userInteractionEnabled = YES;
	toolBar.hidden = NO;
	
	if(timerRedraw)
	{
		if ([timerRedraw isValid])
		{
			[timerRedraw invalidate];
			timerRedraw = nil;
		}
	}
	// make dragging enabled for user
	isSlidePaused = NO;
	pageControlUsed = NO;
}


- (void)saveAction:(id)sender
{
}

// @Description - Method to enlarge the image
- (IBAction)enlargeImageButtonTouched
{
	id arrObj = [viewControllers objectAtIndex:pageControl.currentPage];
	BOOL imgDone = [arrObj getIsimageDone];
	
	if ( imgDone == YES )
	{
		if(timerRedraw)
		{
			if ([timerRedraw isValid])
			{
				[timerRedraw invalidate];
				timerRedraw = nil;
			}
		}
		// make dragging enabled for user
		isSlidePaused = NO;
		pageControlUsed = NO;
		
		scrollView.userInteractionEnabled = YES;
		toolBar.hidden = NO;
		
		id arrObj = [viewControllers objectAtIndex:pageControl.currentPage];
		UIImage *img = [arrObj getImageData];
		[(EnlargeImageViewController *)[[ViewManager viewManager] viewController:ENLARGE_VIEW] setImageView:img];	
		
		// Shows the Image
		[(SlideshowViewController *)[[ViewManager viewManager] viewController: SLIDE_SHOW_VIEW] presentModalViewController:[[ViewManager viewManager] viewController:ENLARGE_VIEW] animated:NO];
		
		isEnlargeButtonTouched = YES;
	}
}




// when back button clicked
- (IBAction)slideBackButtonTouched
{
	// cancle the timer if started
	if ( isSlidePaused == YES)
	{
		if(timerRedraw)
		{
			if ([timerRedraw isValid])
			{
				[timerRedraw invalidate];
			}
		}
		
		isSlidePaused = NO;
	}
	RELEASEIF(myAdsViewNews);
	int page = pageControl.currentPage;
	if ( page > 0)
	{
		pageControl.currentPage = 0;
		[self AutoChangePages:0];
	}
	// delete all the previous added views
	int i;
	for(i = 0; i< count ;i++)
	{
		[viewControllers removeLastObject];
	}
	[viewControllers removeAllObjects];
	isEnlargeButtonTouched = NO;
	[self dismissModalViewControllerAnimated: NO];	
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


// free all the memory
- (void)dealloc 
{
	RELEASEIF(myAdsViewNews);
    [super dealloc];
}


@end

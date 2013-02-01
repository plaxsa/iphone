//
//  NewsDetailViewController.m
//  Umundo
//	@description - Majorly aimed at displaying the Images and there description and title as a news from the Umundo System
//
//  Created by Y Kamesh Rao on 16/09/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "CommonUtils.h"
#import "Application.h"
#import "General.h"
#import "HttpCommunicator.h"
#import "ViewManager.h"

@implementation NewsDetailViewController


// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
	{
        // Custom initialization
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad 
{
	CGRect frame = self.view.frame;
	self.view.frame = frame;
    [super viewDidLoad];
}


// When view appear on the device 
- (void)viewDidAppear:(BOOL)animated 
{
	if (currPagecount <= 0) 
	{
		preToolButton.enabled = NO;
	}
	else
	{
		preToolButton.enabled = YES;
	}
    if (currPagecount >= totalPageCount-1)
	{
		nextToolButton.enabled = NO;
	}
	else
	{
		nextToolButton.enabled = YES;
	}
	// @description - Try to call image using WebView
	[self callThePagesHandle];
    [super viewDidAppear:animated];
}



// set the ItemInfo struct data
- (void)getIteminfodata:(ItemInfo **)info
{
	isAdsImageLoaded = NO;
	dataItemInfo = info;
}


// set the updateItemInfo struct data
- (void)getUpdateIteminfodata:(UpdatedItemInfo **)info
{
	isAdsImageLoaded = NO;
	daatUpdateItemInfo = info;
}


// iset the current item count
- (void)currentItemCount:(int)count
{
	currPagecount = count;
}


// set the total number of items in the table
- (void)totalItemCount:(int)count
{
	totalPageCount = count;
}


// set is come from my news tab or from other tab
- (void)setIsComefromMyNews:(BOOL)val
{
	isComefromMyNews = val;
}


// Event handle when next page request called
- (IBAction)nextPageCalled
{

	if (currPagecount < 0) return;
    if (currPagecount >= (totalPageCount-1)) return;
	
	// If come to watch news from the Other then Update Class 
	if ( isComefromMyNews == NO)
	{
		currPagecount = currPagecount + 1;
		[self setUrlOfImageToBeDrawn:dataItemInfo[currPagecount]->enclosureUrl];
		[self setThumbUrlOfImageToBeDrawn:dataItemInfo[currPagecount]->thumbnailUrl];
		[self setImageTitle:dataItemInfo[currPagecount]->title];
		[self setDescription:dataItemInfo[currPagecount]->description];
		[self callThePagesHandle];
	}
	else
	{
		currPagecount = currPagecount + 1;
		[self setUrlOfImageToBeDrawn:daatUpdateItemInfo[currPagecount]->itemInfo->enclosureUrl];
		[self setThumbUrlOfImageToBeDrawn:daatUpdateItemInfo[currPagecount]->itemInfo->thumbnailUrl];
		[self setImageTitle:daatUpdateItemInfo[currPagecount]->itemInfo->title];
		[self setDescription:daatUpdateItemInfo[currPagecount]->itemInfo->description];
		[self callThePagesHandle];
	}
	
	if (currPagecount <= 0) 
	{
		preToolButton.enabled = NO;
	}
	else
	{
		preToolButton.enabled = YES;
	}
    if (currPagecount >= totalPageCount-1)
	{
		nextToolButton.enabled = NO;
	}
	else
	{
		nextToolButton.enabled = YES;
	}
	
}



// event handle when previous page reqest called
- (IBAction)prevPageCalled
{
	
	if (currPagecount > totalPageCount) return;
    if (currPagecount <= 0) return;
	
	// if comes from MyNews screen then else part called otherwise ItemInfo will work
	if ( isComefromMyNews == NO)
	{
		currPagecount = currPagecount - 1;
		[self setUrlOfImageToBeDrawn:dataItemInfo[currPagecount]->enclosureUrl];
		[self setThumbUrlOfImageToBeDrawn:dataItemInfo[currPagecount]->thumbnailUrl];
		[self setImageTitle:dataItemInfo[currPagecount]->title];
		[self setDescription:dataItemInfo[currPagecount]->description];
		[self callThePagesHandle];
	}
	else
	{
		currPagecount = currPagecount - 1;
		[self setUrlOfImageToBeDrawn:daatUpdateItemInfo[currPagecount]->itemInfo->enclosureUrl];
		[self setThumbUrlOfImageToBeDrawn:daatUpdateItemInfo[currPagecount]->itemInfo->thumbnailUrl];
		[self setImageTitle:daatUpdateItemInfo[currPagecount]->itemInfo->title];
		[self setDescription:daatUpdateItemInfo[currPagecount]->itemInfo->description];
		[self callThePagesHandle];
	}
	
	if (currPagecount <= 0) 
	{
		preToolButton.enabled = NO;
	}
	else
	{
		preToolButton.enabled = YES;
	}
    if (currPagecount >= totalPageCount-1)
	{
		nextToolButton.enabled = NO;
	}
	else
	{
		nextToolButton.enabled = YES;
	}	
	
}



// call the page to draw the news on the screen
- (void)callThePagesHandle
{
	isImageButtonClicked = NO;
	CGRect imgFrame = CGRectMake( 0, 0, 320.0,370.0);
	// set the web view to display the news
	if (isClicked == NO )
	{
		if ( isAdsImageLoaded == NO )
		{
			// Display the ads image at the bottom of the screen
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect Adsframe = CGRectMake(0.0,372, screen.size.width,45);
			if(myAdsViewNews)
			{
				RELEASEIF(myAdsViewNews);
			}
			myAdsViewNews = [[UIWebView alloc] initWithFrame:Adsframe];
			myAdsViewNews.backgroundColor = [UIColor darkGrayColor];
			myAdsViewNews.scalesPageToFit = NO;
			myAdsViewNews.delegate = self;
			myAdsViewNews.autoresizingMask = (UIViewAutoresizingNone | UIViewAutoresizingNone);
			[myAdsViewNews loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: GoogleBootom]]];
			[self.view addSubview:myAdsViewNews];
			isAdsImageLoaded = YES;
		}
	}
		
		if(myWebViewNews)
		{
			if ( myWebViewNews.isLoading)
				[myWebViewNews stopLoading];
			[myWebViewNews removeFromSuperview];
			RELEASEIF(myWebViewNews);
		}
		myWebViewNews = [[UIWebView alloc] initWithFrame:imgFrame];
		myWebViewNews.backgroundColor = [UIColor grayColor];
		myWebViewNews.scalesPageToFit = NO;
		myWebViewNews.delegate = self;
		myWebViewNews.autoresizingMask = (UIViewAutoresizingNone | UIViewAutoresizingNone);
		[myWebViewNews loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: urlOfImageToBeDrawn]]];
		
		// create html tag to open news in webview
		NSMutableString *imageHTML = [[[NSMutableString alloc] init] autorelease];
		[imageHTML appendString:@"<html><head></head><body><span style=\"height:45px;font-size:20px;\"><b>"];
		[imageHTML appendString:imageTitle];
		[imageHTML appendString:@"</span></b><br /><br /><span style=\"height:12px;font-size:10px;\"><b>Tap Image to enlarge </span></b><br /><br /<div style=\"float:left;width:110px;\"><a align=\"center\" href=\""];
		[imageHTML appendString:urlOfImageToBeDrawn];
		[imageHTML appendString:@"\"><img src=\'"];
		[imageHTML appendString:thumburlOfImageToBeDrawn];
		[imageHTML appendString:@"\' width ="];
		[imageHTML appendString:@"\"100\""];
		[imageHTML appendString:@"height="];
		[imageHTML appendString:@"\"100\""];
		[imageHTML appendString:@"></img></a></div>"];
		[imageHTML appendString:imageDescription];
		[imageHTML appendString:@"</body></html>"];
		[myWebViewNews loadHTMLString:imageHTML baseURL:nil];
		[self.view addSubview: myWebViewNews];	
			
		// To display page number at te bottom of the screen
		NSMutableString *txtPageCount = [[NSMutableString alloc]init];
		[txtPageCount appendString:[NSString stringWithFormat:@"%d", currPagecount + 1]];
		[txtPageCount appendString:@" of"];
		[txtPageCount appendString:[NSString stringWithFormat:@" %d", totalPageCount]];
		barPageControl.title = txtPageCount;
		[txtPageCount release];	
	
		isClicked = NO;
}



// @Description - Delegate Method of UIWebView Class
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	switch ( navigationType )
	{
			// called when user click on the ads link
		case UIWebViewNavigationTypeLinkClicked:
		{	
			if ( isClicked == NO)
			{
			isAdsImageLoaded = NO;
		
			// set the url to be load in web page
			[(AdsWebPageViewController *)[[ViewManager viewManager] viewController:ADS_WEB_VIEW] setWebURL:request];
			
			// Shows the webpage to view ads
			[self presentModalViewController:[[ViewManager viewManager] viewController:ADS_WEB_VIEW] animated:YES];
			
			isClicked = YES;
				
			return YES;
			}
			else
				return NO;
		}
			break;
	}
	return YES;
}



// when url to be start loading show animation
- (void)webViewDidStartLoad:(UIWebView *)webView
{
	// starting the load, show the activity indicator in the status bar
//	[UIApplication sharedApplication].isNetworkActivityIndicatorVisible = YES;
}


// when url to be stop loading dismiss animation
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	// finished loading, hide the activity indicator in the status bar
//	[UIApplication sharedApplication].isNetworkActivityIndicatorVisible = NO;
}


// @description - Back button touched here
- (IBAction)backToClips
{
	// If inlarge image screen is not opened then go to screen otherwise go to news detail screen
	if ( isImageButtonClicked == NO)
	{
		[self cancelHttpCommunications];
		// release all the allocated memory and view before get back from the view
		
		[myWebViewNews removeFromSuperview];
		if(myAdsViewNews)
		{
			RELEASEIF(myAdsViewNews);
		}
		
		[self dismissModalViewControllerAnimated: YES];
	}
	else
	{
		[self callThePagesHandle];
	}
}



// @description - set the image URL for get full image
- (void)setUrlOfImageToBeDrawn: (NSString *)url
{
	if (url)
	{
		RELEASEIF(urlOfImageToBeDrawn);
		urlOfImageToBeDrawn = [url copy];
	}

}


// @description - set the thumb URL for get full image thumb
- (void)setThumbUrlOfImageToBeDrawn: (NSString *)url
{
	if (url)
	{
		RELEASEIF(thumburlOfImageToBeDrawn);
			thumburlOfImageToBeDrawn = [url copy];
	}
	else
	{
		RELEASEIF(thumburlOfImageToBeDrawn);
		thumburlOfImageToBeDrawn = [urlOfImageToBeDrawn copy];
	}
}



// @description - To set the title of the item
- (void)setImageTitle: (NSString *)text
{
	if ( text )
	{
		RELEASEIF(imageTitle);
		imageTitle = text;
		[imageTitle retain];
		self.navigationItem.title = imageTitle;
	}
}


// @description - To set the description of the item
- (void)setDescription: (NSString *)text
{
	if ( text )
	{
		RELEASEIF(imageDescription);
		imageDescription = text;
		[imageDescription retain];
	}
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response  
{  
	// Initialise the mutable data object
	RELEASEIF(imageDataFromServer);
	imageDataFromServer = [[NSMutableData alloc] init];
}  



- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data  
{  
	[imageDataFromServer appendData:data];
}  



- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error  
{  
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[connection release];
	httpConnection = nil;
}  


// To recive the responsed data from the server
- (void)connectionDidFinishLoading:(NSURLConnection *)connection  
{  
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	// Load the new image
	RELEASEIF(image);
	image = [[UIImage alloc] initWithData: [NSData dataWithBytes:[imageDataFromServer mutableBytes] length:[imageDataFromServer length]]];
	
	// Load the image in the imageview
	RELEASEIF(imageView);
	imageView = [[UIImageView alloc] initWithImage: image];
	
	CGRect screen = [[UIScreen mainScreen] bounds];
	CGRect imgFrame = CGRectMake( 10, 10, screen.size.width - 20, screen.size.height - 100);
	imageView.frame = imgFrame;	
	
	// stop the animation
	[fetchingImage removeFromSuperview];
	[fetchingImage stopAnimating];
	RELEASEIF(fetchingImage);
	
	[self.view addSubview: imageView];
	
	// Release the imageDataFromServer
	RELEASEIF(imageDataFromServer);
	
	[connection release];
	httpConnection = nil;
	
	// Mark for redisplay
	[self.view setNeedsDisplay];	
}  



// Cancle all the on going http connection
- (void)cancelHttpCommunications
{
	if(httpConnection)
	{
		[httpConnection cancel];
	}
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


// Free all the allocated memory
- (void)dealloc 
{
	[self cancelHttpCommunications];
	if(myWebViewNews)
	{
		if ( myWebViewNews.isLoading)
			[myWebViewNews stopLoading];
		[myWebViewNews removeFromSuperview];
		[myWebViewNews release];
	}
	RELEASEIF(imageDescription);
	RELEASEIF(fetchingImage);
	RELEASEIF(urlOfImageToBeDrawn);
	RELEASEIF(image);
	RELEASEIF(imageTitle);
	RELEASEIF(imageDataFromServer);
	RELEASEIF(httpConnection);
	RELEASEIF(imageRequestor);
	RELEASEIF(imageView);
	RELEASEIF(textView);
	RELEASEIF(button);
    [super dealloc];
}


@end

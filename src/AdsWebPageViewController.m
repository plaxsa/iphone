//
//  AdsWebPageViewController.m
//  MyNews
//  @Description -  To dispaly On click google ads on the scren
//  Created by ANKUR AGARWAL on 29/12/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import "AdsWebPageViewController.h"
#import "General.h"

@implementation AdsWebPageViewController


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


// Whenever view appear the request for ads according to requested url
- (void)viewDidAppear:(BOOL)animated 
{
	//Set the web frame and requsetfor ads
//	[UIApplication sharedApplication].isNetworkActivityIndicatorVisible = YES;
	if(!myWebView)
	{
		CGRect frameWeb = CGRectMake( 0.0, 0.0, 320.0,380.0);
		myWebView = [[UIWebView alloc] initWithFrame:frameWeb];
		myWebView.backgroundColor = [UIColor darkGrayColor];
		myWebView.scalesPageToFit = NO;
		myWebView.delegate = self;
		myWebView.autoresizingMask = (UIViewAutoresizingNone | UIViewAutoresizingNone);
		myWebView.backgroundColor = [UIColor whiteColor];
		[myWebView loadRequest:[NSURLRequest requestWithURL:[urlRequest URL]]];
		[self.view addSubview: myWebView];
		[super viewDidAppear:animated];
	}
}



// Set the URL to view the ads
- (void)setWebURL:(NSURLRequest *)URL
{
	if(!urlRequest)
	{
		urlRequest = URL;
		[urlRequest retain];
	}
}



// When back button touched then reset all the value and get back to prev screen
- (IBAction)backButtonTouched
{
	if([myWebView superview])
	{
		if ( myWebView.isLoading)
			[myWebView stopLoading];
		[myWebView removeFromSuperview];
		RELEASEIF(myWebView);
	}
	RELEASEIF(urlRequest);
	
//	[UIApplication sharedApplication].isNetworkActivityIndicatorVisible = NO;
	[self dismissModalViewControllerAnimated: YES];
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


// when error occured
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	// load error, hide the activity indicator in the status bar
//	[UIApplication sharedApplication].isNetworkActivityIndicatorVisible = NO;

	// report the error inside the webview
	NSString* errorString = [NSString stringWithFormat:
							 @"<html><center><font size=+5 color='black'>My News:<br>%@</font></center></html>",
							 error.localizedDescription];
	[myWebView loadHTMLString:errorString baseURL:nil];
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


// Free all the memory
- (void)dealloc 
{
	if(myWebView)
	{
		if ( myWebView.isLoading)
			[myWebView stopLoading];
		[myWebView removeFromSuperview];
		[myWebView release];
	}
	if (urlRequest)
		[urlRequest release];
    [super dealloc];
}


@end

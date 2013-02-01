//
//  NewsDetailViewController.h
//  Umundo
//	@description - Majorly aimed at displaying the Images and there description and title as a news from the Umundo System
//
//  Created by Y Kamesh Rao on 16/09/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpCommunicator.h"
#import "Items.h"
#import "UpdatesViewController.h"

@interface NewsDetailViewController : UIViewController <UIScrollViewDelegate, UITextViewDelegate,UIWebViewDelegate>
{
	NSString *urlOfImageToBeDrawn;
	NSString *thumburlOfImageToBeDrawn;
	NSString *imageTitle;
	NSString *imageDescription;
	UIImage *image;
	UIImageView *imageView;
	UIActivityIndicatorView *fetchingImage;
	UITextView *textView;
	HttpCommunicator	*imageRequestor;
	NSMutableData		*imageDataFromServer;
	NSURLConnection		*httpConnection;
	UIButton *button;
	IBOutlet UILabel *lblTitle;
	IBOutlet UIBarButtonItem *preToolButton;
	IBOutlet UIBarButtonItem *nextToolButton;
	
	UIWebView *myWebViewNews;
	UIWebView *myAdsViewNews;
	
	BOOL isComefromMyNews;
	int currPagecount;
	int totalPageCount;
	ItemInfo **dataItemInfo;
	UpdatedItemInfo **daatUpdateItemInfo;
	BOOL	isImageButtonClicked;
	IBOutlet UIBarButtonItem *barPageControl;
	
	BOOL isAdsImageLoaded;
	BOOL isClicked;
}

- (void)setIsComefromMyNews:(BOOL)val;
- (IBAction)nextPageCalled;
- (IBAction)prevPageCalled;
- (void)callThePagesHandle;
- (void)getIteminfodata:(ItemInfo **)info;
- (void)getUpdateIteminfodata:(UpdatedItemInfo **)info;
- (void)currentItemCount:(int)count;
- (void)totalItemCount:(int)count;

- (void)setDescription: (NSString *)text;
- (void)setUrlOfImageToBeDrawn: (NSString *)url;
- (void)setThumbUrlOfImageToBeDrawn: (NSString *)url;
- (void)setImageTitle: (NSString *)text;
- (IBAction)backToClips;

- (void)connection:	(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;  
- (void)connection:	(NSURLConnection *)connection didReceiveData:(NSData *)data;  
- (void)connection:	(NSURLConnection *)connection didFailWithError:(NSError *)error;  
- (void)connectionDidFinishLoading:	(NSURLConnection *)connection; 
- (void)cancelHttpCommunications;

@end

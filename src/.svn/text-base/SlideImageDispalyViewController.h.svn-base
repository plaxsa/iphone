
/*
File: SlideImageDispalyViewController.h
@Description: A controller for a single page of content to show the image with the animation to dispaly
Created by ANKUR AGARWAL on 23/12/08.
Copyright 2008 UMUNDO INC. All rights reserved.
*/

#import <UIKit/UIKit.h>
#import "Items.h"
#import "HttpCommunicator.h"

@interface SlideImageDispalyViewController : UIViewController <UITextViewDelegate>
{
   // IBOutlet UILabel *pageNumberLabel;
    int pageNumber;
	NSString *description;
	NSString *title;
	NSString *encURL;
	
	BOOL isImageDone;
	UIActivityIndicatorView *fetchingImage;
	HttpCommunicator	*imageRequestor;
	NSMutableData		*imageDataFromServer;
	NSURLConnection		*httpConnection;
	UIImageView *imageView;
	UIImage *image;
	UITextView *textView;
}

- (UIImage*)getImageData;
- (id)initWithPageNumber:(int)page;
- (void)setEncURL:(NSString *)URL;
- (BOOL)getIsimageDone;
- (void)connection:	(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;  
- (void)connection:	(NSURLConnection *)connection didReceiveData:(NSData *)data;  
- (void)connection:	(NSURLConnection *)connection didFailWithError:(NSError *)error;  
- (void)connectionDidFinishLoading:	(NSURLConnection *)connection; 
- (void)cancelHttpCommunications;
- (void)makeImageRequest;
- (void)cancelHttpCommunications;
- (void)drawImageOnScreen;
@end

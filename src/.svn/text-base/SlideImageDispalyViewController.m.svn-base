/*
File: SlideImageDispalyViewController.m
@Description: A controller for a single page of content to show the image with the animation to dispaly
Created by ANKUR AGARWAL on 23/12/08.
 Copyright 2008 UMUNDO INC. All rights reserved.
*/



#import "SlideImageDispalyViewController.h"
#import "Application.h"
#import "General.h"

@implementation SlideImageDispalyViewController


// Load the view nib and initialize the pageNumber ivar.
- (id)initWithPageNumber:(int)page
{
    if (self = [super initWithNibName:XIB_MY_SLIDESHOW bundle:nil]) 
	{
        pageNumber = page;
    }
    return self;
}



// Set the label and background color when the view has finished loading.
- (void)viewDidLoad
{
	
    self.view.backgroundColor = [UIColor clearColor];
	[self makeImageRequest];
}



// set the enclosure url
- (void)setEncURL:(NSString *)URL
{
	[encURL release];
	encURL = URL;
	[encURL retain];	
}



// Make the request for Image to server
- (void)makeImageRequest
{
	isImageDone = NO;
	// Make request for enclouser url for image
	imageRequestor = [HttpCommunicator new];
	RELEASEIF(httpConnection);
	httpConnection = [imageRequestor sendAsyncRequestTo:encURL andDelegateTo:self];
	// start animation till get response
	RELEASEIF(imageRequestor);	
	if (fetchingImage)
	{
		[fetchingImage removeFromSuperview];
		[fetchingImage stopAnimating];
		RELEASEIF(fetchingImage);
	}
	[self.view clearsContextBeforeDrawing];
	self.view.backgroundColor = [UIColor whiteColor];
	
	fetchingImage = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhiteLarge];
	CGRect screen = [UIScreen mainScreen].applicationFrame;
	CGRect newFrame = CGRectMake(screen.size.width/2 - fetchingImage.frame.size.width/2, (screen.size.height/2 - fetchingImage.frame.size.height/2)-70, fetchingImage.frame.size.width, fetchingImage.frame.size.height);
	fetchingImage.frame = newFrame;
	[fetchingImage startAnimating];	
	[self.view addSubview:fetchingImage];
	[self.view setNeedsDisplay];
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

	// Release the imageDataFromServer
	RELEASEIF(imageDataFromServer);
	
	// stop the animation
	if (fetchingImage)
	{
		[fetchingImage removeFromSuperview];
		[fetchingImage stopAnimating];
		RELEASEIF(fetchingImage);
	}
	
	// free connection
	[connection release];
	httpConnection = nil;
	// Image scaling work to dispaly in slide show, scale in proper ratio of width and hight.
	RELEASEIF(imageView);
	imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:CROSSICON_IMAGE]];
	[self drawImageOnScreen];	
}  



// Recive the response from the server
- (void)connectionDidFinishLoading:(NSURLConnection *)connection  
{  
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	// Load the new image
	RELEASEIF(image);
	image = [[UIImage alloc] initWithData: [NSData dataWithBytes:[imageDataFromServer mutableBytes] length:[imageDataFromServer length]]];
	
	// Release the imageDataFromServer
	RELEASEIF(imageDataFromServer);
	
	// stop the animation
	if (fetchingImage)
	{
		[fetchingImage removeFromSuperview];
		[fetchingImage stopAnimating];
		RELEASEIF(fetchingImage);
	}
	
	// free connection
	[connection release];
	httpConnection = nil;
	// Image scaling work to dispaly in slide show, scale in proper ratio of width and hight.
	RELEASEIF(imageView);
	imageView = [[UIImageView alloc] initWithImage: image];
	[self drawImageOnScreen];
}  




// Method to draw the image on the screen after scalling of image
- (void)drawImageOnScreen
{
	CGRect frame = imageView.frame;
	CGSize framesize = frame.size;
	float availableScalingWidth = 300.0;
	float availableScalingHeight = 240.0;
	float scalingHeight;
	float scalingWidth;
	CGRect imgFrame;
	if(framesize.width > availableScalingWidth || framesize.height > availableScalingHeight)
	{
		// if width is grater
		if(framesize.width > framesize.height)
		{
			float widthHeightPercent = (framesize.width * 100) / framesize.height;
			scalingHeight = (availableScalingWidth * 100) / widthHeightPercent;
			scalingWidth = (scalingHeight * widthHeightPercent) / 100;
		}
		// if height is graters
		else if(framesize.height >= framesize.width)
		{
			float widthHeightPercent = (framesize.height * 100) / framesize.width;
			scalingWidth = (availableScalingHeight * 100) / widthHeightPercent;
			scalingHeight = (scalingWidth * widthHeightPercent) / 100;
		}
		float xPos = (availableScalingWidth - scalingWidth)/2;
		float yPos = (availableScalingHeight - scalingHeight)/2;
		imgFrame = CGRectMake(xPos+10, yPos, scalingWidth, scalingHeight);
	}
	else
	{
		float xPosition = (availableScalingWidth - framesize.width)/2;
		float yPosition = (availableScalingHeight - framesize.height)/2;
		imgFrame = CGRectMake( xPosition+10, yPosition, framesize.width, framesize.height);
	}
	imageView.frame = imgFrame;
	[self.view addSubview:imageView];
	isImageDone = YES;	
	
	// Mark for redisplay
	
	[self.view clearsContextBeforeDrawing];
	self.view.backgroundColor = [UIColor whiteColor];
	[self.view setNeedsDisplay];	
}



// Get the data image request work done or not
- (BOOL)getIsimageDone
{
	return isImageDone;
}


// Method to get the image data
- (UIImage*)getImageData
{
	return image;
}


// cancle ongoing http connection
- (void)cancelHttpCommunications
{
	if(httpConnection)
	{
		[httpConnection cancel];
		httpConnection = nil;
	}
}


// free all the allocated memoey
- (void)dealloc 
{
	// stop the animation
	if (fetchingImage)
	{
		[fetchingImage removeFromSuperview];
		[fetchingImage stopAnimating];
		RELEASEIF(fetchingImage);
	}
	RELEASEIF(image);
	// Release the imageDataFromServer
	RELEASEIF(imageDataFromServer);
	[self cancelHttpCommunications];
	[imageView removeFromSuperview];
	RELEASEIF(imageView);
	RELEASEIF(encURL);
	[title release];
	[encURL release];
    [super dealloc];
}

@end

//
//  EnlargeImageViewController.m
//  MyNews
//
//  Created by ANKUR AGARWAL on 15/01/09.
//  Copyright 2009 UMUNDO INC. All rights reserved.
//

#import "EnlargeImageViewController.h"
#import "General.h"
#import "CommonUtils.h"
#import "ViewManager.h"

@implementation EnlargeImageViewController


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
	isClassLoaded = YES;
	[super viewDidLoad];
	[self viewWillAppear:YES];
}



// Call when view will appear to display
- (void)viewWillAppear:(BOOL)animated
{
	if ( !imageView || isClassLoaded == YES)
	{
		isClassLoaded = NO;
		RELEASEIF(imageView);
		imageView = [[UIImageView alloc] initWithImage: image];
		imgFrameforImage = imageView.frame;
		[self drawImageOnScreen];
		scrollView.autoresizingMask = ( UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
		imageView.autoresizingMask = ( UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
		
		// next 2 line is for ,If we want to use zooming 
		scrollView.maximumZoomScale = 2;
		scrollView.minimumZoomScale = 1;
		
		scrollView.clipsToBounds = YES;
		scrollView.autoresizesSubviews = YES;
		[scrollView setScrollEnabled:NO];
		scrollView.delegate = self;
		[self.view setBackgroundColor:[UIColor whiteColor]];
	}
}




// Scalling of image in a expected ratio
- (void)drawImageOnScreen
{
	scrollView.frame = CGRectMake(0.0,0.0,320.0, 436.0);
	CGRect frame = imgFrameforImage;
	CGSize framesize = frame.size;
	float availableScalingWidth = scrollView.frame.size.width;
	float availableScalingHeight = scrollView.frame.size.height;
	float scalingHeight = 0.0;
	float scalingWidth = 0.0;
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
		imgFrame = CGRectMake(xPos, yPos, scalingWidth, scalingHeight);
	}
	else
	{
		float xPosition = (availableScalingWidth - framesize.width)/2;
		float yPosition = (availableScalingHeight - framesize.height)/2;
		imgFrame = CGRectMake( xPosition, yPosition, framesize.width, framesize.height);
	}
	imageView.frame = imgFrame;
	[scrollView addSubview:imageView];
}



// Scalling of image when in the left or rite orientation
- (void)drawImageOnScreenwhenOrientation
{
	CGRect frame = imgFrameforImage;
	CGSize framesize = frame.size;
	scrollView.frame = CGRectMake(0.0,0.0,460.0, 300.0);
	float availableScalingWidth = 460;
	float availableScalingHeight = 300;
	float scalingHeight = 0.0;
	float scalingWidth = 0.0;
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
		imgFrame = CGRectMake(xPos, yPos, scalingWidth, scalingHeight);
	}
	else
	{
		float xPosition = (availableScalingWidth - framesize.width)/2;
		float yPosition = (availableScalingHeight - framesize.height)/2;
		imgFrame = CGRectMake( xPosition, yPosition, framesize.width, framesize.height);
	}
	imageView.frame = imgFrame;
}





//@description -  return a view that will be scaled. if delegate returns nil, nothing happens 
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
	return imageView;
}


// End the zoom event
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale // scale between minimum and maximum. called after any 'bounce' animations
{
	[imageView setNeedsDisplay];
}


// @Description - Method to set the image pointer to display inlarge image
- (void)setImageView:(UIImage *)img
{
	RELEASEIF(image);
	image = img;
	[image retain];
}



// Back button to send to back screen
- (IBAction)backButton
{
	[scrollView setContentSize:imgFrameforImage.size];
	[scrollView setContentOffset:imgFrameforImage.origin];
	if(imageView)
	{
		[imageView removeFromSuperview];
		RELEASEIF(imageView);
	}
	
	[self.view clearsContextBeforeDrawing];
	self.view.backgroundColor = [UIColor blackColor];
	[self.view setNeedsDisplay];
	
	[self dismissModalViewControllerAnimated: NO];
}



// Set the orientation of the screen or view
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}



// A this point, our view orientation is set to the new orientation. 
- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation duration:(NSTimeInterval)duration
{
	if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait)
	{
		[self drawImageOnScreen];
	}
	else if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown)
	{
		[self drawImageOnScreen];
	}
	else if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight)
	{

		[self drawImageOnScreenwhenOrientation];
	}
	else if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft)
	{
		[self drawImageOnScreenwhenOrientation];
	}	
}



- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


// Free all the memory at the end
- (void)dealloc 
{
	if(imageView)
	{
		RELEASEIF(imageView);
	}
	RELEASEIF(image);
    [super dealloc];
}


@end

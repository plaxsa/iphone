//
//  CommonUtils.m
//  Umundo
//  @description - Imeplementation of the Common Utility methods
//
//  Created by Y Kamesh Rao on 27/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import "CommonUtils.h"


@implementation CommonUtils

static CommonUtils *commonUtils;

+ (CommonUtils *)commonUtils
{
	@synchronized(self)
	{
		if(!commonUtils)
			[[CommonUtils alloc] init];
		
		return commonUtils;
	}
	
	return nil;
}



+ (id)alloc
{
	@synchronized(self)
	{
		NSAssert(commonUtils == nil, @"Attempted to allocate a second instance of a singleton.");
		commonUtils = [super alloc];
		return commonUtils;
	}
	
	return nil;
}



- (id)init
{
	@synchronized(self)
	{
		if(![super init])
			return nil;

		return self;
	}
	
	return nil;
}




// @description - Draws an Image in the given rectangle area
- (void)drawImage: (UIImage *)image inRect: (CGRect)rect
{
	[image drawInRect: rect];	
}



// @description - Loads an image from the given path on the disk
- (UIImage *)loadImageFromPath: (NSString *)path
{
	UIImage *image;
	if (image)
	{
		[image release];
	}
	
	image = [ [ UIImage alloc ]	imageWithContentsOfFile: path];
	[image retain];
	
	return image;
}



// @description - Loads an image from the given url
- (UIImage *)loadImageFromURL: (NSString *)url
{
	UIImage *image = nil;
	
	image = [ [ UIImage alloc ]	initWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString:url] ] ];
	[image retain];
	
	return image;
}



// @description - Loads an image from the main bundle
- (UIImage *)loadImage: (NSString *)name
{
	UIImage *image = nil;
	
	image = [UIImage imageNamed: name];
	//[image retain];
	
	return image;
}



// @description - Loads an image from the given path on the disk and draws it in the given rect
- (void)loadImage: (UIImage *)image fromPath: (NSString *)path andDrawInRect: (CGRect)rect
{
	if (image)
	{
		[image release];
	}
	
	image = [ [ UIImage alloc ]	imageWithContentsOfFile: path];
	
	// Drawing the Image
	[image drawInRect:rect];
}



// @description - Loads an image from the given url and draws it in the given rect
- (void)loadImage: (UIImage *)image fromURL: (NSString *)url andDrawInRect: (CGRect)rect
{
	if (image)
	{
		[image release];
	}
	
	image = [ [ UIImage alloc ]	initWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString:url] ] ];
	
	// Drawing the Image
	[image drawInRect:rect];
}




// @description - Draws an animatation with the given set of images
- (UIView *)createMessageViewAndDrawAndAnimateTheImagesInTheArray: (NSArray *)imageArray inFrame: (CGRect)imageFrame andShowMessage: (NSString *)message inFrame: (CGRect)msgFrame
{
	// Create the Image View and load the images
	UIImageView *imageView;
	imageView = [[UIImageView alloc] initWithFrame:imageFrame];
	imageView.animationImages = imageArray;
	
	// Animate the Images
	imageView.animationDuration = 0.5;
	[imageView startAnimating];
	
	// Create and Show the Message Label
	UILabel *msgView = [self createLabelInFrame:msgFrame withText:message andAlignment:UITextAlignmentCenter andTextColor:[UIColor purpleColor] andBackColor:[UIColor whiteColor] andAlpha:0.5];
	
	
	// Create the final View with both elements and return it
	UIView *finalView = [UIView new];
	
	[finalView addSubview:msgView];
	[finalView addSubview:imageView];
	
	return finalView;
}



// @description - Creates a new Label of the given data
- (UILabel *)createLabelInFrame: (CGRect)frame  withText: (NSString *)text andAlignment: (UITextAlignment)alignment andTextColor: (UIColor *)textColor andBackColor: (UIColor *)backColor andAlpha: (CGFloat)alpha
{
	UILabel *label;
	label = [[UILabel alloc] init];
	label.frame = frame;
	
	label.textAlignment = alignment;
	label.text = text; 
	label.textColor = textColor;
	label.lineBreakMode = UILineBreakModeWordWrap;
	label.adjustsFontSizeToFitWidth = YES;
	label.numberOfLines = 3;
	label.backgroundColor = backColor;
	label.alpha = alpha;
	
	return label;	
}


@end

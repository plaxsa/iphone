//
//  SmallItemCellView.m
//  MyNews
//	@description - The Cell UIView for each item in the GalleryTableViewController
//  Created by ANKUR AGARWAL on 21/12/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import "SmallItemCellView.h"
#import "CommonUtils.h"
#import "General.h"
#import "ViewManager.h"

@implementation SmallItemCellView


- (id)initWithFrame:(CGRect)frame	
{
	
	if (self = [super initWithFrame:frame]) 
	{
		// Initialization code
		
		self.opaque = YES;
	}
	
	return self;
}



// @description - updates the row with the contents of the item/clip
- (void)setItem: (SlideShowInfo *)newItem
{
	// Set the reference to the channel item
	if(item != newItem)
	{	
		item = newItem;
		thumbRequestor = [HttpCommunicator new];
		
		// Load the image from the backend if it is yet to be loaded
		if( (!item->thumbImage) || (item->loadedThumbImage == DEFAULT_THUMBNAIL) )
		{
			if( [ item->thumbnailUrl length] > 4)
				httpConnection = [thumbRequestor sendAsyncRequestTo:item->thumbnailUrl andDelegateTo:self];
			
			if(item->loadedThumbImage != DEFAULT_THUMBNAIL)
			{
				item->thumbImage = NULL;
				item->thumbImage = [UIImage imageNamed: DEFAULT_THUMBNAIL];
				RETAIN(item->thumbImage);
				
				RELEASEIF(item->loadedThumbImage);
				item->loadedThumbImage = NULL;
				item->loadedThumbImage = [[NSString alloc] initWithString: DEFAULT_THUMBNAIL];
			}
		}
		
		RELEASEIF(thumbRequestor);		
	}
	
	// Mark for redisplay
	[self setNeedsDisplay];		
}




- (void)drawRect:(CGRect)rect 
{
	
#define MAIN_FONT_SIZE			15
#define SUB_FONT_SIZE			10
	
#define THUMBIMAGE_WIDTH		78.0
#define THUMBIMAGE_HEIGHT		75.0
	
#define TITLE_TEXT_X			85
#define TITLE_TEXT_Y			1
#define TITLE_TEXT_WIDTH		240
	
	
#define ONE_KB					1024
	
	// Set the background color
	[self setBackgroundColor:[UIColor clearColor]];
	
	// Color and font for the main text items 
	UIColor *mainTextColor = [UIColor blackColor];
	UIFont *mainFont = [UIFont boldSystemFontOfSize:MAIN_FONT_SIZE];
	
	// check whether Item or not
	if ( [self isItem] == YES )
	{
		// Drawing code
		if(item)
		{
			CGPoint point;
			CGRect rect;
			// Draw the Thumbnail
			CGRect frame = CGRectMake(1.0,0.0, THUMBIMAGE_WIDTH, THUMBIMAGE_HEIGHT);
			[[CommonUtils commonUtils] drawImage: item->thumbImage inRect: frame];
			
			
			// Draw the title
			[mainTextColor set];
			point = CGPointMake(TITLE_TEXT_X, TITLE_TEXT_Y);
			rect = CGRectMake(TITLE_TEXT_X, TITLE_TEXT_Y, 220.0, 75.0);
			[item->showName drawInRect:rect withFont:mainFont lineBreakMode:UILineBreakModeClip alignment:UITextAlignmentLeft];
		}
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
	item->isThumbnailDone = YES;
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[connection release];
	httpConnection = nil;
}  




- (void)connectionDidFinishLoading:(NSURLConnection *)connection  
{  
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		
	if(item)
	{
		if( ![item->thumbImage isKindOfClass:[NSNull class]] )	
		{
			item->isThumbnailDone = YES;
			[item->thumbImage release];
			item->thumbImage = nil;
			// Load the new thumbnail
			item->thumbImage = [[UIImage alloc] initWithData: [NSData dataWithBytes:[imageDataFromServer mutableBytes] length:[imageDataFromServer length]]];
		}
		
		@try 
		{
			if( ![item->thumbnailUrl isKindOfClass:[NSNull class]] )	
			{	
				if(item->loadedThumbImage)
					RELEASEIF(item->loadedThumbImage);
				item->loadedThumbImage = [[NSString alloc] initWithString: IMAGE_URL_DONE];
			}
		}
		@catch (NSException *excep)
		{
			NSLog(@"exception handled");
		}
	}

// Release the imageDataFromServer
RELEASEIF(imageDataFromServer);
[connection release];
httpConnection = nil;

// Mark for redisplay
[self setNeedsDisplay];	
}  


// Cancle the HTTP connection
- (void)cancelHttpCommunications
{
	if(httpConnection)
	{
		item = nil;
		[httpConnection cancel];
		[httpConnection release];
		httpConnection = nil;
		if(item)
		{
			RELEASEIF(item->loadedThumbImage);
			item->loadedThumbImage = [[NSString alloc] initWithString: DEFAULT_THUMBNAIL];
		}
	}
}


//@descrption - get isItem
- (BOOL)isItem
{
	return isItem;
}



//@descrption - set isItem
- (void)setIsItem: (BOOL) value
{
	isItem = value;
}


//@descrption - set navigation text
- (void)setText:(NSString*) string
{
	if (NavigationText)
		RELEASEIF(NavigationText);
	NavigationText = [[NSString alloc] init];
	NavigationText = string;
	
	// Mark for redisplay
	[self setNeedsDisplay];		
}


//@descrption - set the reference to nil
-(void)deleteItem
{
	item = nil;
}


// Return the value for Thumbnil data done or not
- (BOOL)isChannelThumbnailDone
{
	if(item)
		return item->isThumbnailDone;
	else
		return YES;
}


// Call draw method to display data
-(void)callNeedToDisplay
{
	[self setNeedsDisplay];
}


// Free all the allocated memory
- (void)dealloc 
{
	RELEASEIF(NavigationText);
	RELEASEIF(imageDataFromServer);
	RELEASEIF(thumbRequestor);
	[super dealloc];
}



@end

//
//  SmallItemCell.m
//  MyNews
//  The Cell View for each item in the galleryTableViewController
//  Created by ANKUR AGARWAL on 21/12/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import "SmallItemCell.h"


@implementation SmallItemCell

// @description - Initializes the View
- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier 
{
	if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) 
	{
		// Create a Item Cell view and add it as a subview of self's contentView.
		CGRect cvFrame = CGRectMake(0.0, 0.0, self.contentView.bounds.size.width, self.contentView.bounds.size.height);
		smallItemCellView = [[SmallItemCellView alloc] initWithFrame:cvFrame ];	
		smallItemCellView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		
		// Set the background color
		[smallItemCellView setBackgroundColor:[UIColor clearColor]];	
		
		// Add the view to the content view of the cell
		[self.contentView addSubview:smallItemCellView];
	}
	return self;
}



// @description - Sets the cell as selected
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
	
	[super setSelected:selected animated:animated];
	
	// Configure the view for the selected state
}



// @description - Sets the Item in the Item View
- (void)setItem: (SlideShowInfo *)newItem
{
	[smallItemCellView setItem: newItem];
}



- (void)cancelHttpCommunications
{
	[smallItemCellView cancelHttpCommunications];
}



//@descrption - set isItem
- (void)setIsItem: (BOOL) value
{
	[smallItemCellView setIsItem:value];
}


//@descrption - get isItem
- (BOOL)isItem
{
	return [smallItemCellView isItem];
}


//@descrption - set navigation text
- (void)setText:(NSString*) string
{
	[smallItemCellView setText:string];
}



// @description - Prepares a Channel Cell for reuse...Gets called just before displaying it
- (void)prepareForReuse
{
	[self cancelHttpCommunications];
	
	// Set the background color
	[smallItemCellView setBackgroundColor:[UIColor clearColor]];	
}



// To delete the item from the view
-(void)deleteItem
{
	[smallItemCellView deleteItem];
}


// To call the view class to display data
-(void)callNeedToDisplay
{
	[smallItemCellView callNeedToDisplay];
}


// Check thumbnail data get done or not from the server
- (BOOL)isChannelThumbnailDone
{
	return [smallItemCellView isChannelThumbnailDone];
}


// @description - Deletes the entire instance and frees the memory
- (void)dealloc 
{
	[super dealloc];
}

@end

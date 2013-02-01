//
//  ItemCell.m
//  Umundo
//  @description - The Cell View for each item in the ItemTableViewController
//
//  Created by Y Kamesh Rao on 04/09/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import "ItemCell.h"


@implementation ItemCell



// @description - Initializes the View
- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier 
{
	if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) 
	{
		// Create a Item Cell view and add it as a subview of self's contentView.
		CGRect cvFrame = CGRectMake(0.0, 0.0, self.contentView.bounds.size.width, self.contentView.bounds.size.height);
		itemCellView = [[ItemCellView alloc] initWithFrame:cvFrame ];	
		itemCellView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		// Set the background color
		[itemCellView setBackgroundColor:[UIColor clearColor]];	

		// Add the view to the content view of the cell
		[self.contentView addSubview:itemCellView];
		
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
- (void)setItem: (ItemInfo *)newItem
{
	[itemCellView setItem: newItem];
}



- (void)cancelHttpCommunications
{
	[itemCellView cancelHttpCommunications];
}



//@descrption - set isItem
- (void)setIsItem: (BOOL) value
{
	[itemCellView setIsItem:value];
}

//@descrption - get isItem
- (BOOL)isItem
{
	return [itemCellView isItem];
}


//@descrption - set navigation text
- (void)setText:(NSString*) string
{
	[itemCellView setText:string];
}



// @description - Prepares a Channel Cell for reuse...Gets called just before displaying it
- (void)prepareForReuse
{
	[self cancelHttpCommunications];
	
	// Set the background color
	[itemCellView setBackgroundColor:[UIColor clearColor]];	
}




-(void)deleteItem
{
	[itemCellView deleteItem];
}



-(void)callNeedToDisplay
{
	[itemCellView callNeedToDisplay];
}



- (BOOL)isChannelThumbnailDone
{
	return [itemCellView isChannelThumbnailDone];
}


// @description - Deletes the entire instance and frees the memory
- (void)dealloc 
{
	[super dealloc];
}


@end

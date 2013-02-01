//
//  ItemCell.h
//  Umundo
//  @description - The Cell View for each item in the ItemTableViewController
//
//  Created by Y Kamesh Rao on 04/09/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Items.h"
#import "ItemCellView.h"


@interface ItemCell : UITableViewCell 
{
	ItemCellView *itemCellView;
}

- (void)setItem: (ItemInfo *)newItem;
- (void)cancelHttpCommunications;
- (BOOL)isItem;
- (void)setIsItem: (BOOL) value;
- (void)setText:(NSString*) string;
- (void)deleteItem;
- (BOOL)isChannelThumbnailDone;
- (void)callNeedToDisplay;
@end
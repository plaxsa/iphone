//
//  ItemTableViewController.h
//  Umundo
//	@description - This class will manage the Item Table View of the class
//
//  Created by Y Kamesh Rao on 04/09/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Items.h"

@interface ItemTableViewController : UITableViewController <UIWebViewDelegate>
{
	UIWebView *myWebViewTop;
	BOOL isTopWebView;
	BOOL isPrevMoreSelected;
	BOOL isHitRequested;
	NSTimer *timerRedraw;
	BOOL isTimerStarted;
	
	int currItemCount;
	int currOffsetCount;
	int currTotalCount;
	ItemInfo** currItemInfo;
	BOOL isClicked;
}

- (void)setCurrentItemCount:(int)count;
- (void)setCurrentOffsetCount:(int)count;
- (void)setTotalItemCount:(int)count;
- (void)setItemInfo:(ItemInfo**)info;

- (NSInteger)numberOfRows;
- (UITableViewCell *)topAds:(UITableView *)tableView;
- (UITableViewCell *)itemTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)itemTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)setIsHitRequested:(BOOL)value;
- (BOOL)isHitRequested;

@end

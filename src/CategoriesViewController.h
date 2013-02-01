//
//  CategoriesViewController.h
//  MyNews
// @Description -  Class to get and dispaly Channels on the screen
//  Created by ANKUR AGARWAL on 17/11/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppProtocols.h"

@interface CategoriesViewController : UIViewController<ChannelsReceived,UIWebViewDelegate>
{
	int currentCount;
	int channelOffset;
	BOOL isSecondTime;
	BOOL isHitPreviousChannels;
	BOOL isHitMoreChannels;
	
	// For Channel Pagination
	NSString *currentOrder;
	BOOL tabBarsCreated;
	BOOL isItemTableViewCreated;
	
	UIWebView		*CategoriesWebViewFooter;
	BOOL isClicked;
}

- (void)retryHTTPRequest;
- (void)getChannelsForBrowsingOfCategory: (NSString *)categoryID filteredBy: (NSString *)filter inOrder: (NSString *)order fromOffset: (int) offset inCount: (int)count;
- (void)setCurrentCount: (int)value;
- (int)currentCount;
- (void)HitingForChannels;
- (int)channelOffset;
- (void)setChannelOffset:(int)value;
- (void)setisHitPreviousChannels: (BOOL)value;
- (void)setisHitMoreChannels: (BOOL)value;
- (BOOL)isHitPreviousChannels;
- (BOOL)isHitMoreChannels;


@end

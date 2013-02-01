//
//  UpdatesTableViewController.h
//  Umundo
//	@description - Displays the Channel Updates as a Table View
//
//  Created by Y Kamesh Rao on 16/09/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppProtocols.h"

@interface UpdatesTableViewController : UITableViewController <UIWebViewDelegate>
{
	UIWebView *updatesWebViewTop;
	BOOL isTopWebView;
	
	int currentCount;
	int channelOffset;
	BOOL isSecondTime;
	BOOL isHitPreviousMySubscribedChannels;
	BOOL isHitMoreMySubscribedChannels;
	
	BOOL isClicked;
}
//- (void)aboutButtonTouch;
- (UITableViewCell *)topAds:(UITableView *)tableView;

@end

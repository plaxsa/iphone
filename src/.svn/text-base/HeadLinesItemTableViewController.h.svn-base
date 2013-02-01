//
//  HeadLinesItemTableViewController.h
//  MyNews
// @Description - To show the top news on the table, get by top news channel
//  Created by ANKUR AGARWAL on 12/12/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HeadLinesItemTableViewController : UITableViewController <UIWebViewDelegate>
{
	UIWebView *myWebViewTop;
	BOOL isTopWebView;
	BOOL isPrevMoreSelected;
	BOOL isHitRequested;
	NSTimer *timerRedraw;
	BOOL isTimerStarted;
	BOOL isCliked;
}

- (NSInteger)numberOfRows;
- (UITableViewCell *)topAds:(UITableView *)tableView;
- (UITableViewCell *)itemTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)itemTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)setIsHitRequested:(BOOL)value;
- (BOOL)isHitRequested;
@end


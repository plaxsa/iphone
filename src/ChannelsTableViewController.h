//
//  ChannelsTableViewController.h
//  Umundo
//  @description - This class will manage the Channels Table View. One of the most important things
//
//  Created by Y Kamesh Rao on 30/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChannelsTableViewController : UITableViewController <UITableViewDelegate,UIWebViewDelegate>
{
	int rowCount;
	UIWebView *myWebViewTop;
	UIWebView *myWebViewBottom;
	BOOL isTopWebView;
	BOOL isBottomWebView;
	BOOL isPrevMoreSelected;
	BOOL isHitRequested;	
	NSTimer *timerRedraw;
	BOOL isTimerStarted;
	UISwitch *aswitch;
}

- (NSInteger)numberOfRows;
- (UITableViewCell *)topAds:(UITableView *)tableView;
- (UITableViewCell *)bottomAds:(UITableView *)tableView;
- (UITableViewCell *)channelTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)channelTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)setIsHitRequested:(BOOL)value;
- (BOOL)isHitRequested;
@end

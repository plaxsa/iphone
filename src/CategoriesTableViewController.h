//
//  CategoriesTableViewController.h
//  Umundo
//  @description - This class will manage the News Channels on the screen and some items and more option with them
//
//  Created by Ankur Agarwal on 24/11/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppProtocols.h"
#import "Items.h"

@interface CategoriesTableViewController : UITableViewController<UIWebViewDelegate>
{
	UIWebView *myWebViewTop;
	BOOL isTopWebView;
	BOOL isPrevMoreSelected;
	BOOL isHitRequested;
	NSTimer *timerRedraw;
	BOOL isTimerStarted;
	BOOL isEditingStart;
	BOOL isClicked;
}

- (NSInteger)numberOftopNewsChannelRows;
- (NSInteger)numberOfBusinessChannelRows;
- (NSInteger)numberOfEntertainmentChannelRows;
- (NSInteger)numberOfSportsChannelRows;
- (NSInteger)numberOfCricketChannelRows;
- (NSInteger)numberOfFootballChannelRows;
- (NSInteger)numberOfLifestyleChannelRows;
- (NSInteger)numberOfPeopleChannelRows;
- (NSInteger)numberOfScienceChannelRows;
- (NSInteger)numberOfOffbeatChannelRows;


- (UITableViewCell *)itemTableView:(UITableView *)tableView topnewscellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)itemTableView:(UITableView *)tableView businesscellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)itemTableView:(UITableView *)tableView entertainmentcellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)itemTableView:(UITableView *)tableView sportscellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)itemTableView:(UITableView *)tableView cricketcellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)itemTableView:(UITableView *)tableView footballcellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)itemTableView:(UITableView *)tableView lifestylecellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)itemTableView:(UITableView *)tableView peoplecellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)itemTableView:(UITableView *)tableView sciencecellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)itemTableView:(UITableView *)tableView offbeatcellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)itemTableView:(UITableView *)tableView topnewsdidSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)itemTableView:(UITableView *)tableView businessdidSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)itemTableView:(UITableView *)tableView entertainmentdidSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)itemTableView:(UITableView *)tableView sportsdidSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)itemTableView:(UITableView *)tableView cricketdidSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)itemTableView:(UITableView *)tableView footballdidSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)itemTableView:(UITableView *)tableView lifestyledidSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)itemTableView:(UITableView *)tableView peopledidSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)itemTableView:(UITableView *)tableView sciencedidSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)itemTableView:(UITableView *)tableView offbeatdidSelectRowAtIndexPath:(NSIndexPath *)indexPath;


- (void)setIsHitRequested:(BOOL)value;
- (BOOL)isHitRequested;

- (UITableViewCell *)topAds:(UITableView *)tableView;

@end

//
//  GalleryItemTableViewController.h
//  MyNews
// @Description - To dispaly Videos and Slide Shows in the table
//  Created by ANKUR AGARWAL on 19/12/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GalleryItemTableViewController : UITableViewController <UIWebViewDelegate>
{
	UIWebView *myGalleryWebViewTop;
	BOOL isTopWebView;
	BOOL isBottomWebView;
	BOOL isClicked;
}
- (NSInteger)numberOfRows;
- (UITableViewCell *)topAds:(UITableView *)tableView;
- (UITableViewCell *)itemTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)itemTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfRowsforslideshow;
- (UITableViewCell *)itemTableView:(UITableView *)tableView cellForRowAtIndexPathforslideshow:(NSIndexPath *)indexPath;
- (void)itemTableView:(UITableView *)tableView didSelectRowAtIndexPathforSlideShow:(NSIndexPath *)indexPath;
@end

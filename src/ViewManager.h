//
//  ViewManager.h
//  Umundo
//  @description - Handles all the views and their controllers and change of control among them
//
//  Created by Y Kamesh Rao on 26/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppProtocols.h"
#import "SplashViewController.h"
#import "HeadLinesViewController.h"
#import "HeadLinesItemTableViewController.h"
#import "CategoriesViewController.h"
#import "CategoriesTableViewController.h"

#import "UpdatesViewController.h"
#import "MediaPlayerViewController.h"
#import "UpdatesTableViewController.h"

#import "ItemTableViewController.h"
#import "NewsDetailViewController.h"

#import "SubscriptionRootViewController.h"


#import "ChannelsTableViewController.h"
#import "SubscribeViewController.h"

#import "GalleryViewController.h"
#import "GalleryItemTableViewController.h"
#import "AboutViewController.h"

#import "SlideshowViewController.h"
#import "AdsWebPageViewController.h"
#import "EnlargeImageViewController.h"

enum _Views
{
	SPLASH,
	HEADLINES,
	HEADLINES_ITEM_TABLE_VIEW,
	HEADLINES_NAVIGATION_VIEW,
	CATEGORIES,
	MYNEWS,
	SUBSCRIPTION_ROOT,
	HOME_TAB_BAR,
	CATEGORIES_NAVIGATION_VIEW,
	CATEGORIES_TABLE_VIEW,
	CHANNEL_NAVIGATION_VIEW,
	CHANNEL_TABLE_VIEW,
	ITEM_TABLE_VIEW,
	ITEM_NAVIGATION_VIEW,
	MEDIA_PLAYER_VIEW,
	CATEGORY_TABLE_VIEW,
	UPDATES,
	UPDATES_NAVIGATION_VIEW,
	UPDATES_TABLE_VIEW,
	MYSUBSCRIBED_CHANELS_TABLE_VIEW,
	MYSUBSCRIBED_ITEMS_TABLE_VIEW,
	NEWS_DETAILS_VIEW,
	MY_SUBSCRIPTION_NAVIGATION_VIEW,
	WEB_VIEW,
	SUBSCRIBE_VIEW,
	GALLERY_VIEW,
	GALLERY_NAVIGATION_VIEW,
	GALLERY_ITEM_TABLE_VIEW,
	ABOUT_VIEW,
	SLIDE_SHOW_VIEW,
	ADS_WEB_VIEW,
	ENLARGE_VIEW,
	TOTAL_VIEWS
};

typedef enum _Views View;

@interface ViewManager : NSObject
{
	UIWindow *appWindow;
	
	SplashViewController *splashViewController;
	UITabBarController *loginTabBarController;
	
	UITabBarController *homeTabBarController; 	
	HeadLinesViewController	*headLinesViewController;
	HeadLinesItemTableViewController *headLinesItemTableViewController;
	UINavigationController *headlinesNavigationController;
	
	CategoriesViewController *categoriesViewController;
	
	MediaPlayerViewController *mediaPlayerViewController;
	
	UpdatesViewController *updatesViewController;
	UINavigationController *updatesNavigationController;
	UpdatesTableViewController *updatesTableViewController;
	
	UINavigationController *itemsNavigationController;
	ItemTableViewController *itemTableViewController;
	
	SubscriptionRootViewController *mySubscriptionrootViewController;
	
	UINavigationController *mySubscriptionNavigationController;
	
	UINavigationController *categoriesNavigationController;
	CategoriesTableViewController *categoriesTableViewController;
	
	NewsDetailViewController *newsDetailViewController;
	
	
	ChannelsTableViewController *channelsTableViewController;
	
	SubscribeViewController *subscribeViewController;
	
	UINavigationController *galleryNavigationController;
	GalleryViewController *galleryViewController;
	GalleryItemTableViewController *galleryItemTableViewController;
	
	AboutViewController *aboutViewController;
	SlideshowViewController *scrollViewController;
	AdsWebPageViewController *adsWebPageViewController;
	EnlargeImageViewController *enlargeImageViewController;
	
	View activeViewID;
	// Message View related stuff
	UIView *messageView;
	NSString *messageString;
	BOOL messageDisplayed;
	BOOL animationMessageDisplayed;	
	NSTimer *messageTimer;
}

- (UIWindow *)appWindow;
- (void)setAppWindow: (UIWindow *)window;
- (id)initManagerForWindow: (UIWindow *)window;

- (void)createViewController: (View)viewID;
- (void)createTabViewController: (View)viewID andInitWithControllers: (NSArray *)viewControllers;
- (void)createTableViewController: (View)viewID andInitWithStyle: (UITableViewStyle)style andTitle: (NSString *)title andRowHeight: (int)rowHeight;
- (void)createNavigationViewController: (View)viewID andInitWithRootViewController: (View)rootViewID;
- (void)createViewController: (View)viewID forNib: (NSString *)nibName;
- (void)setViewController: (id)viewController forTheViewID: (View)viewID;
- (void)setViewOfController: (View)viewID andRemoveViewOfActiveController: (BOOL)remove;
- (void)setViewOfControllerOnGrayBackdrop: (View)viewID andRemoveViewOfActiveController: (BOOL)remove;

- (void)addViewOfController: (View)viewID overTheViewOfController: (View)baseViewID;
- (void)insertViewOfController: (View)viewID toTheViewOfController: (View)baseViewID atIndex: (NSInteger)index;
- (void)pushViewController: (View)viewID animated: (BOOL)animate inTheNavigationViewController: (View)navViewID;
- (void)popViewController: (View)viewID animated: (BOOL)animate inTheNavigationViewController: (View)navViewID;

- (void)removeActiveViewController;
- (void)removeViewOfController: (View)viewID;
- (void)releaseViewController: (View)viewID;
- (UIViewController *)viewController: (View)viewID;

- (void)showWaitAnimationAndMessage: (NSString *)message;
- (void)showMessage: (NSString *)message andSetTitle: (NSString *)title andDelegateTo: (id)delegate;
- (void)showMessageWithRetry: (NSString *)message andSetTitle: (NSString *)title andDelegateTo: (id)delegate;
- (void)showMessageWithYesNo: (NSString *)message andSetTitle: (NSString *)title andDelegateTo: (id)delegate;
- (void)showMessageRetry: (NSString *)message andSetTitle: (NSString *)title andDelegateTo: (id)delegate;
- (void)removeMessage;
- (BOOL)isMessageDisplayed;
+ (ViewManager *)viewManager;
- (void)setActiveViewControllerinTabViewController: (View)viewID;
@end

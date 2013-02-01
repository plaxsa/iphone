/*
 *  General.h
 *  Umundo
 *  @description - General methods and string constants to be used in the entire app
 *
 *  Created by Y Kamesh Rao on 20/08/08.
 *  Copyright 2008 Umundo. All rights reserved.
 *
 */


#ifndef _GENERAL_H_
#define _GENERAL_H_

#define DEALLOCIF(x)			if(x) {	free(x); x = NULL; }
#define RELEASEIF(x)			if(x) { [x release]; x = nil; }
#define RELEASEVIEWCTRLRIF(x)	if(x) { [x.view removeFromSuperview]; [x release]; x = nil; }
#define RETAIN(x)				if( ![x isKindOfClass:[NSNull class]] ) { [x retain]; }
#define ASSIGNSTRING(x,y,z)		if(![[x objectForKey:y] isKindOfClass:[NSNull class]]) { z = [[NSString alloc] initWithString: [x objectForKey:y]]; }
#define ASSIGNDATE(x,y,z)		if([x objectForKey:y] != NULL) { z = (NSDate *)[x objectForKey:y]; }
#define ASSIGNNUMBER(x,y,z)		if(![[x objectForKey:y] isKindOfClass:[NSNull class]]) { z = [x objectForKey:y]; }

#define SecretKey				@"E5C1D5F6-E0B2-11DD-BD6B-62C455D89593" 
#define KeyLength				36
#define UmundoUID				@"EEA6AAFCE0B211DD83EFBFC455D89593" 



// production server url	
#define GoogleBootom			@"http://www.umundo.com/wap/jsp/iPhoneAds.jsp?adPlace=Bottom"	//@"http://www.umundo.com/wap/jsp/myNewsGoogleAdsBottom.jsp"
#define GoogleTop				@"http://www.umundo.com/wap/jsp/iPhoneAds.jsp?adPlace=Top"		//@"http://www.umundo.com/wap/jsp/myNewsGoogleAdsTop.jsp"
//#define PublicAPI				@"http://rssapi.umundo.com/rssapi/1.4/httprpc/" 

#define PublicAPI				@"http://59.90.39.53:8080/mynews/services/"


// dee urls
//#define PublicAPI				@"http://dee.hexlet.com/rssapi/1.4/httprpc/" 
//#define GoogleBootom			@"http://dee.hexlet.com/wap/jsp/iPhoneAds.jsp?adPlace=Bottom"	//@"http://dee.hexlet.com/wap/jsp/myNewsGoogleAdsBottom.jsp"
//#define GoogleTop				@"http://dee.hexlet.com/wap/jsp/iPhoneAds.jsp?adPlace=Top"		//@"http://dee.hexlet.com/wap/jsp/myNewsGoogleAdsTop.jsp"

#define BundleIdentifier		"com.umundomobile.MyNews"

#define CHANNEL_COUNT_PER_PAGE	10
#define ITEMS_COUNT_PER_PAGE	10
#define CATEGORY_COUNT_PER_PAGE 10
#define UPDATES_COUNT_PER_PAGE	10
#define RESULTS_COUNT_PER_PAGE	10

#define CHANNEL_TBL_ROW_HEIGHT  75.0

#define TIMEOUT_INTERVAL		60.0
#define SYNCH_RETRY_DELAY		3.0
#define DAYS_IN_SECONDS			(5 * 24 * 60 * 60)
#define MAX_CHANNEL_CLIP_VISIBLE 25
#define MAX_IMAGE_SIZE_CAN_DISPLAY	716800

#define GROUP_ALIAS				@"my_news"
#define MOBILE_PROFILE_NAME		@"SharefunMobileMP4"
#define TOP_LEVEL_PARENT_ID		@"MY_NEWS"
#define	SLIDE_SHOW_CHANNELALIAS	@"afp_slideshows"
#define	SLIDE_SHOW_TITLE		@"Slide Shows"
#define VIDEOS_TITLE			@"Videos"
#define VIDEOS_CHANNELALIAS		@"afp_videos"
#define	NUMBER_OF_SLIDES		5
#define MAXSHOWSIN_SLIDE		10

#define DESCRIPTION_FONT		@"Arial"
#define invalidUsernameResponse @"<html><head><title>Apache Tomcat/5.0 - Error report</title><style><!--H1 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:22px;} H2 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:16px;} H3 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:14px;} BODY {font-family:Tahoma,Arial,sans-serif;color:black;background-color:white;} B {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;} P {font-family:Tahoma,Arial,sans-serif;background:white;color:black;font-size:12px;}A {color : black;}A.name {color : black;}HR {color : #525D76;}--></style> </head><body><h1>HTTP Status 403 - </h1><HR size=\"1\" noshade=\"noshade\"><p><b>type</b> Status report</p><p><b>message</b> <u></u></p><p><b>description</b> <u>Access to the specified resource () has been forbidden.</u></p><HR size=\"1\" noshade=\"noshade\"><h3>Apache Tomcat/5.0</h3></body></html>"
#define SUBSCRIPTIONS_FILE_NAME @"/subscriptions.info"


// XIBs
#define XIB_SPLASH_VIEW			@"SplashView"
#define XIB_IMAGE_VIEW			@"ImageView"	
#define XIB_SUBSCRIBE_VIEW		@"SubscribeView"
#define XIB_SLIDE_SHOW			@"SlideShowView"
#define XIB_SCROLL_VIEW			@"ScrollView"
#define XIB_ADS_VIEW			@"AdsWebView"
#define XIB_MY_SLIDESHOW		@"SlideShowView"
#define XIB_ENLARGE_VIEW		@"EnlargeImageView"

// Image URLs
#define DEFAULT_THUMBNAIL		@"default_thumb.png"
#define DEFAULT_AUDIO_THUMBNAIL @"audiothumbnail.gif"
#define ICON_UPDATES			@"update.png"
#define ICON_NEWS				@"news_icon.png"
#define MAIN_SPLASH				@"logo.png"
#define AD_IMAGE				@"logo.png"
#define CONNECTIVITY			@"animation_back.png"
#define IMG_SPLASH				@"Default.png"
#define IMG_BACK				@"background.png"
#define IMG_HEADER				@"header.png"
#define IMG_GRAY_BACK			@"white_background.png"
	
#define ICON_HEADLINE			@"topnews_icon.png"
#define ICON_MYNEWS				@"mynews.png"
#define ICON_MYACCOUNT			@"option_icon.png"
#define ICON_GALLERY			@"gallery_icon.png"
#define ICON_ABOUT				@"about.png"
#define SECTION_HEADER			@"section_header.png"
#define CROSSICON_IMAGE			@"cross_icon.png"

#define filterSearchItems		@"items"
#define filterSearchChannels	@"channels"
#define filterSearchAll			@"all"
#define IMAGE_URL_DONE			@"thumbnaildone"


// channel aliases and channel names

#define TOPNEWS_ALIAS					@"afp_topnews"
#define TOPNEWS_CHANNEL_NAME			@"Top News"

#define BUSINESS_ALIAS					@"afp_business"
#define BUSINESS_CHANNEL_NAME			@"Business"

#define ENTERTAINMENT_ALIAS				@"afp_entertainment"
#define ENTERTAINMENT_CHANNEL_NAME		@"Entertainment"

#define SPORTS_ALIAS					@"afp_sport"
#define SPORTS_CHANNEL_NAME				@"Sports"

#define CRICKET_ALIAS					@"afp_cricket"
#define CRICKET_CHANNEL_NAME			@"Cricket"

#define FOOTBALL_ALIAS					@"afp_football"
#define FOOTBALL_CHANNEL_NAME			@"Football"

#define LIFESTYLE_ALIAS					@"afp_lifestyle"
#define LIFESTYLE_CHANNEL_NAME			@"Lifestyle"

#define PEOPLE_ALIAS					@"afp_people"
#define PEOPLE_CHANNEL_NAME				@"People"

#define SCIENCE_ALIAS					@"afp_science"
#define SCIENCE_CHANNEL_NAME			@"Science"

#define OFFBEAT_ALIAS					@"afp_offbeat"
#define OFFBEAT_CHANNEL_NAME			@"Offbeat"


// Alert Titles
#define errorTitleNoClips		@"No Clips"
#define errorTitleNoCats		@"No Categories"
#define errorTitleFormVal		@"Validation Error"
#define errorTitleResponse		@"Network Response"
#define errorTitleSysErr		@"Application Error"
#define alertTitleSysResp		@"Application Response"
#define alertTitleSuccess		@"Success"
#define alertTitleAdultConfirm	@"Confirmation"
#define alertTitleNoChannels	@"No Channels"	
#define alertOk					@"Ok"
#define alertRetry				@"Retry"
#define alertYes				@"Yes"
#define alertNo					@"No"
#define MoreOption				@"More"

// Messages
#define networkMessageChannels	@"Getting News"
#define networkMessageSubscription	@"Getting Subscription"
#define networkMessageClips		@"Getting Clips"
#define networkMessageCategory	@"Getting Categories"
#define networkMessagePreload	@"Buffering"
#define networkMessageSynching	@"Synching"
#define networkMessagePlsWt		@"Please Wait"

#define errorMessageLessPhoneNumber @"Phone number must not be less then 10 digit, please give a valid phone number."
#define errorMessageNoClips		@"The channel is empty. There are no Clips published yet."
#define errorMessageNoChannels	@"There are no Channels in this Category yet."
#define errorMessageNoCats		@"There are no Categories in the system."
#define errorMessageNoResults	@"No Results found"
#define errorMessageNoUpdates	@"There are no updates on your subscriptions."
#define errorMessageViewPermission @"You don't have permission to view this clip."	
#define errorMessageCategoryMandate @"Please select a category."
#define errorMessageLengthZero	@"Cannot play since content is not available."
#define errorMessageNetFail		@"The request cannot be completed due to network failure. Try again later."
#define errorMessageFatal		@"Fatal System Error - This is logged. Please try again later or contact support@umundo.com. We deeply regret the inconvienience."

#define alertMessageUnsubscribe	@"You have unsubscribed from receiving the updates on the channel."
#define alertMessageSynchingOn	@"Synching your subscriptions is in progress. Please try again to change category in a few seconds."
#define alertNoMyChannels		@"You have no Channels in this section."
#define alertNoMySubscribe		@"You have no subscriptions. Please subscribe some channels."

// More App specific string constants
#define titleTopNews			@"Top News"
#define titleHeadLines			@"Headlines"
#define titleNews				@"News"
#define titleMyNews				@"My News"
#define titleOptions			@"Subscription" 
#define titleGallery			@"Gallery"
#define TYPE_RECENT				@"recent"

#define titleUpdates			@"Updates"
#define titleMYSubscription		@"Subscriptions"
#define titleAbout				@"About"

#define titleChannels			@"Channels"
#define titleClips				@"Clips"
#define titleUnSubscribe		@"Unsubscribe"

#define titleCancel				@"Cancel"
#define titleOK					@"Ok"
#define titleFeatured			@"Featured"
#define titleBack				@"Back"
#define titleAds				@"Ads By Google"
#define labelcheckingupdate		@"Checking for Updates"
#define labelPleaseWait			@"Please Wait"
#endif
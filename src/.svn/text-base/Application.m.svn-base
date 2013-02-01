//
//  Application.m
//  Umundo
//
//  Created by Y Kamesh Rao on 20/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import "Application.h"


@implementation Application

static Application *application;

+ (Application *)application
{
	@synchronized(self)
	{
		if(!application)
			[[Application alloc] init];
		
		return application;
	}
	
	return nil;
}



+ (id)alloc
{
	@synchronized(self)
	{
		NSAssert(application == nil, @"Attempted to allocate a second instance of a singleton.");
		application = [super alloc];
		return application;
	}
	
	return nil;
}



// Initalize the class objects
- (id)init
{
	@synchronized(self)
	{
		if(![super init])
			return nil;
		
		aHttpRequest = [[HttpRequest alloc] init];
		aChannels = [[Channels alloc] init];
		aItems = [[Items alloc] init];
		return self;
	}
	
	return nil;
}



// Return the httprequest class object
- (HttpRequest *)aHttpRequest
{
	return aHttpRequest;
}


// Return the channels class object
- (Channels *)aChannels
{
	return aChannels;
}



// Return the items class object
- (Items *)aItems
{
	return aItems;
}



// Free allocated memory
- (void)dealloc
{	
	[aHttpRequest release];
	[aChannels release];
	[aItems release];
	[super dealloc];
}

@end



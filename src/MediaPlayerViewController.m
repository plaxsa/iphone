//
//  MediaPlayerViewController.m
//  Umundo
//	@description -	This class would handle the playing and displaying of audio and video content
//					in addition to the images. Most of the code is taken from the Apple Sample Code
//					and apple owns the copyright to that module. Their copyright comment is included
//					as following this comment
//
//  Created by Y Kamesh Rao on 06/09/08.
//  Copyright 2008 Umundo. All rights reserved.
//


/*
 
 File: SlideImageDispalyViewController.m
 Abstract:  A UIViewController controller subclass that loads the MoviePlayer nib
 file that contains its view.
 Instantiates a MPMoviePlayerController object, defines notification routines
 that are called when the movie preroll has
 completed, when the movie has finished playing and when the movie scaling mode
 is changed. Contains an action method that
 is called when the Play Movie button is pressed to play the movie. Updates and
 saves the user settings for the currently
 set values. Overrides the inherited shouldAutorotateToInterfaceOrientation:
 method so that the view can respond to device
 rotation.
 
 Version: 1.1
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple Inc.
 ("Apple") in consideration of your agreement to the following terms, and your
 use, installation, modification or redistribution of this Apple software
 constitutes acceptance of these terms.  If you do not agree with these terms,
 please do not use, install, modify or redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and subject
 to these terms, Apple grants you a personal, non-exclusive license, under
 Apple's copyrights in this original Apple software (the "Apple Software"), to
 use, reproduce, modify and redistribute the Apple Software, with or without
 modifications, in source and/or binary forms; provided that if you redistribute
 the Apple Software in its entirety and without modifications, you must retain
 this notice and the following text and disclaimers in all such redistributions
 of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may be used
 to endorse or promote products derived from the Apple Software without specific
 prior written permission from Apple.  Except as expressly stated in this notice,
 no other rights or licenses, express or implied, are granted by Apple herein,
 including but not limited to any patent rights that may be infringed by your
 derivative works or by other works in which the Apple Software may be
 incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE MAKES NO
 WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED
 WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND OPERATION ALONE OR IN
 COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR
 CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR
 DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED AND WHETHER UNDER THEORY OF
 CONTRACT, TORT (INCLUDING NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF
 APPLE HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2008 Apple Inc. All Rights Reserved.
 
 */

#import "MediaPlayerViewController.h"
#import "ViewManager.h"
#import "General.h"

@implementation MediaPlayerViewController


#pragma mark Movie Player Routines


//  Notification called when the movie finished preloading.
- (void)moviePreloadDidFinish: (NSNotification*)notification
{
    /* 
	 < add your code here >
	 */
	
	//if([[ViewManager viewManager] isMessageDisplayed])
	//	[[ViewManager viewManager] removeMessage];
	
}



//  Notification called when the movie finished playing.
- (void)moviePlayBackDidFinish: (NSNotification*)notification
{
    /*     
	 < add your code here >
	 
	 For example:
	 MPMoviePlayerController* theMovie=[aNotification object];
	 etc.
	 */
	
	// Remove the observation of Notifications
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerContentPreloadDidFinishNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:mMoviePlayer];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerScalingModeDidChangeNotification
                                                  object:mMoviePlayer];
	
	[[UIApplication sharedApplication] setIdleTimerDisabled:YES];
	
	// Delete the current instance of movie player
	RELEASEIF(mMoviePlayer);
	RELEASEIF(mMovieURL);
}



//  Notification called when the movie scaling mode has changed.
- (void)movieScalingModeDidChange: (NSNotification*)notification
{
    /* 
	 < add your code here >
	 
	 For example:
	 MPMoviePlayerController* theMovie=[aNotification object];
	 etc.
	 */
}


- (void)initMoviePlayer
{
    /*
	 
	 Because it takes time to load movie files into memory, MPMoviePlayerController
	 automatically begins loading your movie file shortly after you initialize a new 
	 instance. When it is done preloading the movie file, it sends the
	 MPMoviePlayerContentPreloadDidFinishNotification notification to any registered 
	 observers. If an error occurred during loading, the userInfo dictionary of the 
	 notification object contains the error information. If you call the play method 
	 before preloading is complete, no notification is sent and your movie begins 
	 playing as soon as it is loaded into memory.
	 
	 */
	
    // Register to receive a notification when the movie is in memory and ready to play.
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(moviePreloadDidFinish:) 
												 name:MPMoviePlayerContentPreloadDidFinishNotification 
											   object:nil];
    /*
	 
	 Now create a MPMoviePlayerController object using the movie file provided in our bundle.
	 
	 The MPMoviePlayerController class supports any movie or audio files that already play 
	 correctly on an iPod or iPhone. For movie files, this typically means files with the extensions 
	 .mov, .mp4, .mpv, and .3gp and using one of the following compression standards:
	 
	 - H.264 Baseline Profile Level 3.0 video, up to 640 x 480 at 30 fps. Note that B frames 
	 are not supported in the Baseline profile.
	 
	 - MPEG-4 Part 2 video (Simple Profile)
	 
	 If you use this class to play audio files, it displays a black screen while the audio plays. For 
	 audio files, this class class supports AAC-LC audio at up to 48 kHz.
	 
	 */
	
    mMoviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[self movieURL]];
	
    /*
	 In addition to the MPMoviePlayerContentPreloadDidFinishNotification notification,
	 the MPMoviePlayerPlaybackDidFinishNotification notification is sent to
	 registered observers when the movie has finished playing, and the 
	 MPMoviePlayerScalingModeDidChangeNotification notification is sent when the 
	 movie scaling mode has changed.
	 */
    
    // Register to receive a notification when the movie has finished playing. 
    [[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(moviePlayBackDidFinish:) 
												 name:MPMoviePlayerPlaybackDidFinishNotification 
											   object:mMoviePlayer];
	
    // Register to receive a notification when the movie scaling mode has changed. 
    [[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(movieScalingModeDidChange:) 
												 name:MPMoviePlayerScalingModeDidChangeNotification 
											   object:mMoviePlayer];
	
    /* Set movie player settings (scaling, controller type and background color) to the currently set values
	 as specified in the Settings application */
	
    /* 
	 Movie scaling mode can be one of: MPMovieScalingModeNone, MPMovieScalingModeAspectFit,
	 MPMovieScalingModeAspectFill, MPMovieScalingModeFill.
	 */
    mMoviePlayer.scalingMode = 0;
    
    /* 
	 Movie control mode can be one of: MPMovieControlModeDefault, MPMovieControlModeVolumeOnly,
	 MPMovieControlModeHidden.
	 */
    mMoviePlayer.movieControlMode = 0;
	
    /*
	 The color of the background area behind the movie can be any UIColor value.
	 */
    UIColor *colors[15] = {[UIColor blackColor], [UIColor darkGrayColor], [UIColor lightGrayColor], [UIColor whiteColor], 
        [UIColor grayColor], [UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor cyanColor], 
        [UIColor yellowColor], [UIColor magentaColor],[UIColor orangeColor], [UIColor purpleColor], [UIColor brownColor], 
	[UIColor clearColor]};
    mMoviePlayer.backgroundColor = colors[ 0 ];
	
}




- (void)playMovie
{
    /*
	 
     As soon as you call the play: method, the player initiates a transition that fades 
     the screen from your current window content to the designated background 
     color of the player. If the movie cannot begin playing immediately, the player 
     object continues displaying the background color and may also display a progress 
     indicator to let the user know the movie is loading. When playback finishes, the 
     player uses another fade effect to transition back to your window content.
     
     */
	
    [mMoviePlayer play];
}



#pragma mark View Controller Routines

// @description - Set the URL of the movie to be played
- (void)setMovieURL: (NSString *)url
{
	if (mMovieURL == nil)
    {
		mMovieURL = [NSURL URLWithString: url];
		[mMovieURL retain];
    }
}



// @description - Return a URL for the movie file in our bundle
- (NSURL *)movieURL
{
    return mMovieURL;
}



// @description - Return the Movie Player instance
- (MPMoviePlayerController *)mMoviePlayer
{
	return mMoviePlayer;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}



- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Low on memory: Release anything that's not essential, such as cached data, or perhaps 
    // unload the movie, etc.
}




- (void)dealloc 
{
	[mMovieURL release];
    
    // remove movie notifications
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerContentPreloadDidFinishNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:mMoviePlayer];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerScalingModeDidChangeNotification
                                                  object:mMoviePlayer];
	
    // free our movie player
    [mMoviePlayer release];
	
    [super dealloc];	
}




@end

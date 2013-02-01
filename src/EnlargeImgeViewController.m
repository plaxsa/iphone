//
//  EnlargeImgeViewController.m
//  MyNews
//
//  Created by ANKUR AGARWAL on 13/01/09.
//  Copyright 2009 UMUNDO INC. All rights reserved.
//

#import "EnlargeImgeViewController.h"


@implementation EnlargeImgeViewController

// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
	{
        // Custom initialization
    }
    return self;
}




// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad
{
   	CGRect frame = self.view.frame;
	//CGRect frame = CGRectMake( 0.0, 0.0, 320.0,350.0);
	self.view.frame = frame;
    [super viewDidLoad];
}


// Whenever view appear the request for ads according to requested url
- (void)viewDidAppear:(BOOL)animated 
{
}


- (void)setImageView:(UIImage *)image
{
	imageView = image;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"");
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc 
{
    [super dealloc];
}


@end

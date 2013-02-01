//
//  SubscribeViewController.h
//  MyNews
//	@description - Handles the interactions on the subscription View
//  Created by ANKUR AGARWAL on 19/12/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SubscribeViewController : UIViewController
{
	IBOutlet UISwitch * switch_one;
	IBOutlet UISwitch * switch_two;
	IBOutlet UISwitch * switch_three;
	IBOutlet UISwitch * switch_four;
	IBOutlet UISwitch * switch_five;
	IBOutlet UISwitch * switch_six;
	IBOutlet UISwitch * switch_seven;
	IBOutlet UISwitch * switch_eight;
	IBOutlet UISwitch * switch_nine;
	IBOutlet UISwitch * switch_Ten;
	
}
//- (void)aboutButtonTouch;
- (IBAction)SubscribeChannels;
- (void)setDefaultSwitchOn;
@end

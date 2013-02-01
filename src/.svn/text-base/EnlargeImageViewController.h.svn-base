//
//  EnlargeImageViewController.h
//  MyNews
//   This class is to display enlarge image when user touch on enlarge button from slide show
//  Created by ANKUR AGARWAL on 15/01/09.
//  Copyright 2009 UMUNDO INC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EnlargeImageViewController : UIViewController<UIScrollViewDelegate>
{
	UIImage *image;
	UIImageView *imageView;
	IBOutlet UIScrollView *scrollView;
	IBOutlet UINavigationBar *navigationBar;
	IBOutlet UIToolbar *toolBar;
	CGRect imgFrameforImage;
	BOOL isClassLoaded;
}
- (void)drawImageOnScreenwhenOrientation;
- (void)drawImageOnScreen;
- (void)setImageView:(UIImage *)image;
- (IBAction)backButton;
@end

//
//  EnlargeImgeViewController.h
//  MyNews
//
//  Created by ANKUR AGARWAL on 13/01/09.
//  Copyright 2009 UMUNDO INC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EnlargeImgeViewController : UIViewController 
{
	UIImage *imageView;
	UIImageView *enlargeImageView;
}
- (void)setImageView:(UIImage *)image;
@end

//
//  CommonUtils.h
//  Umundo
//  @description - Imeplementation of the Common Utility methods
//
//  Created by Y Kamesh Rao on 27/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CommonUtils : NSObject 
{

}

+ (CommonUtils *)commonUtils;
- (void)drawImage: (UIImage *)image inRect: (CGRect)rect;
- (UIImage *)loadImageFromPath: (NSString *)path;
- (UIImage *)loadImageFromURL: (NSString *)url;
- (void)loadImage: (UIImage *)image fromPath: (NSString *)path andDrawInRect: (CGRect)rect;
- (void)loadImage: (UIImage *)image fromURL: (NSString *)url andDrawInRect: (CGRect)rect;
- (UIView *)createMessageViewAndDrawAndAnimateTheImagesInTheArray: (NSArray *)imageArray inFrame: (CGRect)imageFrame andShowMessage: (NSString *)message inFrame: (CGRect)msgFrame;
- (UILabel *)createLabelInFrame: (CGRect)frame  withText: (NSString *)text andAlignment: (UITextAlignment)alignment andTextColor: (UIColor *)textColor andBackColor: (UIColor *)backColor andAlpha: (CGFloat)alpha;
- (UIImage *)loadImage: (NSString *)name;
@end

//
//  Encryptor.h
//  Umundo
//  @description - Imeplementation of the require Encryption algorithms
//
//  Created by Y Kamesh Rao on 19/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Encryptor : NSObject 
{
	NSString *timestamp;
	NSString *wsseHeader;
	NSString *signature;
}

- (void)setWSSEHeader: (NSString *)fileWSSEHeader;
- (NSString *)timestamp;
- (NSString *)wsseHeader;
- (NSString *)signature;
- (NSString *)base64StringFromData: (NSData *)data length: (int)length;
- (void)generateTimestamp;
- (void)generateWSSEHeaderForUsername: (NSString *)username
						  andPassword: (NSString *)password;
- (void)generateBase64WSSEHeaderForUsername: (NSString *)username
								andPassword: (NSString *)password;
- (void)getSignatureForMethod: (NSString *)methodName
				withSecretKey: (NSString *)secretKey;
- (void)getBase64SignatureForMethod: (NSString *)methodName
					  withSecretKey: (NSString *)secretKey;

- (NSString *)getDESEncryptedPassword: (NSString *)password withSecretKey: (NSString *)secretKey;

@end

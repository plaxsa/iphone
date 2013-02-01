//
//  Encryptor.m
//  Umundo
//  @description - Imeplementation of the require Encryption algorithms
//
//  Created by Y Kamesh Rao on 19/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import "Encryptor.h"
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import "General.h"


@implementation Encryptor


- (void)setWSSEHeader: (NSString *)fileWSSEHeader
{
	RELEASEIF(wsseHeader);
	wsseHeader = fileWSSEHeader;
	[wsseHeader retain];
}



- (NSString *)timestamp
{
	return timestamp;
}



- (NSString *)wsseHeader
{
	return wsseHeader;
}




- (NSString *)signature
{
	return signature;
}



// @description - Method to generate the Timestamp
- (void)generateTimestamp
{	
	if(timestamp != nil)
		[timestamp release];
	
	// Get current date and time
	NSDate *today = [NSDate date];
	NSString *tempTS1 = [today description];
	NSRange tempRange;
	
	tempRange.location = 10;
	tempRange.length = 1;
	NSString *tempTS2 = [tempTS1 stringByReplacingCharactersInRange:tempRange withString: @"T"];
	
	tempRange.location = 19;
	tempRange.length = 6;
	NSString *tempTS3 = [tempTS2 stringByReplacingCharactersInRange:tempRange withString: @"Z"];
	
	timestamp = [[NSString alloc] initWithString:tempTS3];
	
	//NSLog(@"Generated Timestamp : %@", timestamp);
}



// @description - Method to generate the signature using HMAC-SHA1 algorithm
- (void)getSignatureForMethod: (NSString *)methodName
				withSecretKey: (NSString *)secretKey
{
	// Remove any existing signature
	if(signature != nil)
		[signature release];
	
	// Create the timestamp if it is nil
	if(timestamp == nil)
		[self generateTimestamp];
	
	NSString *input = [methodName stringByAppendingString: self.timestamp];
	unsigned char output[CC_SHA1_DIGEST_LENGTH];	
	NSData *data	= [input dataUsingEncoding:NSASCIIStringEncoding];
	NSData *key		= [secretKey dataUsingEncoding:NSASCIIStringEncoding];
	
	// Generating the HMAC-SHA1 encoded Signature based on the timestamp and method name
	CCHmac(	kCCHmacAlgSHA1,
			[key bytes],
			[key length],
		    [data bytes],
		    [data length],
		    output
		   );
	
	NSMutableString *hexSignature = [[NSMutableString alloc] initWithCapacity:CC_SHA1_DIGEST_LENGTH*2];
	
	// Convert the result into Hex
	for(int i=0; i<CC_SHA1_DIGEST_LENGTH ; i++)
	{
		unsigned int num = output[i];
		[hexSignature appendFormat:@"%.2X", num];
	}
	
	signature = [[NSString alloc] initWithString:hexSignature];
	
//	//NSLog(@"Signature for method %@ and timestamp %@ is %@", methodName, timestamp, signature);
	
	[hexSignature release];
}



// @description - Method to generate the signature using Base64 Encoding. A light weight alternative for Encryption
- (void)getBase64SignatureForMethod: (NSString *)methodName
					  withSecretKey: (NSString *)secretKey
{
	// Remove any existing signature
	if(signature != nil)
		[signature release];
	
	// Create the timestamp if it is nil
	if(self.timestamp == nil)
		[self generateTimestamp];
	
	NSString *inputTemp = [secretKey stringByAppendingString: methodName];
	NSString *input = [inputTemp stringByAppendingString: timestamp];

	// Encoding the hashed output with Base 64
	signature = [self base64StringFromData:[input dataUsingEncoding:NSASCIIStringEncoding] length: [input length]];
	
	//NSLog(@"Signature for method %@ and timestamp %@ is %@", methodName, timestamp, signature);
}



// @description - Method to generate the WSSE headers for given username and password using SHA1.
- (void)generateWSSEHeaderForUsername: (NSString *)username
						  andPassword: (NSString *)password;
{
	// Create the timestamp if it is nil
	if(timestamp == nil)
		[self generateTimestamp];
	
	// Remove any existing wsse header
	if(wsseHeader != nil)
		[wsseHeader release];
	
	// Store the nonce in the parameter
    NSString *nonce = [timestamp stringByAppendingString:@"Randomizing Further"];
	
    // Creating the SHA1 encrypted and Base64 encoded Password Digest
    NSMutableString *parameters = [[NSMutableString alloc] initWithCapacity:2000];
   	
   	// Adding the Nonce, Timestamp and password to be enrypted and encoded
   	[parameters appendString:nonce];
	[parameters appendString:timestamp];
	[parameters appendString:password];
    
   	// Initialising the input and output for Digest creation
	NSData *input = [parameters dataUsingEncoding:NSASCIIStringEncoding];
	unsigned char output[CC_SHA1_DIGEST_LENGTH];
	
	// SHA1 Digest Creation
    CC_SHA1([input bytes], [input length], output);
	
    // Encoding the hashed output with Base 64
	NSData *result = [NSData dataWithBytes:output length:CC_SHA1_DIGEST_LENGTH];
	NSString *passwordDigest = [self base64StringFromData:result length: [result length]];
    
    // Encode the Nonce in Base64
   	NSString *nonceEncoded = [self base64StringFromData:[nonce dataUsingEncoding:NSASCIIStringEncoding] length: [nonce length]];
	
	NSMutableString *wsseHeaderTemp = [[NSMutableString alloc] initWithCapacity:1000];
	
	[wsseHeaderTemp appendString:@"UsernameToken Username=\""];
	[wsseHeaderTemp appendString:username];
	[wsseHeaderTemp appendString:@"\", PasswordDigest=\""];
	[wsseHeaderTemp appendString:passwordDigest];
	[wsseHeaderTemp appendString:@"\", Created=\""];
	[wsseHeaderTemp appendString:timestamp];
	[wsseHeaderTemp appendString:@"\", Nonce=\""];
	[wsseHeaderTemp appendString:nonceEncoded];
	[wsseHeaderTemp appendString:@"\", groupAlias=\""];
	[wsseHeaderTemp appendString:GROUP_ALIAS];
	[wsseHeaderTemp appendString:@"\""];
	
	wsseHeader = [[NSString alloc] initWithString:wsseHeaderTemp];
	
	////////NSLog(@"WSSE Header Generated - %@", self.wsseHeader);
	
	[wsseHeaderTemp release];
	[parameters release];
}



// @description - Method to generate the Base64 WSSE headers for given username and password.
- (void)generateBase64WSSEHeaderForUsername: (NSString *)username
								andPassword: (NSString *)password;
{	
	// Create the timestamp if it is nil
	if(self.timestamp == nil)
		[self generateTimestamp];
	
	// Remove any existing wsse header
	if(wsseHeader != nil)
		[wsseHeader release];
	
	/*
	 Algorithm 
	 
	 var w = encode64(Password);
     var header = 'UsernameBase64 Username="' + Username + '", PasswordDigest="' + w + '"';
     return header;
	 
	 */
	
	// Encoding the password with Base 64
	NSString *passwordDigest = [self base64StringFromData:[password dataUsingEncoding:NSASCIIStringEncoding] length: [password length]];
	NSMutableString *wsseHeaderTemp = [[NSMutableString alloc] initWithCapacity:1000];
	
	[wsseHeaderTemp appendString:@"UsernameBase64 Username=\""];
	[wsseHeaderTemp appendString:username];
	[wsseHeaderTemp appendString:@"\" , PasswordDigest=\""];
	[wsseHeaderTemp appendString:passwordDigest];
	[wsseHeaderTemp appendString:@"\""];
	
	wsseHeader = [[NSString alloc] initWithString:wsseHeaderTemp];
	[wsseHeaderTemp release];
	[passwordDigest release];
}



// @description - Generated a DES encrypted Base 64 encoded password
- (NSString *)getDESEncryptedPassword: (NSString *)password withSecretKey: (NSString *)secretKey
{
	// Hasshing the secret key to generate the key for DES encryption
	unsigned char key[CC_SHA1_DIGEST_LENGTH];	
	NSData *secKey	= [secretKey dataUsingEncoding:NSASCIIStringEncoding];
	
	// Generating the HMAC-SHA1 encoded Signature based on the timestamp and method name
	CC_SHA1([secKey bytes],
			[secKey length],
			key
		   );
			
	
	// DES encryptiion
	NSData *desKey = [NSData dataWithBytes: key length: kCCKeySizeDES]; // 8 - Since we are interested in the first 8 bytes only
	NSData *data; 
	NSMutableData *mutData;
	
	data = [password dataUsingEncoding: NSASCIIStringEncoding];
	mutData  = [NSMutableData dataWithBytes:[data bytes] length:[data length]];
	
	if([mutData length] % 8 > 0)
	{
		int zero = 0x00;
		while([mutData length] % 8 != 0)
		{
			[mutData appendBytes:&zero length:1];
		}
	}
	
	unsigned char output[kCCContextSizeDES];
	size_t outMoved;
	
	CCCryptorStatus res;
	res =  CCCrypt(
				   kCCEncrypt, 
				   kCCAlgorithmDES,
				   kCCOptionECBMode,
				   [desKey bytes],
				   [desKey length],
				   NULL,
				   [mutData bytes],
				   [mutData length],
				   output,
				   kCCContextSizeDES,
				   &outMoved
				   );
	
	// Encoding the encrypted output with Base 64
	NSData *result = [NSData dataWithBytes:output length:outMoved];
	NSString *encryptedPassword = [self base64StringFromData:result length: [result length]];
	
	return encryptedPassword;
}



static char base64EncodingTable [64] = 
{
'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
}; 

// @description - Method to generate the Base 64 encoded straing of the input Data
- (NSString *)base64StringFromData: (NSData *)data length: (int)length
{
	unsigned long ixtext, lentext;
	long ctremaining;
	unsigned char inbuf [3], outbuf [4];
	short i, charsonline = 0, ctcopy;
	const unsigned char *raw;
	NSMutableString *theString;
    
	lentext = [data length];
	
	if (lentext < 1)
	{
		return @"";
	}
	
 	theString = [NSMutableString stringWithCapacity: lentext];
 	
 	raw = [data bytes];
	
	ixtext = 0; 
 	
	while (true) {
		ctremaining = lentext - ixtext;
		
		if (ctremaining <= 0)
		{
			break;
		}
		
		for (i = 0; i < 3; i++)
		{ 
			unsigned long ix = ixtext + i;
			
			if (ix < lentext)
			{
				inbuf [i] = raw [ix];
			}
			else
			{
				inbuf [i] = 0;
			}
		}
		
		outbuf[0] = (inbuf[0] & 0xFC) >> 2;
		outbuf[1] = ((inbuf[0] & 0x03) << 4) | ((inbuf[1] & 0xF0) >> 4);
		outbuf[2] = ((inbuf[1] & 0x0F) << 2) | ((inbuf[2] & 0xC0) >> 6);
		outbuf[3] = inbuf[2] & 0x3F;
		
		ctcopy = 4;
		
		switch (ctremaining)
		{
			case 1: 
				ctcopy = 2; 
				break;
			case 2: 
				ctcopy = 3; 
				break;
		}
		
		for (i = 0; i < ctcopy; i++)
		{
			NSString *s = [[NSString alloc] initWithFormat:@"%c", base64EncodingTable [outbuf[i]]];
			[theString appendString:s];
			[s release];
		}
		
		for (i = ctcopy; i < 4; i++)
		{
			[theString appendString: @"="];
		}
		
		ixtext += 3;
		charsonline += 4;
		
		if (length > 0)
		{
			if (charsonline >= length)
			{
				charsonline = 0;
				
				//[theString appendString: @"\n"];
			}
		}
	}
	
	return theString;
}




- (void) dealloc
{
	[timestamp release];
	[wsseHeader release];
	[signature release];
	[super dealloc];	
}

@end

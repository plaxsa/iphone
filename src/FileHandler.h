//
//  FileHandler.h
//  Umundo
//  @description - Declaration of the file handling methods
//
//  Created by Umundo Inc on 7/30/08.
//  Copyright 2008 Umundo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface FileHandler : NSObject 
{
	BOOL _IsDone;
}

-(BOOL)WriteToFile:(NSString *)path:(NSData *)contents:(NSDictionary *)attributes;
-(BOOL)CreateNewFile:(NSString *)path:(NSDictionary *)attributes;
-(BOOL)CreateNewDirectory:(NSString *)path:(NSDictionary *)attributes;
-(BOOL)RemoveFile:(NSString *)path;
-(BOOL)IsFileExists:(NSString *)path;
-(NSData*)ReadFileContent:(NSString*)path;
-(NSArray*)ContentofDirectory:(NSString *)path;
@end

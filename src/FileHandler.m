//
//  FileHandler.m
//  Umundo
//  @description - Imeplementation of the File Handling methods
//
//  Created by Umundo Inc on 7/30/08.
//  Copyright 2008 Umundo Inc. All rights reserved.
//

#import "FileHandler.h"

@implementation FileHandler


- (BOOL)IsFileExists:(NSString *)path
{
	NSFileManager *fileManager = [NSFileManager defaultManager];
   _IsDone=[fileManager fileExistsAtPath:path];
	[fileManager release];
	return _IsDone;
}



- (BOOL)CreateNewDirectory:(NSString *)path:(NSDictionary *)attributes
{
	NSFileManager *fileManager = [NSFileManager defaultManager];
	_IsDone=[fileManager createDirectoryAtPath:path attributes:attributes];
	[fileManager release];
	return _IsDone;
}


- (BOOL)CreateNewFile:(NSString *)path:(NSDictionary *)attributes
{
	NSFileManager *fileManager = [NSFileManager defaultManager];
	_IsDone=[fileManager createFileAtPath:path contents:nil attributes:attributes];
	[fileManager release];
	return _IsDone;
}




- (BOOL)WriteToFile:(NSString *)path:(NSData *)contents:(NSDictionary *)attributes
{
	BOOL IsRemoved;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	BOOL IsExist=[self IsFileExists:path];
	if (IsExist == YES)
	{
		IsRemoved =[self RemoveFile:path];
		if (IsRemoved == YES)
		{
			_IsDone=[fileManager createFileAtPath:path contents:contents attributes:attributes];
		}
	}
	else
	{
	  _IsDone=[fileManager createFileAtPath:path contents:contents attributes:attributes];
	}
	if (_IsDone == YES)
	{
		NSData *content= [self ReadFileContent:path];
		if (content.length == contents.length)
		{
			_IsDone = YES;
		}
		else
		{
			_IsDone =NO;
		}
	}	
	
	[fileManager release];
	return _IsDone;
}



- (BOOL)RemoveFile:(NSString *)path
{
	NSFileManager *fileManager = [NSFileManager defaultManager];
	BOOL IsDeletable=[fileManager isDeletableFileAtPath:path];
	if(IsDeletable == YES)
	{
		_IsDone=(int)[fileManager removeItemAtPath:path error: nil];
	}
	[fileManager release];
	return _IsDone;
}



- (NSData*)ReadFileContent:(NSString*)path
{
	NSData *res3;
	BOOL IsReadable;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	IsReadable=[fileManager isReadableFileAtPath:path];
	if(IsReadable == YES)
	{
	 res3=[fileManager contentsAtPath:path];
	}
	else
	{
		res3=nil;
	}
	[fileManager release];
	return res3;
}



- (NSArray*)ContentofDirectory:(NSString *)path
{
	NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *dd=[fileManager directoryContentsAtPath:path];
	[fileManager release];
    return dd;
}

@end

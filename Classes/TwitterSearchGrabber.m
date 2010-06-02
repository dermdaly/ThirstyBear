//
//  TwitterSearchGrabber.m
//  ThirstyBear
//
//  Created by Dermot Daly on 02/06/2010.
//  Copyright 2010 tapadoo. All rights reserved.
//

#import "TwitterSearchGrabber.h"
#import "JSON.h"

@implementation TwitterSearchGrabber
- (id) processData:(NSData *)retrievedWebData Error:(NSError **)error {
	SBJSON *js = [[SBJSON alloc] init];
	NSString *jsonStr = [[NSString alloc] initWithData:retrievedWebData encoding:NSUTF8StringEncoding];
	return [js objectWithString:jsonStr];
}

@end

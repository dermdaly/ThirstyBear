//
//  AsychronousDataGrabber.m
//  Sobchak
//
//  Created by Dermot Daly on 07/04/2010.
//  Copyright 2010 tapadoo. All rights reserved.
//
// Note: This is not open source.  No license is granted on the use of the AsychronousDataGrabber code.

#import "AsychronousDataGrabber.h"


@implementation AsychronousDataGrabber
@synthesize delegate;

- (id) processData:(NSData *)retrievedWebData Error:(NSError **)error {
	// This method should be overwritten in sub-classes
	NSDictionary *dict = [NSDictionary dictionaryWithObject:@"Not implemented" forKey:NSLocalizedDescriptionKey];
	if(error) {
		*error = [NSError errorWithDomain:@"AsychronousDataGrabber" code:1 userInfo:dict];
	}
	return nil;
}

-(void) signalError:(NSError *)error {
	if(delegate && [delegate respondsToSelector:@selector(asychronousDataGrabberDelegate:didFailWithError:)]) {
		[delegate asychronousDataGrabberDelegate:self didFailWithError:error];
	}
}

-(void) signalReady:(id)retrievedData {
	if(delegate && [delegate respondsToSelector:@selector(asychronousDataGrabber:dataReady:)]) {
		[delegate asychronousDataGrabber:self dataReady:retrievedData];
	}
}


-(void) getDataFromFeed:(NSString *)feedURL {
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:feedURL]];
	NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	if(conn != nil) {
		webData = [[NSMutableData data]retain];
	} else {
		[self signalError:nil];
	}
}

#pragma mark -
#pragma mark NSURLConnection delegates
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    [connection release];
    [webData release];
	
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	[self signalError:error];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSError *error = nil;
    // do something with the data
	id processedData = [self processData:webData Error:&error];
	if(error != nil) {
		[self signalError:error];
	}
	
    // release the connection, and the data object
    [webData release];
    [connection release];
	[self signalReady:processedData];
}

@end

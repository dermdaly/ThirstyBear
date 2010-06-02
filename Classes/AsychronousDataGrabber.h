//
//  AsychronousDataGrabber.h
//  Sobchak
//
//  Created by Dermot Daly on 07/04/2010.
//  Copyright 2010 tapadoo. All rights reserved.
//
// Note: This is not open source.  No license is granted on the use of the AsychronousDataGrabber code.
@class AsychronousDataGrabber;
@protocol AsychronousDataGrabberDelegate <NSObject>
-(void) asychronousDataGrabber:(AsychronousDataGrabber *)grabber dataReady:(id)retrievedData;
-(void) asychronousDataGrabberDelegate:(AsychronousDataGrabber *)grabber didFailWithError:(NSError *)error;

@end

@interface AsychronousDataGrabber : NSObject {
	id <AsychronousDataGrabberDelegate> delegate;
	NSMutableData *webData;
}

@property (nonatomic, assign) id<AsychronousDataGrabberDelegate> delegate;
-(void) getDataFromFeed:(NSString *)feedURL;

@end

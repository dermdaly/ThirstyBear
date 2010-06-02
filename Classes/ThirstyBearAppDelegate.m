//
//  ThirstyBearAppDelegate.m
//  ThirstyBear
//
//  Created by Dermot Daly on 02/06/2010.
//  Copyright tapadoo 2010. All rights reserved.
//

#import "ThirstyBearAppDelegate.h"


@implementation ThirstyBearAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end


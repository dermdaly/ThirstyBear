//
//  ThirstyBearAppDelegate.h
//  ThirstyBear
//
//  Created by Dermot Daly on 02/06/2010.
//  Copyright tapadoo 2010. All rights reserved.
//

@interface ThirstyBearAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end


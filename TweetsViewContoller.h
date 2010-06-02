//
//  TweetsViewContoller.h
//
//  Created by Dermot Daly on 02/06/2010.
//  Copyright 2010 tapadoo.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AsychronousDataGrabber.h"
@interface TweetsViewContoller : UIViewController <AsychronousDataGrabberDelegate, UITableViewDelegate, UITableViewDataSource> {
	UITableView *tweetsTable;
	UIView *hudView;
	NSDictionary *searchResults;
}

@property (nonatomic, retain) IBOutlet UIView *hudView;
@property (nonatomic, retain) IBOutlet  UITableView *tweetsTable;

@end

//
//  TweetsViewContoller.m
//
//  Created by Dermot Daly on 02/06/2010.
//  Copyright 2010 tapadoo.com. All rights reserved.
//

#import "TweetsViewContoller.h"
#import "TwitterSearchGrabber.h"
#define kCellId @"TweetCellId"
@implementation TweetsViewContoller

@synthesize hudView;
@synthesize tweetsTable;

- (void)viewDidUnload {
	self.hudView = nil;

	self.tweetsTable = nil;

}

- (void)dealloc
{
	[tweetsTable release];
	[hudView release];
	[super dealloc];
}

-(void) asychronousDataGrabber:(AsychronousDataGrabber *)grabber dataReady:(id)retrievedData {
	hudView.hidden = YES;
	[searchResults release];
	searchResults = [[[NSDictionary alloc] initWithDictionary:(NSDictionary *)retrievedData] retain];
	[tweetsTable reloadData];
	
	NSLog(@"Data retrieved");
}

-(void) asychronousDataGrabberDelegate:(AsychronousDataGrabber *)grabber didFailWithError:(NSError *)error {
	NSLog(@"Error");
}

-(void) viewDidLoad {
	TwitterSearchGrabber *grabber = [[TwitterSearchGrabber alloc] init];
	grabber.delegate = self;
	[grabber getDataFromFeed:@"http://search.twitter.com/search.json?q=%23paddyinvasion"];
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	if(searchResults == nil) {
		return 0;
	}
	NSArray *tweets = [searchResults objectForKey:@"results"];
	return [tweets count];
}

- (UITableViewCell *) createTweetCell {
	UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellId] autorelease];
	cell.textLabel.font = [UIFont systemFontOfSize:14.0];
	cell.textLabel.textColor = [UIColor blueColor];
	return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
	if(cell == nil) {
		cell = [self createTweetCell];
	}
	NSArray *tweets = [searchResults objectForKey:@"results"];
	NSDictionary *theTweet = [tweets objectAtIndex:indexPath.row];
	cell.textLabel.text = [NSString stringWithFormat:@"@%@", [theTweet objectForKey:@"from_user"]];
	cell.detailTextLabel.text = [theTweet objectForKey:@"text"];
	return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate


@end

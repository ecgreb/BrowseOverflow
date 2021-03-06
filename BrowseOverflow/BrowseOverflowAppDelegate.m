//
//  BrowseOverflowAppDelegate.m
//  BrowseOverflow
//
//  Created by Graham J Lee on 17/02/2011.
//  Copyright 2011 Fuzzy Aliens Ltd. All rights reserved.
//

#import "BrowseOverflowAppDelegate.h"
#import "BrowseOverflowViewController.h"
#import "BrowseOverflowObjectConfiguration.h"
#import "TopicTableDataSource.h"
#import "Topic.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"

@interface BrowseOverflowAppDelegate ()

- (NSArray *)topics;

@end

@implementation BrowseOverflowAppDelegate

@synthesize window=_window;

@synthesize navigationController=_navigationController;

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

- (NSArray *)topics {
    NSString *tags[] = { @"iphone", @"cocoa-touch", @"uikit", @"objective-c", @"xcode" };
    NSString *names[] = { @"iPhone", @"Cocoa Touch", @"UIKit", @"Objective-C", @"Xcode" };
    NSMutableArray *topicList = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        Topic *thisTopic = [[Topic alloc] initWithName: names[i] tag: tags[i]];
        [topicList addObject: thisTopic];
    }
    return [topicList copy];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self logTest];
    BrowseOverflowViewController *firstViewController = [[BrowseOverflowViewController alloc] initWithNibName: nil bundle: nil];
    firstViewController.objectConfiguration = [[BrowseOverflowObjectConfiguration alloc] init];
    TopicTableDataSource *dataSource = [[TopicTableDataSource alloc] init];
    [dataSource setTopics: [self topics]];
    firstViewController.dataSource = dataSource;
    self.navigationController.viewControllers = [NSArray arrayWithObject: firstViewController];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)logTest {
    NSLog(@"didFinishLaunchingWithOptions");
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    DDLogError(@"Error");
    DDLogWarn(@"Warn");
    DDLogInfo(@"Info");
    DDLogVerbose(@"Verbose");
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}


@end

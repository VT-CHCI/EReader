//
//  EReaderAppDelegate.m
//  EReader
//
//  Created by Sam Foster on 8/11/09.
//  Copyright 2009. All rights reserved.
//

#import "EReaderAppDelegate.h"
#import "EReaderViewController.h"

@implementation EReaderAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end

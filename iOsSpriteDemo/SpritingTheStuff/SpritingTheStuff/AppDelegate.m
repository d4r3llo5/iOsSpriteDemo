//
//  AppDelegate.m
//  SpritingTheStuff
//
//  Created by MTS on 4/12/15.
//  Copyright (c) 2015 +|. All rights reserved.
//

#import "AppDelegate.h"
#import "SpriteSceneView.h"
#import "DemoSpriteViewController.h"
#import "DemoMainMenuControllerViewController.m"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Create home window
//    DemoSpriteViewController* mainMenu;
//    mainMenu = [[DemoSpriteViewController alloc] initWithNibName:@"DemoSpriteViewController"
//                                                              bundle:[NSBundle mainBundle]];     // Init window with the NiB

    DemoMainMenuControllerViewController* mainMenu;
    mainMenu = [[DemoMainMenuControllerViewController alloc] initWithNibName:@"DemoMainMenuControllerViewController" bundle:[NSBundle mainBundle]];
    
    // Set the first window to be the title screen
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = mainMenu;
    
    // Draw it?
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

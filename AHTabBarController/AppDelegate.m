//
//  AppDelegate.m
//  AHTabBarController
//
//  Created by Arthur Hemmer on 09/08/14.
//  Copyright (c) 2014 Arthur Hemmer. All rights reserved.
//

#import "AppDelegate.h"

#import "AHTabBarController.h"

@implementation AppDelegate

-(void)setupMenu
{
    AHTabBarController *tabBarController = (AHTabBarController*)self.window.rootViewController;
    tabBarController.containerUnderTabBar = NO;
    
    /******* PURUS *******/
    AHTabView *purus = [AHTabView new];
    [purus setup:@"Purus" image:[UIImage imageNamed:@"persondot"]];
    
    AHSubitemView *pFirst = [AHSubitemView new];
    [pFirst setup:@"First" image: [UIImage imageNamed:@"persondot"] controllerBlock:^UIViewController * _Nonnull{
        UINavigationController *controller = [tabBarController.storyboard instantiateViewControllerWithIdentifier:@"PurusFirst"];
        return controller;
    }];
    
    [purus addSubitem:pFirst];
    
    AHSubitemView *pSecond = [AHSubitemView new];
    UIView *pSecondCustomView = [UIView.alloc init];
    [pSecondCustomView addSubview:[UIImageView.alloc initWithImage:[UIImage imageNamed:@"newspaper"]]];
    UIActivityIndicatorView *indicatorView = [UIActivityIndicatorView.alloc init];
    [indicatorView setColor:[UIColor blueColor]];
    [indicatorView startAnimating];
    [pSecondCustomView addSubview:indicatorView];
    // TODO: center indicator view
    [pSecond setup:@"Second" customView:pSecondCustomView controllerBlock:^UIViewController * _Nonnull{
        UINavigationController *controller = [tabBarController.storyboard instantiateViewControllerWithIdentifier:@"PurusSecond"];
        return controller;
    }];
    
    [purus addSubitem:pSecond];

    /******* FRINGILLA *******/
    AHTabView *fringilla = [AHTabView new];
    [fringilla setup:@"Fringilla" image:[UIImage imageNamed:@"receipt"]];
    
    AHSubitemView *fFirst = [AHSubitemView new];
    [fFirst setup:@"First" image:[UIImage imageNamed:@"photos"] controllerBlock:^UIViewController * _Nonnull{
        UINavigationController *controller = [tabBarController.storyboard instantiateViewControllerWithIdentifier:@"FringillaFirst"];
        return controller;
    }];
    
    [fringilla addSubitem:fFirst];
//
//    AHSubitemView *fSecond = [AHSubitemView new];
//    [fSecond setImage:[UIImage imageNamed:@"tv"]];
//    [fSecond setTitle:@"Second"];
//    [fSecond setViewControllerIdentifier:@"FringillaSecond"];
//    [fringilla addSubitem:fSecond];
//    
//    AHSubitemView *fThird = [AHSubitemView new];
//    [fThird setImage:[UIImage imageNamed:@"user"]];
//    [fThird setTitle:@"Third"];
//    [fThird setViewControllerIdentifier:@"FringillaThird"];
//    [fringilla addSubitem:fThird];
//    
//    /******* IPSUM *******/
//    AHTabView *ipsum = [AHTabView new];
//    [ipsum setImage:[UIImage imageNamed:@"user"]];
//    [ipsum setTitle:@"Ipsum"];
//    
//    AHSubitemView *iFirst = [AHSubitemView new];
//    [iFirst setImage:[UIImage imageNamed:@"photos"]];
//    [iFirst setTitle:@"First"];
//    [iFirst setViewControllerIdentifier:@"IpsumFirst"];
//    [ipsum addSubitem:iFirst];
//    
    //Don't forget to add your AHTabView instances to the AHTabBarController!
//    [tabBarController.tabs addObjectsFromArray:@[purus, fringilla, ipsum]];
    [tabBarController.tabs addObjectsFromArray:@[purus, fringilla]];

}

#pragma mark - App lifecycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setupMenu];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

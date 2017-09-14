//
//  AppDelegate.h
//  NSUDTableView
//
//  Created by Joss Manger on 9/14/17.
//  Copyright © 2017 Joss Manger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@property (readonly) NSDictionary *settings;

@end


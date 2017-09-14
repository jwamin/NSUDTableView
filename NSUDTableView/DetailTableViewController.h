//
//  DetailTableViewController.h
//  NSUDTableView
//
//  Created by Joss Manger on 9/14/17.
//  Copyright © 2017 Joss Manger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewController : UITableViewController

@property NSArray *settings;

-(void)setCellSettings:(NSArray*)settings;

@end

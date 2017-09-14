//
//  ViewController.h
//  NSUDTableView
//
//  Created by Joss Manger on 9/14/17.
//  Copyright © 2017 Joss Manger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *table;

@end


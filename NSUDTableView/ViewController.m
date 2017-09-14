//
//  ViewController.m
//  NSUDTableView
//
//  Created by Joss Manger on 9/14/17.
//  Copyright © 2017 Joss Manger. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "DetailTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray*)getGroups{
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSDictionary *settings = delegate.settings;
    NSArray *prefs = [settings objectForKey:@"PreferenceSpecifiers"];
    
    NSMutableArray *groups = [[NSMutableArray alloc]init];
    
    for (NSDictionary *pref in prefs) {
        NSString *type = [pref objectForKey:@"Type"];
        if ([type isEqual:@"PSGroupSpecifier"]) {
            [groups addObject:[pref objectForKey:@"Title"]];
        }
    }
    
    return [[NSArray alloc]initWithArray:groups];
    
}

-(NSArray*)getSelectedSettingsGroup:(NSInteger)index {
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSDictionary *settings = delegate.settings;
    NSArray *prefs = [settings objectForKey:@"PreferenceSpecifiers"];
    
    NSMutableArray *settingsKeys = [[NSMutableArray alloc]init];
    Boolean arrived = false;
    int groupCount = 0;
    
    for (NSDictionary *pref in prefs) {
        NSString *type = [pref objectForKey:@"Type"];
        if ([type isEqual:@"PSGroupSpecifier"]) {
            
            if(groupCount==index){
                arrived = true;
            } else {
                arrived = false;
            }
            groupCount++;
        }
        
        if ([type isEqual:@"PSToggleSwitchSpecifier"] && (arrived==YES)) {
            [settingsKeys addObject:pref];
        }
        
        
    }
    
    return [[NSArray alloc]initWithArray:settingsKeys];

    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self getGroups]count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"masterCell"];
    cell.textLabel.text = [[self getGroups]objectAtIndex:indexPath.row];
    return cell;
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%@",sender);
    
    DetailTableViewController *detailView = (DetailTableViewController*)[segue destinationViewController];
    NSArray *selectedSettings = [self getSelectedSettingsGroup:[[_table indexPathForSelectedRow]row]];
    NSLog(@"selected settings from table: %@",selectedSettings);
    [detailView setCellSettings:selectedSettings];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [_table deselectRowAtIndexPath:[_table indexPathForSelectedRow] animated:YES];
}

@end

//
//  DeviceViewController.m
//  MyStore
//
//  Created by Eileen Mack on 9/7/15.
//  Copyright (c) 2015 Eileen Mack. All rights reserved.
//

#import "BoxViewController.h"
#import "ReedDetailViewController.h"
#import "Reed.h"
#import "Box.h"

@interface BoxViewController ()

@property (strong) NSMutableArray *boxes;
@property (assign) int dataFromA;

@end

@implementation BoxViewController

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Box"];
    self.boxes = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.boxes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Box *box = [self.boxes objectAtIndex:indexPath.row];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@ %@", box.brand, box.size]];
    [cell.detailTextLabel setText:box.locationStarted];
    NSLog(@"BOXES LOADED!!! %@", self.boxes);
    NSLog(@"BOX LOADED!!! %@", box);
    NSLog(@"SIZE LOADED!!! %@", box.size);
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete object from database
        [context deleteObject:[self.boxes objectAtIndex:indexPath.row]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        // Remove device from table view
        [self.boxes removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ReedDetailViewController *destViewController = segue.destinationViewController;
    
    if (! [[segue identifier] isEqualToString:@"Back"]) {
    destViewController.sourceView = segue.sourceViewController;
    }
    
    if ([[segue identifier] isEqualToString:@"UpdateBox"]) {
        
        Box *selectedBox = [self.boxes objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        NSLog(@"selectedBox");
        NSLog(@"reed %@", selectedBox);
        destViewController.box = selectedBox;

    }
}


/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SelectReed"]) {
        NSLog(@"SelectReed");
        NSManagedObject *selectedReed = [self.reeds objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        NSLog(@"reed %@", selectedReed);
        
        ReedPropertyViewController *destViewController = segue.destinationViewController;
        destViewController.reed = selectedReed;
        NSLog(@"DVC %@", destViewController );
        
    }
    
    if ([[segue identifier] isEqualToString:@"SelectReed2"]) {
        NSLog(@"SelectReed2");
        Reed *selectedReed = [self.reeds objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        NSLog(@"***reed***2 %@", selectedReed);
        UINavigationController *navController = segue.destinationViewController;
        NSLog(@"NAV %@", navController );
        NSLog(@"TOPVC %@", [navController topViewController] );
        ReedPropertyViewController *destViewController = navController.topViewController;
        NSLog(@"DVC %@", destViewController );
        destViewController.reed = selectedReed;
        
    }
}

*/
/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

@end

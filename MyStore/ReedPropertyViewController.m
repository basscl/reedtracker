//
//  ReedPropertyViewController.m
//  MyStore
//
//  Created by Eileen Mack on 2/4/16.
//  Copyright (c) 2016 Eileen Mack. All rights reserved.
//

#import "ReedPropertyViewController.h"
#import "PropertyDetailViewController.h"
//#import "Reed.h"
#import "ReedPropertyBundle.h"

@interface ReedPropertyViewController ()

@property (strong) NSMutableArray *matchingBundles;
@property (strong) NSMutableArray *allBundles;
@property (strong, nonatomic) NSSet *bundleSet;

@end

@implementation ReedPropertyViewController





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
    NSLog(@"RPVC viewDidLoad %@", self);

    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    //NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    //NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"ReedPropertyBundle"];
    //self.allBundles = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    //if (self.reed) {
    //    NSLog(@"self.reed");
    self.bundleSet = self.reed.reedProps;
    //self.matchingBundles = [[NSMutableArray alloc] initWithObjects:[self.bundleSet allObjects], nil];
    self.matchingBundles =[[self.bundleSet allObjects] mutableCopy];


        [self.tableView reloadData];
//}
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
    return [self.matchingBundles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    
   if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }

    
    // Configure the cell...
    NSManagedObject *bundle = [self.matchingBundles objectAtIndex:indexPath.row];

    [cell.textLabel setText:[NSString stringWithFormat:@"%@", [bundle valueForKey:@"date"]]];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@", [bundle valueForKey:@"judgement"]]];
    NSLog(@"PROPS LOADED!!! %@", self.matchingBundles[0]);
    NSLog(@"PROP LOADED!!! %@", bundle);
    NSLog(@"DATE LOADED!!! %@", [bundle valueForKey:@"date"]);
    NSLog(@"JUDGEMENT LOADED!!! %@", [bundle valueForKey:@"judgement"]);

    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"UpdateProperty"]) {
        NSLog(@"selectedProperty");
        ReedPropertyBundle *selectedProperty = [self.matchingBundles objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];

        NSLog(@"property %@", selectedProperty);
        PropertyDetailViewController *destViewController = segue.destinationViewController;
        destViewController.property = selectedProperty;
        //NSLog(@"self.reed %@", self.reed);
        //destViewController.reed = self.reed;
        //NSLog(@"sending reed %@", destViewController.reed);
        
        
    }
    
    if ([[segue identifier] isEqualToString:@"AddProperty"]) {
        //NSLog(@"selectedProperty");
        //NSManagedObject *selectedProperty = [self.matchingBundles objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        
        //NSLog(@"property %@", selectedProperty);
        PropertyDetailViewController *destViewController = segue.destinationViewController;
        //destViewController.property = selectedProperty;
        NSLog(@"self.reed %@", self.reed);
        destViewController.reed = self.reed;
        NSLog(@"sending reed %@", destViewController.reed);
        
    }
}




- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete object from database
        [context deleteObject:[self.matchingBundles objectAtIndex:indexPath.row]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        // Remove device from table view
        [self.matchingBundles removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}



@end
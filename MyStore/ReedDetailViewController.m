//
//  DeviceDetailViewController.m
//  MyStore
//
//  Created by Eileen Mack on 9/7/15.
//  Copyright (c) 2015 Eileen Mack. All rights reserved.
//

#import "ReedDetailViewController.h"

@interface ReedDetailViewController ()

@end

@implementation ReedDetailViewController

@synthesize reed;

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog (@"source class %@", [self presentingViewController].class);
    NSLog (@"is ReedViewController %d", [[self.sourceView.class description]  isEqual: @"ReedViewController"]);
 
    if ([[self.sourceView.class description]  isEqual: @"ReedViewController"]){
    // Do any additional setup after loading the view.
        if (self.reed) {
            self.reedBrandTextField.text = self.reed.reedBrand;
            self.reedSizeTextField.text = self.reed.reedSize;
            self.reedPropertyTextField.text = self.reed.reedIdMark;
        }
    }
    
    else if ([[self.sourceView.class description]  isEqual: @"BoxViewController"]){
        // Do any additional setup after loading the view.
        if (self.box) {
            self.reedBrandTextField.text = self.box.brand;
            self.reedSizeTextField.text = self.box.size;
            self.reedPropertyTextField.text = self.box.idMark;
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if ([[self.sourceView.class description]  isEqual: @"ReedViewController"]){
        if (self.reed) {
            // Update existing device
            self.reed.reedBrand = self.reedBrandTextField.text;
            self.reed.reedSize  = self.reedSizeTextField.text;
            self.reed.reedIdMark  = self.reedPropertyTextField.text;
            
        } else {
            // Create a new device
            Reed *newReed = [NSEntityDescription insertNewObjectForEntityForName:@"Reed" inManagedObjectContext:context];
            newReed.reedBrand = self.reedBrandTextField.text;
            newReed.reedSize  = self.reedSizeTextField.text;
            newReed.reedIdMark  = self.reedPropertyTextField.text;
        }
    }
    else if ([[self.sourceView.class description]  isEqual: @"BoxViewController"]){
        if (self.box) {
            // Update existing device
            //TECHNICALLY THIS SHOULD ALSO UPDATE ALL CHILD REEDS. PERHAPS CHILD REEDS SHOULDN'T HAVE THEIR OWN PROPERTIES?
            self.box.brand = self.reedBrandTextField.text;
            self.box.size  = self.reedSizeTextField.text;
            self.box.idMark = self.reedPropertyTextField.text;
            
            NSSet *reedSet = self.box.reeds;
            NSMutableArray *matchingReeds =[[reedSet allObjects] mutableCopy];
            
            //update child reeds
            for (Reed *myReed in matchingReeds) {
                myReed.reedSize = self.box.size;
                myReed.reedBrand = self.box.brand;
                myReed.reedIdMark = self.box.idMark;
            }
            
        } else {
            // Create a new device
            Box *newBox = [NSEntityDescription insertNewObjectForEntityForName:@"Box" inManagedObjectContext:context];
            newBox.brand = self.reedBrandTextField.text;
            newBox.size  = self.reedSizeTextField.text;
            newBox.idMark = self.reedPropertyTextField.text;
            [newBox add10Reeds]; // would need to be add5Reeds for bass boxes
        }
    }

    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

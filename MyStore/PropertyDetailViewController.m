//
//  PropertyDetailViewController.m
//  MyStore
//
//  Created by Eileen Mack on 2/16/16.
//  Copyright (c) 2016 Eileen Mack. All rights reserved.
//

#import "PropertyDetailViewController.h"

@interface PropertyDetailViewController ()


@end

@implementation PropertyDetailViewController

@synthesize property;
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
                NSLog(@"initialized property %@", self.property);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"received self.reed %@", self.reed);
    
    if (self.property) {
        self.Date.text = self.property.date;
        self.Judgement.text = self.property.judgement;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.property) {
        // Update existing device
        self.property.date = self.Date.text;
        self.property.judgement = self.Judgement.text;
        
    } else {
        // Create Property
        NSEntityDescription *entityProp = [NSEntityDescription entityForName:@"ReedPropertyBundle" inManagedObjectContext:self.managedObjectContext];
        ReedPropertyBundle *newProp = [[ReedPropertyBundle alloc] initWithEntity:entityProp insertIntoManagedObjectContext:self.managedObjectContext];
        
        // Set Properties
        newProp.date = self.Date.text;
        newProp.judgement = self.Judgement.text;
        
        // Add Address to Person

        //[self.reed setValue:[NSSet setWithObject:newProp] forKey:@"ReedProps"];
        [reed addReedPropsObject:newProp];
        
        //NSMutableSet *reedPropses = [self.reed mutableSetValueForKey:@"ReedProps"];
        //[reedPropses addObject:newProp];

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

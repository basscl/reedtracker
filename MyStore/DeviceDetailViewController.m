//
//  DeviceDetailViewController.m
//  MyStore
//
//  Created by Eileen Mack on 9/7/15.
//  Copyright (c) 2015 Eileen Mack. All rights reserved.
//

#import "DeviceDetailViewController.h"

@interface DeviceDetailViewController ()

@end

@implementation DeviceDetailViewController

@synthesize device;

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
    // Do any additional setup after loading the view.
    if (self.device) {
        [self.reedBrandTextField setText:[self.device valueForKey:@"reedBrand"]];
        [self.reedSizeTextField setText:[self.device valueForKey:@"reedSize"]];
        [self.reedPropertyTextField setText:[self.device valueForKey:@"reedProperty"]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.device) {
        // Update existing device
        [self.device setValue:self.reedBrandTextField.text forKey:@"reedBrand"];
        [self.device setValue:self.reedSizeTextField.text forKey:@"reedSize"];
        [self.device setValue:self.reedPropertyTextField.text forKey:@"reedProperty"];
        
    } else {
        // Create a new device
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Reed" inManagedObjectContext:context];
        [newDevice setValue:self.reedBrandTextField.text forKey:@"reedBrand"];
        [newDevice setValue:self.reedSizeTextField.text forKey:@"reedSize"];
        [newDevice setValue:self.reedPropertyTextField.text forKey:@"reedProperty"];
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

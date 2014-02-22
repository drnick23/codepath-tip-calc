//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Nicolas Halper on 2/21/14.
//  Copyright (c) 2014 Nicolas Halper. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTip;


@end

@implementation SettingsViewController

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
    // Do any additional setup after loading the view from its nib.
    
    // load any previously set defaults.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipSelection = [defaults floatForKey:@"tipSelection"];
    
    if (defaultTipSelection) {
        // TODO: fix this warning somehow
        NSLog([NSString stringWithFormat:@"Default tip selection: %d",defaultTipSelection]);
    }
    // be sure to update our view with the default value we've got saved.
    self.defaultTip.selectedSegmentIndex = defaultTipSelection;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)defaultTipChanged:(id)sender {
    

    int defaultTipSelection = self.defaultTip.selectedSegmentIndex;
    NSLog(@"default tip selection changed to %d",defaultTipSelection);
    
    // now save new default settings to app
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:defaultTipSelection forKey:@"tipSelection"];
    [defaults synchronize];
    NSLog(@"default tip selection saved");
    
}

@end

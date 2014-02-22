//
//  TipViewController.m
//  tipcalculator
//
//  Created by Nicolas Halper on 2/21/14.
//  Copyright (c) 2014 Nicolas Halper. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *friendlyQuote;

- (IBAction)onBillEditingChanged:(id)sender;
- (IBAction)onTap:(id)sender;

- (void) updateValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // add the settings button to the nav bar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];

    
    // set our tip amount to our default settings
    [self setToTipDefaults];
    
    // until we actually enter a bill, let's leave out the friendly quote.
    self.friendlyQuote.text = @"Enter your bill and tip amounts above";
    
    [self updateValues];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    
    // let's check that defaults are applied before we actually show the view again
    // after coming back from settings view
    [self setToTipDefaults];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setToTipDefaults {
    // set our tip amount to our default settings
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipSelection = [defaults floatForKey:@"tipSelection"];
    self.tipControl.selectedSegmentIndex = defaultTipSelection;

}

- (IBAction)onBillEditingChanged:(id)sender {
    NSLog(@"changed value");
    [self updateValues];

}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    
    // when the user is done editing, let's format the value to 2 decimal places
    // for presentation
    float billAmount = [self.billTextField.text floatValue];
    self.billTextField.text = [NSString stringWithFormat:@"%.2f",billAmount];
    
    [self updateValues];
}

- (void) updateValues {
    float billAmount = [self.billTextField.text floatValue];
    
    
    NSArray *tipValues = @[@(0.1),@(0.15),@(0.2)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f",tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount];
    
    if (totalAmount > 0.0) {
        NSArray *topQuotes = @[@"Thank you. Good bye.", @"Thank you, have a good day!", @"What lovely service,\r      see you again soon!"];
        // TODO: fix this warning
        self.friendlyQuote.text = [NSString stringWithFormat:@"%C %@ %C",8220,topQuotes[self.tipControl.selectedSegmentIndex],8221];
        
    }
    
}

- (void) onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}


@end

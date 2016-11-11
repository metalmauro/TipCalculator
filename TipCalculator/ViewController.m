//
//  ViewController.m
//  TipCalculator
//
//  Created by Matthew Mauro on 2016-11-11.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipCalculationLabel;
@property (weak, nonatomic) IBOutlet UIButton *calculationButton;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageField;
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.billAmountTextField.delegate = self;
    self.tipPercentageField.delegate = self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculate:(UIButton *)sender {
    CGFloat bill = [self.billAmountTextField.text floatValue];
    NSLog(@"Bill Amount is %f", bill);
    CGFloat pcnt = [self.tipPercentageField.text floatValue];
    NSLog(@"Percentage Amount is %f", pcnt);
    if(pcnt == (float)0)
    {
        pcnt = 15;
    }
    CGFloat final = (bill * (pcnt/100));
    self.tipCalculationLabel.text = [NSString stringWithFormat:@"Tip $%.2f", final];
}


@end

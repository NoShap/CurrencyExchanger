//
//  ViewController.m
//  CurrencyExchanger
//
//  Created by Noah Shapiro on 7/13/16.
//  Copyright © 2016 Noah Shapiro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize pickerViewData;
@synthesize currentExchangeRate;

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
//  self.pickerViewData = @[ @[@"USD", @"EUR", @"AUD", @"JPY", @"RMB"],
//                  @[@"USD", @"EUR", @"AUD", @"JPY", @"RMB"]];
  self.pickerViewData = [Currency allCurrencies];
  
  //now I'm trying some outside code from online seeing if I can connect the data
  self.homeCurrencyPicker.dataSource = self;
  self.homeCurrencyPicker.delegate = self;
  self.foreignCurrencyPicker.dataSource = self;
  self.foreignCurrencyPicker.delegate = self;
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
  return 1;
}

// The number of rows of data
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  return self.pickerViewData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
//  return pickerData[component][row];
  Currency* c =  [self.pickerViewData objectAtIndex: row];
  return c.name;
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
  self.currentExchangeRate = [[ExchangeRate alloc] initWithHome: [self.pickerViewData objectAtIndex:[self.homeCurrencyPicker selectedRowInComponent:0]]
                                                             foreign: [self.pickerViewData objectAtIndex:[self.foreignCurrencyPicker selectedRowInComponent:0]]];
  
  
  
}

- (IBAction)exchangeButton:(id)sender
{
  /*
  ExchangeRate* test = [[ExchangeRate alloc] initWithHome: [self.pickerViewData objectAtIndex:0]                                                  foreign: [self.pickerViewData objectAtIndex:1]];
  NSString *exampleText = [test exchangeToHome:100];
  */
  
  float homeVal = self.homeCurrencyField.text.floatValue;
  NSString* foreignCurrencyText  = [self.currentExchangeRate exchangeToHome:homeVal];
  self.foreignCurrencylabel.text = foreignCurrencyText;
  NSLog(@"The Exchange Button Works;");
  NSLog(@"foreign currency text %@", foreignCurrencyText);
  
  NSNumber *r = self.currentExchangeRate.theRate;
  NSLog(@"your Exchange Rate is: %@", self.currentExchangeRate.name);
  self.exchangeRateLabel.text =[NSString stringWithFormat:@"There are %@ %@ for every %@",r, self.currentExchangeRate.foreign.name, self.currentExchangeRate.home.name];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  NSLog(@"Touches Began!");
  [self.homeCurrencyField resignFirstResponder];
}


@end






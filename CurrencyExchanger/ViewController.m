//
//  ViewController.m
//  CurrencyExchanger
//
//  Created by Noah Shapiro on 7/13/16.
//  Copyright © 2016 Noah Shapiro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//{
//  //Currencies
//  Currency *JPY;
//  Currency *USD;
//  Currency *EUR;
//  Currency *AUD;
//  Currency *RMB;
//  
//  
//  
//  //Exchange Rates
//  ExchangeRate *usdAndEur;
//  ExchangeRate *usdAndAud;
//  ExchangeRate *s;
//  
//}
@end

@implementation ViewController

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



- (IBAction)exchangeButton:(id)sender
{
  
  ExchangeRate *newExchangeRate = [[ExchangeRate alloc] initWithHome: self.pickerViewData[[self.homeCurrencyPicker selectedRowInComponent:1]]
foreign:self.pickerViewData[[self.foreignCurrencyPicker selectedRowInComponent:1]]];
  
  NSLog(@"your Exchange Rate is: %@", newExchangeRate.theRate);

  
  
 // self.foreignCurrencylabel.text =
  
  
}




@end






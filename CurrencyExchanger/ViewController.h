//
//  ViewController.h
//  CurrencyExchanger
//
//  Created by Noah Shapiro on 7/13/16.
//  Copyright © 2016 Noah Shapiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExchangeRate.h"
#import "Currency.h"
@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>


@property (strong, nonatomic) NSArray* pickerViewData;


@property (weak, nonatomic) IBOutlet UITextField *homeCurrencyField;

- (IBAction)exchangeButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *foreignCurrencylabel;

@property (weak, nonatomic) IBOutlet UIPickerView *homeCurrencyPicker;

@property (weak, nonatomic) IBOutlet UIPickerView *foreignCurrencyPicker;

@end


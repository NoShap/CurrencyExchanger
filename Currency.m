//
//  Currency.m
//  CurrencyExchanger
//
//  Created by Noah Shapiro on 7/13/16.
//  Copyright © 2016 Noah Shapiro. All rights reserved.
//

#import "Currency.h"

NSMutableArray* _secretListOfCurrencies;

@implementation Currency

@synthesize name;

@synthesize alphaCode;

@synthesize symbol;

@synthesize formatter;


-(Currency*) initWithName: (NSString*)aName
                alphaCode: (NSString*)aCode
                   symbol: (NSString*)aSymbol
            decimalPlaces: (NSUInteger)places
{
  self  = [super init];
  if(self)
  {
    self.name = aName;
    self.alphaCode = aCode;
    self.symbol = aSymbol;
    self.formatter = [[NSNumberFormatter alloc] init];
    self.formatter.maximumFractionDigits = places;
    self.formatter.roundingMode = kCFNumberFormatterRoundHalfUp;
    self.formatter.numberStyle = kCFNumberFormatterCurrencyStyle;
    self.formatter.currencySymbol = self.symbol;
    //currency style?
  }
  return self;
}


-(NSString*) format:(NSNumber*) quantity
{
  
  NSString* formattedNumber = [self.formatter stringFromNumber: quantity];
  NSLog(@"quantity: %@ formattedNumber: %@", quantity, formattedNumber);
  return formattedNumber;
  
}

+(NSArray*) allCurrencies{
 
  if( _secretListOfCurrencies == nil ){
    _secretListOfCurrencies = [[NSMutableArray alloc] init];
    [_secretListOfCurrencies addObject: [[Currency alloc] initWithName:@"US Dollar"
                                                             alphaCode:@"USD"
                                                                symbol:@"$"
                                                         decimalPlaces:2 ]];
    [_secretListOfCurrencies addObject: [[Currency alloc] initWithName:@"Yen"
                                                             alphaCode:@"JPY"
                                                                symbol:@"¥"
                                                         decimalPlaces:0 ]];
    [_secretListOfCurrencies addObject: [[Currency alloc] initWithName:@"Euro"
                                                             alphaCode:@"EUR"
                                                                symbol:@"€"
                                                         decimalPlaces:2 ]];
  }
  return (NSArray*)_secretListOfCurrencies;
}

@end

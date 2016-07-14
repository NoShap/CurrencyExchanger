//
//  Currency.m
//  CurrencyExchanger
//
//  Created by Noah Shapiro on 7/13/16.
//  Copyright © 2016 Noah Shapiro. All rights reserved.
//

#import "Currency.h"

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
    //how do I initiatilize the formatter so that it includes the decimal places?
    //currency symbol
    //round up
    //currency style
  }
  return self;
}


-(NSString*) format:(NSNumber*) quantity
{
  
 //still need to learn how to use the NSFormatter to do this part of the code.
  return @"";
  
}


@end

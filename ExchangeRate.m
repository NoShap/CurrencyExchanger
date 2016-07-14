//
//  ExchangeRate.m
//  CurrencyExchanger
//
//  Created by Noah Shapiro on 7/13/16.
//  Copyright © 2016 Noah Shapiro. All rights reserved.
//

#import "ExchangeRate.h"

@implementation ExchangeRate

@synthesize home;

@synthesize foreign;

@synthesize theRate;

@synthesize expiresOn;



-(ExchangeRate*) initWithHome:(Currency*)aHome
                      foreign:(Currency*)aForeign
{
  self = [super init];
  if(self)
  {
    self.home = aHome;
    self.foreign = aForeign;
    self.completionHandlerDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
    self.ephemeralConfigObject = [NSURLSessionConfiguration ephemeralSessionConfiguration];
  }
  return self;
}

-(NSString*) description
{
  return [NSString stringWithFormat: @"%@ %@", self.home.name, self.foreign.name];
}


-(NSURL*) exchangeRateURL
{
  
  NSString* urlString = [NSString stringWithFormat:@"https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22%@%@%22)&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys", self.home.alphaCode, self.foreign.alphaCode];
  NSURL* url = [NSURL URLWithString: urlString];
  return url;
}


-(NSString*) exchangeToHome: (NSNumber*) value
{
  int rate = [self.theRate intValue];
  int val = [value intValue];
  int result = val / rate;
  NSString* exchangedCurrency = [NSString stringWithFormat:@"%i",result];
  return exchangedCurrency;
  return @"";
}


-(NSString*) exchangeToForeign: (NSNumber*) value
{
  //WHY DO WE USE NSNUMBERS IF THEY ARE THE WORST THINGS IN EXISTENCE
 int rate = [self.theRate intValue];
 int val = [value intValue];
 int result = val * rate ;
 NSString* exchangedCurrency = [NSString stringWithFormat:@"%i",result];
  return exchangedCurrency;
}


-(void) reverse
{
  Currency* temp = self.home;
  self.home = self.foreign;
  self.foreign = temp;
}

-(NSString*) name
{
  return [home.alphaCode stringByAppendingString:foreign.alphaCode];
}


-(void) fetch
{
  NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
  NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: self.ephemeralConfigObject delegate: nil delegateQueue: mainQueue];
  
  NSLog(@"dispatching %@", [self description]);
  //i is the self in the ExchangeRate case
  NSURLSessionTask* task = [delegateFreeSession dataTaskWithURL: [self exchangeRateURL]
                                              completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                NSLog(@"Got response %@ with error %@.\n", response, error);
                                                id obj = [NSJSONSerialization JSONObjectWithData: data
                                                                                         options: 0
                                                                                           error: nil];
                                                if([obj isKindOfClass: [NSDictionary class]] ){
                                                  NSDictionary* dict = (NSDictionary*)obj;
                                                  NSLog(@"%@", [dict description]);
                                                  NSDictionary* results = [dict objectForKey:@"results"];
                                                  NSDictionary* rate = [results objectForKey:@"rate"];
                                                  NSString* theExchangeRate = [rate objectForKey:@"Rate"];
                                                  self.theRate = @(theExchangeRate.floatValue);
                                                }else{
                                                  NSLog(@"Not a dictionary.");
                                                  exit(1);
                                                }
                                                /*NSLog(@"DATA:\n%@\nEND DATA\n",
                                                 [[NSString alloc] initWithData: data
                                                 encoding: NSUTF8StringEncoding]);*/
                                              }];
  [task resume];
 
}




@end

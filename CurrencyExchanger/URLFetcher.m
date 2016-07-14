//
//  URLFetcher.m
//  CurrencyExchanger
//
//  Created by Noah Shapiro on 7/13/16.
//  Copyright © 2016 Noah Shapiro. All rights reserved.
//

#import "URLFetcher.h"

@implementation URLFetcher

@synthesize completionHandlerDictionary;
@synthesize ephemeralConfigObject;
//make these properties of the Exchange rate

-(URLFetcher*) init
{
  self = [super init];
  if(self){
    completionHandlerDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
    ephemeralConfigObject = [NSURLSessionConfiguration ephemeralSessionConfiguration];
  }
  return self;
}

-(void) fetch
{
  NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
  NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: self.ephemeralConfigObject delegate: nil delegateQueue: mainQueue];

    NSLog(@"dispatching %@", [i description]);
  //i is the self in the ExchangeRate case
    NSURLSessionTask* task = [delegateFreeSession dataTaskWithURL: [i exchangeRateURL]
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                  NSLog(@"Got response %@ with error %@.\n", response, error);
                                                  id obj = [NSJSONSerialization JSONObjectWithData: data
                                                                                           options: 0
                                                                                             error: nil];
                                                  if( [obj isKindOfClass: [NSDictionary class]] ){
                                                    NSDictionary *dict = (NSDictionary*)obj;
                                                    NSLog(@"%@", [dict description]);
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
}

@end

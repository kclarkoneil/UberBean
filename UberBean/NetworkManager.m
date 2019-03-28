//
//  networkManager.m
//  UberBean
//
//  Created by Kit Clark-O'Neil on 2019-03-23.
//  Copyright © 2019 Kit Clark-O'Neil. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager
-(NSDictionary*)createRequestWithUrl:(NSURL*)url {
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    urlRequest.HTTPMethod = @"GET";
    
    [urlRequest addValue:@"Bearer rNO6pjwGq0_mSr_5M66KDChnYkjeIXbADTZxEaUDKgU2nptdz2pTYf-z_s4RDBsVz0LSPUMHY7UVtj-4PFBHppkbytyemdE8BpeAKxduDMSQ4G4E4fGSmH49nRt6W3Yx" forHTTPHeaderField:@"Authorization"];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest: urlRequest
                                                   completionHandler:^(NSData * _Nullable data,
                                                                       NSURLResponse * _Nullable response,
                                                                       NSError * _Nullable error)
                                      {
                                          if (error)
                                          {
                                              NSLog(@"Error getting data");
                                          }
                                          else
                                          {
                                              NSError *jsonError = nil;
                                              self.dataDict = [NSJSONSerialization JSONObjectWithData:data
                                                                                              options:0
                                                                                                error:&jsonError];
                                              //NSLog(@"data that is converted into Dict is: %@", self.dataDict);
                                              
                                              if (jsonError)
                                              {
                                                  NSLog(@"jsonError: %@", jsonError.localizedDescription);
                                              }
                                              else
                                              {
                                                  NSLog(@"They are: %lu items in this database", (unsigned long)self.dataDict.count);
                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                      [self parseDictionary:self.dataDict];
                                                  });
                                              }
                                          }
                                      }];
    [dataTask resume];
    return self.dataDict;
}
-(NSURL*)createURLWithLocation:(CLLocation*)location {
    
    float latitude = location.coordinate.latitude;
    float longitude = location.coordinate.longitude;
    NSString *myURLString = [NSString stringWithFormat:@"https://api.yelp.com/v3/businesses/search?term=cafe&latitude=%f&longitude=%f", latitude, longitude];
    NSURL *myURL = [NSURL URLWithString: myURLString];
    return myURL;
}
-(void)parseDictionary: (NSDictionary*) dictionary {
    self.cafeArray = [[NSMutableArray alloc] init];
    NSArray *cafeArray = [dictionary objectForKey:@"businesses"];
    for (NSDictionary *cafeDict in cafeArray) {
        Cafe *newCafe = [[Cafe alloc] initWithDictionary:cafeDict];
        [self.cafeArray addObject:newCafe];
    }
    for (Cafe *cafe in self.cafeArray) {
        NSLog(@"%@", cafe.name);
    }
}
@end

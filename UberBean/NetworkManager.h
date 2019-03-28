//
//  networkManager.h
//  UberBean
//
//  Created by Kit Clark-O'Neil on 2019-03-23.
//  Copyright © 2019 Kit Clark-O'Neil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Cafe.h"
@interface NetworkManager : NSObject

@property NSDictionary *dataDict;
@property NSMutableArray *cafeArray;
-(NSDictionary*)createRequestWithUrl:(NSURL*)url;
-(NSURL*)createURLWithLocation:(CLLocation*)location;
-(void)parseDictionary: (NSDictionary*) dictionary;
@end

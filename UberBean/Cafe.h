//
//  Cafe.h
//  UberBean
//
//  Created by Kit Clark-O'Neil on 2018-08-19.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Cafe : NSObject

@property NSString *name;
@property CLLocation *location;
@property NSString *title;
@property NSString *imageName;

-(instancetype)initWithDictionary:(NSDictionary*)infoDict;
@end

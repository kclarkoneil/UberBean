//
//  Cafe.m
//  UberBean
//
//  Created by Kit Clark-O'Neil on 2018-08-19.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "Cafe.h"

@implementation Cafe


-(instancetype)initWithDictionary:(NSDictionary*)infoDict {
    {
        self = [super init];
        if (self) {
            
            //Grab title and imageName
            _name = [infoDict objectForKey:@"name"];
            _title = [infoDict objectForKey:@"title"];
            _imageName = [infoDict objectForKey:@"image_url"];
            
            //Grab coordinates and set location
            NSDictionary *coordinates = [infoDict objectForKey:@"coordinates"];
            
            NSString *latitudeString = [coordinates objectForKey:@"latitude"];
            NSString *longitudeString = [coordinates objectForKey:@"longitude"];
            
            float latitude = [latitudeString floatValue];
            float longitude = [longitudeString floatValue];
            CLLocation *location =[[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
            
            _location = location;
            
           
            
            
            
        }
         return self;
        
    }
}

@end

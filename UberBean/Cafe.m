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
            self.name = [infoDict objectForKey:@"name"];
            self.title = [infoDict objectForKey:@"title"];
            self.imageName = [infoDict objectForKey:@"image_url"];
            
            //Grab coordinates and set location
            NSDictionary *coordinates = [infoDict objectForKey:@"coordinates"];
            
            NSString *latitudeString = [coordinates objectForKey:@"latitude"];
            NSString *longitudeString = [coordinates objectForKey:@"longitude"];
            
            double latitude = [latitudeString floatValue];
            CLLocationDegrees latitudeDegrees = latitude;
            double longitude = [longitudeString floatValue];
            CLLocationDegrees longitudeDegrees = longitude;
            CLLocationCoordinate2D location = CLLocationCoordinate2DMake(latitudeDegrees, longitudeDegrees);
            
            self.coordinate = location;
            
            
        }
         return self;
        
    }
}

@end

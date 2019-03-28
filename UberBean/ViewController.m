//
//  ViewController.m
//  UberBean
//
//  Created by Kit Clark-O'Neil on 2018-08-17.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <CLLocationManagerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    self.uberBeanMapView.showsUserLocation = true;
    self.networkManager = [[NetworkManager alloc] init];
    
    
   
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"%@ has updated with %@", manager, locations);
    CLLocation *userLocation = locations [0];
    [self.uberBeanMapView setRegion:MKCoordinateRegionMake(userLocation.coordinate, MKCoordinateSpanMake(0.2, 0.2))
                           animated:YES];
    NSURL *locationURL = [self.networkManager createURLWithLocation:userLocation];
    [self.networkManager createRequestWithUrl:locationURL];
    NSLog(@"This is getting called here and there are %lu", (unsigned long)self.networkManager.cafeArray.count);
    for (Cafe *cafe in self.networkManager.cafeArray) {
        NSLog(@"%@", cafe.name);
    }
    
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@" Failed with Error %@", error);
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways) {
    [self.locationManager requestLocation];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

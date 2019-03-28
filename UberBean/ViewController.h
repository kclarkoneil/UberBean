//
//  ViewController.h
//  UberBean
//
//  Created by Kit Clark-O'Neil on 2018-08-17.
//  Copyright © 2018 Kit Clark-O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "NetworkManager.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *uberBeanMapView;
@property NetworkManager *networkManager;

@property CLLocationManager *locationManager;
@end

//rNO6pjwGq0_mSr_5M66KDChnYkjeIXbADTZxEaUDKgU2nptdz2pTYf-z_s4RDBsVz0LSPUMHY7UVtj-4PFBHppkbytyemdE8BpeAKxduDMSQ4G4E4fGSmH49nRt6W3Yx

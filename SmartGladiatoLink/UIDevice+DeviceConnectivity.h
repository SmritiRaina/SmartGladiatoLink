//
//  UIDevice+DeviceConnectivity.h
//  thestanforddaily
//
//  Created by Sudeep Singh on 20/03/13.
//  Copyright (c) 2013 sudeep@agicent.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemConfiguration/SCNetworkReachability.h"
@interface UIDevice (DeviceConnectivity)
+(BOOL) cellularConnected;
+(BOOL) wiFiConnected;
+(BOOL) networkConnected;
@end

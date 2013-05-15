//
//  UIDevice+DeviceConnectivity.m
//  thestanforddaily
//
//  Created by Sudeep Singh on 20/03/13.
//  Copyright (c) 2013 sudeep@agicent.com. All rights reserved.
//

#import "UIDevice+DeviceConnectivity.h"

@implementation UIDevice (DeviceConnectivity)
+(BOOL) cellularConnected
{
    SCNetworkReachabilityFlags  flags = 0;
    SCNetworkReachabilityRef netReachability;
    netReachability = SCNetworkReachabilityCreateWithName(CFAllocatorGetDefault(), [@"www.google.com" UTF8String]);
    if(netReachability)
    {
        SCNetworkReachabilityGetFlags(netReachability, &flags);
        CFRelease(netReachability);
    }
    if(flags & kSCNetworkReachabilityFlagsIsWWAN) return YES;
    return NO;
}

+(BOOL) networkConnected
{
    SCNetworkReachabilityFlags flags = 0;
    SCNetworkReachabilityRef netReachability;
    BOOL  retrievedFlags = NO;
    netReachability = SCNetworkReachabilityCreateWithName(CFAllocatorGetDefault(), [@"www.google.com" UTF8String]);
    if(netReachability)
    {
        retrievedFlags  = SCNetworkReachabilityGetFlags(netReachability, &flags);
        CFRelease(netReachability);
    }
    if (!retrievedFlags || !flags) return NO;
    return YES;
}

+(BOOL) wiFiConnected
{
    if ([self cellularConnected]) return NO;
    return [self networkConnected];
}
@end

//
//  AboutSGL.h
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 23/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface AboutSGL : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *versionLabel;
@property (strong, nonatomic) IBOutlet UILabel *buildLabel;

@property(nonatomic,strong)NSString *str;

@end

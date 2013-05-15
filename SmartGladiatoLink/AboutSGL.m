//
//  AboutSGL.m
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 23/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "AboutSGL.h"

@interface AboutSGL ()

@end

@implementation AboutSGL

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.versionLabel.text=[NSString stringWithFormat:@"Version %@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    self.buildLabel.text=[NSString stringWithFormat:@"Build %@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setVersionLabel:nil];
    [self setBuildLabel:nil];
    [super viewDidUnload];
}
@end

//
//  ConnectedScreenVC.m
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 22/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "ConnectedScreenVC.h"

@interface ConnectedScreenVC ()

@end

@implementation ConnectedScreenVC

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
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return  UIInterfaceOrientationLandscapeLeft;
}



@end

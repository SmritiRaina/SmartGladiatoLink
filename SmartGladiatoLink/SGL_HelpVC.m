//
//  SGL_HelpVC.m
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 23/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "SGL_HelpVC.h"

@interface SGL_HelpVC ()

@end

@implementation SGL_HelpVC

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
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"AboutSGL_help" ofType:@"html"];
    NSURL *url=[NSURL URLWithString:path];
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    
    [self.help_Webview loadRequest:req];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidUnload {
    [self setHelp_Webview:nil];
    [super viewDidUnload];
}
@end

//
//  HelpWebVC.m
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 20/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "HelpWebVC.h"

@interface HelpWebVC ()

@end

@implementation HelpWebVC

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
 
    NSString *path=[[NSBundle mainBundle]pathForResource:@"Help" ofType:@"html"];
    NSURL *url=[NSURL URLWithString:path];
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    
   [_web_view  loadRequest:req];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setWeb_view:nil];
    [super viewDidUnload];
}
@end

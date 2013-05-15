//
//  Configure_Hostlist.m
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 16/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "Configure_Hostlist.h"

@interface Configure_Hostlist ()

@end

@implementation Configure_Hostlist

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
    
    self.checkConfigureListString=@"inConfigureHostListView";
     hostnameArray=[[NSMutableArray alloc]init];
     NSString *documentDirPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject];
     NSString *path = [documentDirPath stringByAppendingPathComponent:@"ServerConnect.plist"];
     NSDictionary *hostDict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    hostnameArray=[hostDict valueForKey:@"Hosts"];
      
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    
    return toInterfaceOrientation!=UIInterfaceOrientationPortraitUpsideDown;
}
#pragma  mark-TableView Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return hostnameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier=@"hostname_config";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSDictionary *dictn=[hostnameArray objectAtIndex:indexPath.row];
    cell.textLabel.text=[dictn valueForKey:@"ipAddress"];
    cell.textLabel.font=[UIFont boldSystemFontOfSize:15.0];
    return cell;
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    NSString *documentDirPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirPath stringByAppendingPathComponent:@"ServerConnect.plist"];
    NSDictionary *hostDict = [NSDictionary dictionaryWithContentsOfFile:path];
    hostnameArray = [hostDict valueForKey:@"Hosts"];
    [self.hostlist_tableview reloadData];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  
    Configuration_Host *confObj=segue.destinationViewController;
    confObj.indexP_configurehost=[self.hostlist_tableview indexPathForSelectedRow];
    confObj.checkConfigure_HostString=self.checkConfigureListString;
    
}

@end

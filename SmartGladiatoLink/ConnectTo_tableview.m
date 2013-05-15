//
//  ConnectTo_tableview.m
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 15/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "ConnectTo_tableview.h"

@interface ConnectTo_tableview ()

@end

@implementation ConnectTo_tableview

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
    showSwipetoDeleteIndicator=TRUE;
    self.serverlistArray=[[NSMutableArray alloc]init];
   
    NSString *documentDirPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirPath stringByAppendingPathComponent:@"ServerConnect.plist"];
    
    NSDictionary *hostDict = [NSDictionary dictionaryWithContentsOfFile:path];
    hosts_ListArray = [hostDict valueForKey:@"Hosts"];
    
    
    UISwipeGestureRecognizer *gesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipteToDelete:)];
    gesture.direction=UISwipeGestureRecognizerDirectionRight;
    gesture.numberOfTouchesRequired=1;
    [self.serverList_tableView addGestureRecognizer:gesture];
    
    }
 
-(void)showDeleteArrow{
    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"swipe-gesture.png"]];
    UILabel *showDeleteLabel=[[UILabel alloc]init];
    
    showDeleteLabel.text=@"Swipe to Delete & Move";
    showDeleteLabel.font=[UIFont boldSystemFontOfSize:20.0];
    showDeleteLabel.textColor=[UIColor grayColor];
    showDeleteLabel.backgroundColor=[UIColor clearColor];
        
    showDeleteLabel.frame=CGRectMake(50, 340, 250, 45);
    imageView.frame=CGRectMake(0, 300, 70, 94);
    
    
    if (([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft) ||
         ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight)) {
        showDeleteLabel.frame=CGRectMake(130, 200, 250, 45);
        imageView.frame=CGRectMake(20, 150, 70, 94);
    }
    
    //[[UIApplication sharedApplication].keyWindow addSubview:imageView];
    //[[UIApplication sharedApplication].keyWindow addSubview:showDeleteLabel];
    
    [self.serverList_tableView addSubview:imageView];
    [self.serverList_tableView addSubview:showDeleteLabel];
    
    [UIView animateWithDuration:2.0 animations:^{
        if (([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft) ||
            ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight)){
            
        imageView.frame=CGRectMake(400, 150, 70, 94);
        }
     else
         imageView.frame=CGRectMake(250, 300, 70, 94);
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
        [showDeleteLabel removeFromSuperview];
        showSwipetoDeleteIndicator=FALSE;
    }];
    

}

-(void)swipteToDelete:(UISwipeGestureRecognizer *)recogniser
{
    DeleteAndMoveVC *delObj=[self.storyboard instantiateViewControllerWithIdentifier:@"DeleteAndMoveId"];
                             [self.navigationController pushViewController:delObj animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
     
}


#pragma  mark-TableView Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [hosts_ListArray count]+1;
    
} 
- (AddNewCustomCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier=@"host";
    static NSString *cellIdentifier_new=@"newServer";
    AddNewCustomCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    AddNewCustomCell *cell_new=[tableView dequeueReusableCellWithIdentifier:cellIdentifier_new];
    
    if (cell==nil){
        cell=[[AddNewCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (cell_new==nil) {
        cell_new=[[AddNewCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier_new];
    }
     
    if (indexPath.row<hosts_ListArray.count) {
        NSDictionary *dictn=[hosts_ListArray objectAtIndex:indexPath.row];
        
        cell.titleLabel_server.text=[dictn valueForKey:@"ipAddress"];
        cell.imageView.image=[UIImage imageNamed:@"Computer.png"];
        
        return cell;
    }else{
        cell.titleLabel_server.text = @"New";
        cell.detailLabel.text = @"Configure";
    }
    
         cell_new.accessoryType=UITableViewCellAccessoryNone;
         return cell_new;
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    NSString *documentDirPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirPath stringByAppendingPathComponent:@"ServerConnect.plist"];
    NSDictionary *hostDict = [NSDictionary dictionaryWithContentsOfFile:path];
    hosts_ListArray = [hostDict valueForKey:@"Hosts"];
    [self.serverList_tableView reloadData];
 
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    int count = [[prefs objectForKey:@"DeletHintCount"] intValue];
    if (count >= 2) {
        
    }else{
        
        if (showSwipetoDeleteIndicator==TRUE) {
            count++;
            [prefs setObject:[NSNumber numberWithInt:count] forKey:@"DeletHintCount"];
            [prefs synchronize];
            [self showDeleteArrow];            
        }
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ConnectAS400 *connObj=segue.destinationViewController;
    
    NSIndexPath *index=[self.serverList_tableView indexPathForSelectedRow];
    
    connObj.indexPath_connectAS400=index;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AddNewCustomCell *cell1=(id)[tableView cellForRowAtIndexPath:indexPath];
    if ([cell1.reuseIdentifier isEqualToString:@"newServer"]) {
        Configuration_Host *vcObj=[self.storyboard instantiateViewControllerWithIdentifier:@"Configuration_Host"];
        self.addServerCellString=@"AddNewHostString";
        vcObj.addServerIdentifyingStr=self.addServerCellString;
        [self.navigationController pushViewController:vcObj animated:YES];

    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(!([UIDevice wiFiConnected]||[UIDevice networkConnected]||[UIDevice cellularConnected])&&indexPath.row!=hosts_ListArray.count)
    {
        [[[UIAlertView alloc]initWithTitle:@"Error" message:@"There is no active network. Check Wi-Fi and phone settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
        
        return nil;
    }
    else
        return indexPath;
    return indexPath;
    
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return toInterfaceOrientation!=UIInterfaceOrientationPortraitUpsideDown;
}

-(BOOL)shouldAutorotate
{
    return YES;
}
-(NSUInteger)supportedInterfaceOrientations
{
     
    return UIInterfaceOrientationMaskAllButUpsideDown;
    
}
@end

//
//  ColorCombinationClass.m
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 16/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "ColorCombinationClass.h"

@interface ColorCombinationClass ()

@end

@implementation ColorCombinationClass

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.saveButton setEnabled:NO];
    [self.redValueSlider setMinimumTrackTintColor:[UIColor redColor]];
    [self.redValueSlider setMaximumTrackTintColor:[UIColor redColor]];
    
    [self.greenValueSlider setMinimumTrackTintColor:[UIColor greenColor]];
    [self.greenValueSlider setMaximumTrackTintColor:[UIColor greenColor]];
    
    [self.blueValueSlider setMinimumTrackTintColor:[UIColor blueColor]];
    [self.blueValueSlider setMaximumTrackTintColor:[UIColor blueColor]];
    
    self.redValueSlider.minimumValue=0.0;
    self.redValueSlider.maximumValue=255.0;
    
    self.greenValueSlider.minimumValue=0.0;
    self.greenValueSlider.maximumValue=255.0;
    
    self.blueValueSlider.minimumValue=0.0;
    self.blueValueSlider.maximumValue=255.0;
    
    
    NSString *documentDirPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirPath stringByAppendingPathComponent:@"SavedColors.plist"];
    NSDictionary *hostDict = [NSDictionary dictionaryWithContentsOfFile:path];
    int row=self.indexP_colorcomb.row;
    
    NSMutableArray *colorArrayfromPlist=[hostDict valueForKey:@"rows"];
    NSArray *colorComponentsString=[[colorArrayfromPlist objectAtIndex:row] componentsSeparatedByString:@","];
    NSArray *navigationBarTitleArray=[[NSArray alloc] initWithObjects:
                                      @"Background",
                                      @"Cursor",
                                      @"Red",
                                      @"Blue",
                                      @"Green",
                                      @"Turquoise",
                                      @"White",
                                      @"Yellow",
                                      @"Pink",
                                      @"Select", nil];
    
        self.resultColorView.backgroundColor=nil;
    
    
        //NSLog(@"%f",[[colorComponentsString objectAtIndex:0] floatValue]*255.0);
    
        self.navigationItem.title=[navigationBarTitleArray objectAtIndex:row];
        self.redValueSlider.value=[[colorComponentsString objectAtIndex:0] floatValue]*255.0;
        self.greenValueSlider.value=[[colorComponentsString objectAtIndex:1] floatValue]*255.0;
        self.blueValueSlider.value=[[colorComponentsString objectAtIndex:2] floatValue]*255.0;
        self.resultColorView.backgroundColor=[UIColor colorWithRed:self.redValueSlider.value/255.0  green:self.greenValueSlider.value/255.0 blue:self.blueValueSlider.value/255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (IBAction)redValueChanged:(UISlider *)sender {
    [self.saveButton setEnabled:YES];
    self.redValueSlider.value=sender.value;
    [self performSelector:@selector(showResultedColor:) withObject:self afterDelay:0.01];
     
}

- (IBAction)greenValueChanged:(UISlider *)sender {
    [self.saveButton setEnabled:YES];
    self.greenValueSlider.value=sender.value;
    
    [self performSelector:@selector(showResultedColor:) withObject:self afterDelay:0.01];
    
}
- (IBAction)blueValueChanged:(UISlider *)sender {
    //self.resultColorView.backgroundColor=nil;
    [self.saveButton setEnabled:YES];
    self.blueValueSlider.value=sender.value;
    
    [self performSelector:@selector(showResultedColor:) withObject:self afterDelay:0.01];
    
     
}
-(void)showResultedColor:(UISlider *)sliderOb{
    
    self.resultColorView.backgroundColor=[UIColor colorWithRed:(self.redValueSlider.value)/255.0 green:(self.greenValueSlider.value)/255.0 blue:(self.blueValueSlider.value)/255.0 alpha:1.0];
    UIColor *color = self.resultColorView.backgroundColor;
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    colorAsString = [NSString stringWithFormat:@"%f,%f,%f,%f", components[0], components[1], components[2], components[3]];
    
}
- (IBAction)saveResultedColor:(UIBarButtonItem *)sender {
    
    NSString *directorypath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES) lastObject];
    
    NSString *path=[directorypath stringByAppendingPathComponent:@"SavedColors.plist"];
    NSMutableDictionary *colorTabledict;
    
    colorTabledict=[NSMutableDictionary dictionaryWithContentsOfFile
                    :path];
    
    if (colorTabledict==nil) {
        colorTabledict=[[NSMutableDictionary alloc]init];
        
    }
    NSMutableArray *rowArray=[colorTabledict objectForKey:@"rows"];
    if (rowArray==nil) {
        rowArray=[[NSMutableArray alloc]initWithObjects:@"0.000000,0.000000,0.000000,1.000000",@"128.000000,128.000000,128.000000,1.000000",@"255.000000,0.000000,0.000000,1.000000",@"0.000000,0.000000,255.000000,1.000000",@"0.000000,255.000000,0.000000,1.000000",@"0.000000,255.000000,255.000000,1.000000",@"255.000000,255.000000,255.000000,1.000000",@"255.000000,255.000000,0.000000,1.000000",@"255.000000,0.000000,255.000000,1.000000",@"255.000000,140.000000,0.000000,1.000000", nil];
        
    }
 
    [rowArray replaceObjectAtIndex:self.indexP_colorcomb.row withObject:colorAsString];
    
    [colorTabledict setObject:rowArray forKey:@"rows"];
    [colorTabledict writeToFile:path atomically:YES];
    
    
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    
    return toInterfaceOrientation!=UIInterfaceOrientationPortraitUpsideDown;
}
@end

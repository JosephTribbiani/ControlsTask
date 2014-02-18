//
//  CTTabBarItemViewController.m
//  ControlsTask
//
//  Created by Igor Bogatchuk on 2/18/14.
//  Copyright (c) 2014 Igor Bogatchuk. All rights reserved.
//

#import "CTTabBarItemViewController.h"

@interface CTTabBarItemViewController ()

@end

@implementation CTTabBarItemViewController

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

- (IBAction)buttonDidTapped:(id)sender
{
	[self.tabBarController dismissViewControllerAnimated:YES completion:
	 ^{
		 NSLog(@"Modal sheet dismissed");
	 }];
}

@end

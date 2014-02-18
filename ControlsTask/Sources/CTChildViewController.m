//
//  CTChildViewController.m
//  ControlsTask
//
//  Created by Igor Bogatchuk on 2/18/14.
//  Copyright (c) 2014 Igor Bogatchuk. All rights reserved.
//

#import "CTChildViewController.h"

@interface CTChildViewController ()

@end

@implementation CTChildViewController

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)hideButtonDidTapped:(id)sender
{
	[self.delegate hideButtonDidTapped:self];
}

@end

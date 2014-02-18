//
//  CTDestinationViewController.m
//  ControlsTask
//
//  Created by Igor Bogatchuk on 2/18/14.
//  Copyright (c) 2014 Igor Bogatchuk. All rights reserved.
//

#import "CTDestinationViewController.h"

@interface CTDestinationViewController()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation CTDestinationViewController

- (void)viewDidLoad
{
	[self.textLabel setText:self.text];
}

- (IBAction)okButtonDidPressed:(id)sender
{
	[self dismissViewControllerAnimated:YES completion:
	 ^{
		 NSLog(@"Modal sheet dismissed");
	 }];
}

@end

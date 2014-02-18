//
//  CTViewController.m
//  ControlsTask
//
//  Created by Igor Bogatchuk on 2/18/14.
//  Copyright (c) 2014 Igor Bogatchuk. All rights reserved.
//

#import "CTMainViewController.h"
#import "CTDestinationViewController.h"
#import "CTChildViewController.h"

#define kAnimationDuration 0.3

@interface CTMainViewController ()<CTChildViewControllerDelegate>

@property (nonatomic, retain) UIViewController* childViewController;

@end

@implementation CTMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)showModalButtonDidTapped:(id)sender
{
	UIViewController* destinationViewController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"tabBarViewController"];
	
	[self.navigationController presentViewController:destinationViewController animated:YES completion:
	^{
		 NSLog(@"Modal view controller presented");
	}];
}

- (IBAction)pushButtonDidTapped:(id)sender
{
	CTDestinationViewController* destinationViewController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"modalViewController"];
	destinationViewController.text = @"Push View Controller";
	
	[self.navigationController pushViewController:destinationViewController animated:YES];
}

- (IBAction)segueWithIDButtonDidTapped:(id)sender
{
	[self performSegueWithIdentifier:@"pushToDestinationViewController" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
	if ([[segue identifier] isEqualToString:@"pushToDestinationViewController"])
	{
		CTDestinationViewController* destinationViewController = [segue destinationViewController];
		destinationViewController.text = @"pushed with segue";
	}
}

- (IBAction)childButtonDidTapped:(id)sender
{
	if (self.childViewController)
	{
		[self hideContentController:self.childViewController];
	}
	else
	{
		CTChildViewController* childViewController = [[CTChildViewController alloc] initWithNibName:@"CTChildViewController" bundle:nil];
		childViewController.delegate = self;
		[self displayContentController:childViewController];
	}
}

#pragma mark - ChildViewController related

- (void)displayContentController:(UIViewController*)childViewController;
{
	[childViewController willMoveToParentViewController:self];
	[self addChildViewController:childViewController];
	
	CGRect endFrame = childViewController.view.frame;
	endFrame.origin.y = self.view.frame.size.height - CGRectGetHeight(endFrame);
	
	CGRect startFrame = childViewController.view.frame;;
	startFrame.size.height = 0;
	startFrame.origin.y = CGRectGetHeight(self.view.frame);
	childViewController.view.frame = startFrame;
	
	[UIView animateWithDuration:kAnimationDuration animations:^
	{
		childViewController.view.frame = endFrame;
		[self.view addSubview:childViewController.view];
	}];
	self.childViewController = childViewController;
	[childViewController didMoveToParentViewController:self];
}

- (void)hideContentController:(UIViewController*)childViewController
{
	[childViewController willMoveToParentViewController:nil];
	CGRect endFrame = childViewController.view.frame;
	endFrame.size.height = 0;
	endFrame.origin.y = CGRectGetHeight(self.view.frame);
    
	[UIView animateWithDuration:kAnimationDuration animations:^
	{
		childViewController.view.frame = endFrame;
	}
	completion:^(BOOL finished)
	{
		[childViewController.view removeFromSuperview];
		[childViewController removeFromParentViewController];
		self.childViewController = nil;
		[childViewController didMoveToParentViewController:nil];
	}];
}

#pragma mark - ChildViewControllerDelegate

- (void)hideButtonDidTapped:(CTChildViewController*)childViewController
{
	[self hideContentController:childViewController];
}

@end

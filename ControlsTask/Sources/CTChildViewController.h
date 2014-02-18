//
//  CTChildViewController.h
//  ControlsTask
//
//  Created by Igor Bogatchuk on 2/18/14.
//  Copyright (c) 2014 Igor Bogatchuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTChildViewController;

@protocol CTChildViewControllerDelegate <NSObject>

- (void)hideButtonDidTapped:(CTChildViewController*)childViewController;

@end

@interface CTChildViewController : UIViewController

@property (nonatomic, weak) id<CTChildViewControllerDelegate> delegate;

- (IBAction)hideButtonDidTapped:(id)sender;

@end

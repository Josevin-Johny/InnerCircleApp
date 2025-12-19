//
//  HomeViewController.m
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

#import "HomeViewController.h"

#import "HomeViewController.h"

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Home";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *welcomeLabel = [[UILabel alloc] init];
    welcomeLabel.text = @"Welcome to Inner Circle!";
    welcomeLabel.font = [UIFont boldSystemFontOfSize:24];
    welcomeLabel.textAlignment = NSTextAlignmentCenter;
    welcomeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:welcomeLabel];
    
    [NSLayoutConstraint activateConstraints:@[
        [welcomeLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [welcomeLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
    ]];
}

@end

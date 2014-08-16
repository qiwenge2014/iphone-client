//
//  RootViewController.m
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "RootViewController.h" 
#import "MainViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    [self.navigationController setNavigationBarHidden:YES];
    NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(skipToMain) userInfo:nil repeats:NO];
}

-(void)skipToMain{
    MainViewController *main=[[MainViewController alloc] init];
    [self.navigationController pushViewController:main animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

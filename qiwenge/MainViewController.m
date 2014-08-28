//
//  MainViewController.m
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "MainViewController.h"
#import "UIViewController+Navigation.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    
    [self initNavigationBarWithTopTitle:@"书架" leftTitle:nil rightTitle:nil];
    [self initViews];
}

-(void)initViews{
    int height=self.mContainer.frame.size.height;
    NSLog(@"height:%d:",height);
    
    self.bookShelf=[[BookShelfViewController alloc] init];
    [self.mContainer addSubview:self.bookShelf.view];
    
    self.bookCity=[[BookCityViewController alloc] init];
    [self.mContainer addSubview:self.bookCity.view];
    
    [self.bookCity.view setHidden:YES];
}

-(void)showBookCity{
    [self.bookCity.view setHidden:NO];
    [self.bookShelf.view setHidden:YES];
}

-(void)showBookShelf{
    [self.bookCity.view setHidden:YES];
    [self.bookShelf.view setHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onBookShelfClick:(id)sender {
    [self showBookShelf];
}

- (IBAction)onBookCityClick:(id)sender {
    [self showBookCity];
}
@end

//
//  BookCityViewController.m
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "BookCityViewController.h"

@interface BookCityViewController ()

@end

@implementation BookCityViewController

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
    
    self.recommendViewController=[[RecommendViewController alloc] init];
    self.rankViewController=[[RankViewController alloc] init];
    self.categoryViewController=[[CategoryViewController alloc] init];
    
    [self.mSlideView buildUI];
}

-(NSUInteger)getCount:(ViewPager *)view{
    return 3;
}

-(UIViewController *)getItem:(ViewPager *)view position:(NSUInteger)number{
    if (number == 0) {
        return self.rankViewController;
    } else if (number == 1) {
        return self.recommendViewController;
    } else if (number == 2) {
        return self.categoryViewController;
    } else {
        return nil;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end

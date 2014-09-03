//
//  MainViewController.h
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookCityViewController.h"
#import "BookShelfViewController.h"

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *mContainer;

@property(strong, nonatomic) BookShelfViewController *bookShelf;

@property(strong, nonatomic) BookCityViewController *bookCity;

- (IBAction)onBookShelfClick:(id)sender;

- (IBAction)onBookCityClick:(id)sender; 

@end

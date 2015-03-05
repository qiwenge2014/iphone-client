//
//  MainViewController.m
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "MainViewController.h"
#import "BookDetailViewController.h"

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
    
    [self initNavigationBarWithTopTitle:@"书吧" leftTitle:nil rightTitle:nil];
    [self initViews];
}

-(void)initViews{
   // int height=self.mContainer.frame.size.height;
    
    self.bookShelf=[[BookShelfViewController alloc] init];
    self.bookShelf.mDelegate=self;
    [self.mContainer addSubview:self.bookShelf.view];
    
    self.bookCity=[[BookCityViewController alloc] init];
    self.bookCity.mDelegate=self;
    [self.mContainer addSubview:self.bookCity.view];
    
    self.meViewContoller=[[MeViewController alloc] init];
    [self.mContainer addSubview:self.meViewContoller.view];
    
    [self.bookCity.view setHidden:YES];
    [self.meViewContoller.view setHidden:YES];
}

-(void)showBookCity{
    [self.bookCity.view setHidden:NO];
    [self.bookShelf.view setHidden:YES];
    [self.meViewContoller.view setHidden:YES];
}

-(void)showBookShelf{
    [self.bookShelf.view setHidden:NO];
    [self.bookCity.view setHidden:YES];
    [self.meViewContoller.view setHidden:YES];
}

-(void)showMe{
    [self.bookShelf.view setHidden:YES];
    [self.bookCity.view setHidden:YES];
    [self.meViewContoller.view setHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onBookShelfClick:(id)sender {
    [self showBookShelf];
    [self clearBtnFocus];
    [self.ivBookShelf setImage:[UIImage imageNamed:@"ic_main_menu_bookshelf_s.png"]];
}

- (IBAction)onBookCityClick:(id)sender {
    [self showBookCity];
    [self clearBtnFocus];
    [self.ivBookCity setImage:[UIImage imageNamed:@"ic_main_menu_bookcity_s.png"]];
}


- (IBAction)onMeClick:(id)sender {
    [self showMe];
    [self clearBtnFocus];
    [self.ivMe setImage:[UIImage imageNamed:@"ic_main_menu_me_s.png"]];
}

-(void)clearBtnFocus{
    [self.ivBookShelf setImage:[UIImage imageNamed:@"ic_main_menu_bookshelf_n.png"]];

    [self.ivBookCity setImage:[UIImage imageNamed:@"ic_main_menu_bookcity_n.png"]];

    [self.ivMe setImage:[UIImage imageNamed:@"ic_main_menu_me_n.png"]];
}

-(void)skipToBookDetail:(Book *)book{
    BookDetailViewController *bookDetail=[[BookDetailViewController alloc] init];
    [bookDetail passArguments:book];
    [self.navigationController pushViewController:bookDetail animated:YES];
}

@end

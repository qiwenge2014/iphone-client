//
//  ReaderViewController.h
//  qiwenge
//
//  Created by Eric on 15/1/19.
//  Copyright (c) 2015年 qiwenge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chapter.h"

@interface ReaderViewController : UIViewController<PassArgumentsDelegate>

@property (assign, nonatomic) Chapter *chapter;
@property (weak, nonatomic) IBOutlet UILabel *lbContent;

@end

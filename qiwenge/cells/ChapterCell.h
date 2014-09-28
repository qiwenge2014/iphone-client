//
//  ChapterCell.h
//  qiwenge
//
//  Created by Eric on 14-9-27.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chapter.h"

@interface ChapterCell : BaseCell

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;

-(void)bindData:(Chapter *)chapter;

@end

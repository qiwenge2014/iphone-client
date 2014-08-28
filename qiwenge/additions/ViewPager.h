

#import <UIKit/UIKit.h>

@protocol UIViewPagerDelegate;

@interface ViewPager : UIView<UIScrollViewDelegate>
{
    BOOL isInited;
}

@property (nonatomic, strong) IBOutlet UIScrollView *mScrollView;
@property (nonatomic, weak) IBOutlet id<UIViewPagerDelegate> mViewPagerDelegate;
@property (nonatomic, strong) NSMutableArray *views;

- (void)buildUI;

@end

@protocol UIViewPagerDelegate <NSObject>

@required

- (NSUInteger)getCount:(ViewPager *)view;

- (UIViewController *)getItem:(ViewPager *)view position:(NSUInteger)number;

@end


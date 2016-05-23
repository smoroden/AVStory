//
//  StoryPageViewController.m
//  AV StoryBook
//
//  Created by Zach Smoroden on 2016-05-23.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "StoryPageViewController.h"
#import "StoryPage.h"
#import "StoryPartViewController.h"

@interface StoryPageViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic) NSMutableArray *pages;

@end

@implementation StoryPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    self.dataSource = self;
    
    self.pages = [@[
                    [StoryPage new],
                    [StoryPage new],
                    [StoryPage new],
                    [StoryPage new],
                    [StoryPage new]
                    ] mutableCopy];
    StoryPartViewController *spvc = [self.storyboard instantiateViewControllerWithIdentifier:@"StoryPart"];
    spvc.storyPart = self.pages[0];
    
    
    [self setViewControllers:@[spvc] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    StoryPartViewController *vc = (StoryPartViewController*) viewController;
    
    NSInteger index = [self.pages indexOfObject:vc.storyPart];
    
    index--;
    
    if (index >= 0) {
        StoryPartViewController *spvc = [self.storyboard instantiateViewControllerWithIdentifier:@"StoryPart"];
        
        spvc.storyPart = self.pages[index];
        
        return spvc;
    }
    
    return nil;

}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    StoryPartViewController *vc = (StoryPartViewController*) viewController;
    NSInteger index = [self.pages indexOfObject:vc.storyPart];
    
    index++;
    
    if (index < [self.pages count]) {
        StoryPartViewController *spvc = [self.storyboard instantiateViewControllerWithIdentifier:@"StoryPart"];

        
        spvc.storyPart = self.pages[index];
        
        return spvc;
    }
    
    return nil;

    
}



@end

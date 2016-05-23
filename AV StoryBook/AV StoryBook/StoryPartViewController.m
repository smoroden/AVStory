//
//  ViewController.m
//  AV StoryBook
//
//  Created by Zach Smoroden on 2016-05-23.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "StoryPartViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "StoryPage.h"

@interface StoryPartViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *recordAudioButton;

@property (nonatomic) AVAudioRecorder *audioRecorder;
@property (nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation StoryPartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)cameraPressed:(UIButton *)sender {
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    
    ipc.delegate = self;
    
    [self presentViewController:ipc animated:YES completion:nil];
    
}
- (IBAction)imageTapped:(UITapGestureRecognizer *)sender {
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    NSLog(@"finished picking %@", info);
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    if (image) {
        self.imageView.image = image;
    }
    
    [self.view layoutIfNeeded];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)recordPressed:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

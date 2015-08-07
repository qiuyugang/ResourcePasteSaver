//
//  ViewController.m
//  ResourcePasteSaver
//
//  Created by yugang.qyg on 15/8/7.
//  Copyright (c) 2015年 yugang.qyg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton          *btnBg;
@property (nonatomic, strong) UIImageView       *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UILongPressGestureRecognizer *ges = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(photoButtonLongPressed:)];
    ges.minimumPressDuration = 0.5;
    
    self.btnBg = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnBg.frame = CGRectMake(self.view.center.x - 50, self.view.center.y -50,
                                  100, 100);
    self.btnBg.backgroundColor = [UIColor grayColor];
    [self.btnBg addGestureRecognizer:ges];
    [self.view addSubview:self.btnBg];
    
}

- (UIImageView*)imageView{
    if(!_imageView){
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x - 50,
                                                                   self.view.center.y - 50, 100, 100)];
        _imageView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:_imageView];
    }
    return _imageView;
}

- (void)photoButtonLongPressed:(UILongPressGestureRecognizer *)longGesture
{
    if (longGesture.state == UIGestureRecognizerStateBegan) {
        UIImage *image = [UIPasteboard generalPasteboard].image;
        self.imageView.image = image;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

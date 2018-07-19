//
//  ViewController.m
//  TailedButton
//
//  Created by qq on 2018/7/18.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "ViewController.h"
#import "TailedButton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *vwDropMenuHeight;
@property (weak, nonatomic) IBOutlet UIView *vwDropMenu;
@property(strong,nonatomic)TailedButton* button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _button = [[TailedButton alloc]initWithFrame:CGRectMake(130, 50, 200, 44)];
    _button.title = @"2008年10月20日";
    _button.layer.borderColor = [UIColor blackColor].CGColor;
    _button.layer.borderWidth = 1;

    [self.view addSubview:_button];
    
    [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)buttonClicked:(TailedButton*)sender{
    sender.selected = !sender.selected;
    if(!sender.isSelected){
        _vwDropMenu.hidden = YES;
        _vwDropMenuHeight.constant = 0;
        
    }else{
        _vwDropMenu.hidden = NO;
        _vwDropMenuHeight.constant = 128;
    }
}


@end

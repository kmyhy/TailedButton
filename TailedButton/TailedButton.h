//
//  TailedButton.h
//  TailedButton
//
//  Created by qq on 2018/7/18.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface TailedButton : UIControl{
    CGRect _aFrame;
}
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ivIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconCenterX;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (copy,nonatomic)NSString* title;

@end

//
//  TailedButton.m
//  TailedButton
//
//  Created by qq on 2018/7/18.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "TailedButton.h"
#import "func.h"
#import "dimensions.h"

@implementation TailedButton

-(void)xibSetup{
    self.view = (UIControl*)[self loadViewFromNib];
    
    // use bounds not frame or it'll be offset
    self.view.frame = self.bounds;
    
    // Make the view stretch with containing view
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    self.view.userInteractionEnabled = NO;
    [self addSubview:self.view];
    // 重新计算 subview 布局，否则布局会不正常
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}

-(UIView*)loadViewFromNib{
    
    UINib* nib = [UINib nibWithNibName:@"TailedButton" bundle:nil];
    
    UIView *view = [nib instantiateWithOwner:self options:nil][0];
    
    return view;
}
-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame: frame];
    [self xibSetup];
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    [self xibSetup];
    return self;
}
// MARK: - getter/setter
-(NSString*)title{
    return self.titleLabel.text;
}
-(void)setTitle:(NSString *)title{
    _titleLabel.text = title;
    CGSize size = sizeForText(title, [_titleLabel.font pointSize], SCREEN_WIDTH);
    
    self.iconCenterX.constant = size.width/2 + 8;
    
    NSLog(@"frame.width:%f,iconCenterX.constant:%f",self.frame.size.width,size.width/2+8);
    // 重新计算布局
    //    [self setNeedsLayout];
    //    [self layoutIfNeeded];
}
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if(self.isSelected){
        CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI);
        _ivIcon.transform = transform;
    }else{
        _ivIcon.transform = CGAffineTransformIdentity;
    }
}
@end

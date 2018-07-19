//
//  func.c
//  Client
//
//  Created by qq on 2016/12/5.
//  Copyright © 2016年 qq. All rights reserved.
//

#include "func.h"

BOOL stringIsWhiteChar(NSString* str){
    if(str == nil || str.length == 0)return YES;
    NSString *temp = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return [temp length]==0;
}

CGSize sizeForText(NSString* text, CGFloat fontSize,CGFloat widthLimited){
    if(stringIsWhiteChar(text)){
        return CGSizeZero;
    }
    NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName: textStyle};
    
    CGSize textSize = [text boundingRectWithSize: CGSizeMake(widthLimited, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes: textFontAttributes context: nil].size;
    
    return textSize;
}

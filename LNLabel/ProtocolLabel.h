//
//  ProtocolLabel.h
//  LionNeo
//
//  Created by Lion on 2017/6/22.
//  Copyright © 2017年 com.LionNeo.www. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ProtocolClickBlock)(id label);
typedef void(^BtnClickBlock)(UIButton *button);
@interface AgreenButton : UIButton
@end
@interface ProtocolLabel : UILabel

/**
 富文本label

 @param frame label frame
 @param textString text
 @param linkColor 可点击文字颜色
 @param linkRang 可点击范围
 @param btnClickBlock 按钮点击
 @param protocolActionBlock 文字点击
 */
+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)textString LinkColor:(UIColor *)linkColor LinkRang:(NSRange)linkRang ButtonClickBlock:(BtnClickBlock)btnClickBlock ProtocolLabelActionBlock:(ProtocolClickBlock)protocolActionBlock;

@end



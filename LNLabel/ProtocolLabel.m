//
//  ProtocolLabel.m
//  LionNeo
//
//  Created by Lion on 2017/6/22.
//  Copyright © 2017年 com.LionNeo.www. All rights reserved.
//

#import "ProtocolLabel.h"
#import <TTTAttributedLabel.h>
#import <Masonry.h>

@interface AgreenButton ()

/**
 是否扩大点击区域,默认NO
 */
@property(nonatomic,assign)BOOL isExpandArea;


+ (instancetype)exButtonWithTitle:(NSString *)title ImageName:(NSString *)image SelectImage:(NSString *)selImage;

@end

@implementation AgreenButton

#pragma mark - =============================  扩大按钮的类方法  =============================
+ (instancetype)exButtonWithTitle:(NSString *)title ImageName:(NSString *)image SelectImage:(NSString *)selImage{
    
    return [[self alloc] initWithTitle:title ImageName:image SelectImage:selImage];
}

- (instancetype)initWithTitle:(NSString *)title ImageName:(NSString *)image SelectImage:(NSString *)selImage{
    if (self = [super init]) {
        
        [self setTitle:!title.length? nil : title forState:UIControlStateNormal];
        self.isExpandArea = YES;
        UIImage *ima = [UIImage imageNamed:image];
        UIImage *selIma = [UIImage imageNamed:selImage];
        [self setImage:ima forState:UIControlStateNormal];
        [self setImage:selIma forState:UIControlStateSelected];
    };
    
    return self;
}


//点击区域扩大方法
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    CGRect bounds = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    //扩大原热区直径至26，可以暴露个接口，用来设置需要扩大的半径。
    
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    
    bounds = CGRectInset(bounds, - 0.5 * widthDelta, -0.5 * heightDelta);
    //    bounds = CGRectInset(bounds, - 80, -50);
    return self.isExpandArea? CGRectContainsPoint(bounds, point) : NO;
}

@end

@interface ProtocolLabel ()<TTTAttributedLabelDelegate>
@property(nonatomic,copy)NSString *textString;
@property(nonatomic,assign)NSRange linkRang;
@property(nonatomic,strong)UIColor *linkColor;

@property(nonatomic,strong)AgreenButton *agreebutton;
@property(nonatomic,strong)TTTAttributedLabel *textLabel;

@property(nonatomic,copy)BtnClickBlock btnBlock;
@property(nonatomic,copy)ProtocolClickBlock protocolBblock;


@end
@implementation ProtocolLabel

+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)textString LinkColor:(UIColor *)linkColor LinkRang:(NSRange)linkRang ButtonClickBlock:(BtnClickBlock)btnClickBlock ProtocolLabelActionBlock:(ProtocolClickBlock)protocolActionBlock{
    
    return [[self alloc] labelWithFrame:frame text:textString LinkColor:linkColor LinkRang:linkRang ButtonClickBlock:btnClickBlock ProtocolLabelActionBlock:protocolActionBlock];
}

- (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)textString LinkColor:(UIColor *)linkColor LinkRang:(NSRange)linkRang ButtonClickBlock:(BtnClickBlock)btnClickBlock ProtocolLabelActionBlock:(ProtocolClickBlock)protocolActionBlock{
    
    _btnBlock = btnClickBlock;
    _protocolBblock = protocolActionBlock;
    return  [self initWithFrame:frame text:textString LinkColor:linkColor LinkRang:linkRang];
}

- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)textString LinkColor:(UIColor *)linkColor LinkRang:(NSRange)linkRang {
    if (self = [super initWithFrame:frame]) {
        
        _textString = textString;
        _linkColor = linkColor;
        _linkRang = linkRang;
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeTopLeft;
        
        [self makeSubviews];
    }
    return self;
}

- (void)makeSubviews{
    AgreenButton *btn = [AgreenButton exButtonWithTitle:nil ImageName:@"non_agree" SelectImage:@"agree"];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
    label.enabledTextCheckingTypes = NSTextCheckingTypeLink;
    label.delegate = self;
    label.userInteractionEnabled = YES;
    label.lineBreakMode = 1;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    label.textAlignment = NSTextAlignmentLeft;
    label.linkAttributes = @{NSForegroundColorAttributeName:self.linkColor,NSUnderlineStyleAttributeName:@(0)};
    label.activeLinkAttributes = @{NSForegroundColorAttributeName:self.linkColor,NSUnderlineStyleAttributeName:@(0)};
    
    label.text = self.textString;
    NSString *str = [self.textString substringWithRange:self.linkRang];
    [label addLinkToURL:[NSURL URLWithString:str] withRange:self.linkRang];
    _agreebutton = btn;
    _textLabel = label;
    
    
    [self addSubview:btn];
    [self addSubview:label];
    
}

- (void)layoutSubviews{
    [self.agreebutton mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(self);
         make.centerY.equalTo(self.textLabel);
         make.width.height.equalTo(@(25));
         
     }];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.bottom.right.equalTo(self);
         make.left.equalTo(self.agreebutton.mas_right);
     }];
}

#pragma mark - =============================  点击事件  =============================
- (void)btnClick:(UIButton *)sender{
    
    sender.selected = !sender.isSelected;
    !self.btnBlock? : self.btnBlock(sender);
}

- (void)attributedLabel:(TTTAttributedLabel *)label
didSelectLinkWithTextCheckingResult:(NSTextCheckingResult *)resulz{
    
    !self.protocolBblock? : self.protocolBblock(label);
}
@end

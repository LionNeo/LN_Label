//
//  ViewController.m
//  Demo
//
//  Created by Lion•Neo on 2017/7/17.
//  Copyright © 2017年 Lion•Neo. All rights reserved.
//

#import "ViewController.h"
#import "ProtocolLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     # LN_Label
     一行label搞定协议文本点击事件.
     
     # 使用说明
     此次封装的label适用于,登录界面中关于勾选是否同意协议,并且加入了文字点击事件,使用非常简单一行代码搞定.
     
     需要更换图片的话,直接在更换自己的图片文件,在源码中修改图片名字即可
     
     需要导入的框架有 masonry 和 TTTAttributedLabel.TTTAttributedLabel已经拖入工程中,实际上只需要导入masonry即可
     
     注意:block中使用self,请使用弱引用加强引用方式
     #define WEAKSELF __weak __typeof__(self) weakSelf = self;
     #define STRONGSELF __strong __typeof(self) strongSelf = weakSelf;
     e.g:
     weakSelf;
     void (^block)() = ^{
     strongSelf;
     self.name = @"LionNeo";
     }
     
     # 使用问题,请联系:QQ:123624331
     */
    ProtocolLabel *label = [ProtocolLabel labelWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50) text:@"这是一份<<ios开发协议>>,请点击按钮遵守协议!" LinkColor:[UIColor redColor] LinkRang:NSMakeRange(4, 11) ButtonClickBlock:^(UIButton *button) {
        
        NSLog(@"同意按钮已经点击");
        
    } ProtocolLabelActionBlock:^(id label) {
        
        NSLog(@"协议内容已经点击");
        
    }];
    
    [self.view addSubview:label];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

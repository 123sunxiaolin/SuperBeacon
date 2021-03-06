//
//  AgreeMentViewController.m
//  EarthIOS
//
//  Created by kys－1 on 15-4-25.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "AgreeMentViewController.h"

@interface AgreeMentViewController ()
@property (weak, nonatomic) IBOutlet UITextView *agreementTextView;

@end

@implementation AgreeMentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用户协议";
    [self setLeftNavButtonType:NavButtonBack];
    
    _agreementTextView.backgroundColor = [UIColor clearColor];
    _agreementTextView.editable = NO;
    _agreementTextView.textColor = HEXCOLOR(0x333333);
    _agreementTextView.showsHorizontalScrollIndicator = NO;
    _agreementTextView.showsVerticalScrollIndicator = NO;
    _agreementTextView.text = @"一、注册协议条款的确认和接受\n  本公司同意按照本协议的规定及其不定时发布的操作规则提供基于互联网和移动网的相关服务(以下称“网络服务”)。\n  为获得网络服务, 申请人应当认真阅读、充分理解本《协议》中各条款, 包括免除或者限制本公司责任的免责条款及对用户的权利限制条款。请用户审慎阅读本《协议》(未成年人应在法定监护人陪同下阅读)。\n  同意接受本协议的全部条款,申请人应当按照应用程序页面上的提示完成全部的注册程序, 否则申请人应当终止并退出申请。\n  本《协议》可由本公司随时更新, 更新后的协议条款一旦公布即代替原来的协议条款, 恕不再另行通知, 用户可在本公司官方网站上查阅最新版协议条款。在修改《协议》条款后, 如果用户不接受修改后的条款, 请立即停止使用本公司提供的网络服务, 继续使用的用户将被视为已接受了修改后的协议。\n二、服务内容 \n1、网络服务的具体内容由本公司根据实际情况提供。 \n2、用户理解, 本公司仅提供相关的网络服务, 除此之外与相关网络服务有关的设备(如手机或其他与接入互联网或移动网有关的装置)及所需的费用(如为接入互联网而支付的上网费、为使用移动网而支付的手机费)均应由用户自行负担。 \n3、您不得干扰我们正常地提供产品和服务，包括但不限于：\n（1）攻击、侵入我们的服务器或使服务器过载；\n（2）破解、修改我们提供的客户端程序；\n（3）利用程序的漏洞和错误（Bug）破坏服务的正常进行；\n（4）不合理地干扰或阻碍他人使用我们所提供的产品和服务。 \n三、用户账号 \n1、经本公司的应用程序的注册系统完成注册程序的用户即为正式用户。\n2、用户账号的所有权归本公司, 用户完成申请注册后, 用户享有使用权。 \n3、用户有义务保证密码和账号的安全, 用户利用该账号所进行的一切活动引起的任何损失或损害, 由用户自行承担全部责任, 本公司不承担任何责任。如用户发现账号遭到未授权的使用或发生其他任何安全问题, 应立即修改账号密码并妥善保管。因黑客行为或用户的保管疏忽导致账号非法使用, 本公司不承担任何责任。\n4、用户账号在丢失、遗忘密码后, 须遵照本公司的应用程序的密码找回程序找回账号密码。用户可以凭注册邮箱找回账号的密码。本应用程序的账户密码找回机制仅负责识别用户找回密码时所提交信息与系统记录资料是否一致, 而无法识别申请密码找回者是否系账号的真正使用权人。对用户因被他人冒名申请而致的任何损失, 本公司不承担任何责任, 用户知晓账号及密码保管责任在于用户, 本应用程序并不承诺账号丢失或遗忘密码后用户一定能通过应用程序找回账号。用户应当谨慎填写初始注册邮箱作为密码找回指定邮箱。 \n四、隐私保护 \n  保护用户隐私是本公司的一项基本政策, 本公司保证不对外公开或向第三方提供用户的注册资料,但下列情况除外: \n1、事先获得用户的书面明确授权;\n2、根据有关的法律法规要求;\n3、按照相关政府主管部门的要求;\n4、为维护社会公众的利益;\n5、为维护本公司的合法权益;";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

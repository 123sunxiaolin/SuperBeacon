//
//  Path.h
//  EarthIOS
//
//  Created by Xiaohui on 15/3/1.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#ifndef EarthIOS_Path_h
#define EarthIOS_Path_h

#define Host @"http://172.18.74.11:8080"

#define UserLogin @"/eFlying/access/login" //new
#define UserRegister @"/eFlying/access/register" //new
#define ChangeAvatar  @"/eFlying/access/updateAvatar" //new
#define UpdateInfo @"/eFlying/access/update" //new

#define GetMessageCode @"/access/send_msg_code/"
#define ValidateMessageCode @"/access/validate_msg_code/"
#define NewPassword @"/access/reset_password/"
#define NickExist @"/access/nick_exist/"
#define Album @"/user/album_list/"
#define AddPhoto @"/user/add_album_image/"
#define Wealth @"/user/wealth_count_list/"
#define PurchaseRecord @"/user/purchase_record/"
#define PresentOutRecord @"/user/present_out_record/"
#define PresentInRecord @"/user/present_in_record/"
#define WithdrawRecord @"/user/withdraw_record/"
#define GetGoodsPriceList @"/good/buy_price/"
#define BuyMember @"/good/member_buy/"
#define BuyGoods @"/good/present_buy/"
#define Withdraw @"/good/withdraw/"
#define WithdrawPriceList @"/good/withdraw_price/"
#define WithdrawRecordList @"/good/withdraw_record_list/"
#define Rank @"/connect/user_charts/"
#define Friend @"/connect/related_list/"
#define UserDetail @"/user/view_info/"
#define Black @"/user/add_black/"
#define Follow @"/user/add_attension/"
#define ActionAll @"/action/active_list/"
#define ActionKinds @"/action/kind/"
#define ActionCreated @"/action/start_list/"
#define ActionChoose @"/action/choose_participate/"
#define ActionJoined @"/action/applier_list/"
#define CreateAction @"/action/start_action/"
#define JoinAction @"/action/participate_action/"
#define ActionComplaint @"/action/make_complaint/"
#define ActionDetail @"/action/action_detail/"
#define SendPresent @"/user/send_present/"
#define Remark @"/user/set_nick_remark/"
#define AppVersion @"/system/app_version/"
#define UserThirdLogin @"/access/third_login/"
#define ChangeNick  @"/user/set_selfnick/"
#define ChangeSex   @"/user/set_sex/"
#define ChangeVoice  @"/user/change_voice/"


#define BuyMemberComplete @"/good/member_buy_complete/"
#define BuyGoodsComplete @"/good/present_buy_complete/"

#endif



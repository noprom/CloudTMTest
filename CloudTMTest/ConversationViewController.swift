//
//  ConversitionViewController.swift
//  CloudTMTest
//
//  Created by noprom on 15/7/17.
//  Copyright (c) 2015年 noprom. All rights reserved.
//

import UIKit

class ConversationViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 初始化聊天的对象
        self.targetId = RCIMClient.sharedRCIMClient().currentUserInfo.userId
        self.userName = RCIMClient.sharedRCIMClient().currentUserInfo.name
        self.conversationType = RCConversationType.ConversationType_PRIVATE // 私聊
        self.title = "与" + self.userName + "对话中"
        
        self.setMessageAvatarStyle(RCUserAvatarStyle._USER_AVATAR_CYCLE) // 设置圆形边角
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

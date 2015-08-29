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
        
//        // 设置与当前登陆用户聊天的对象
//        let currentUser = RCIMClient.sharedRCIMClient().currentUserInfo
//        self.targetId = currentUser.userId
//        self.userName = currentUser.name
//        self.title = currentUser.name
        self.conversationType = RCConversationType.ConversationType_PRIVATE
        self.setMessageAvatarStyle(.USER_AVATAR_CYCLE)
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

//
//  AppDelegate.swift
//  CloudTMTest
//
//  Created by noprom on 15/7/8.
//  Copyright (c) 2015年 noprom. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RCIMUserInfoDataSource {

    var window: UIWindow?
    
    // 获取用户信息
    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        
        print("＝＝＝＝＝调用getUserInfoWithUserId＝＝＝＝＝")
        
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        
        switch userId {
            case "noprom":
                print("＝＝＝＝＝noprom＝＝＝＝＝")
                userInfo.name = "noprom"
                userInfo.portraitUri = "http://p3.gexing.com/G1/M00/D0/6D/rBACFFL5nm3ygtgpAAAbCjPPEXA557_200x200_3.jpg?recache=20131108"
            case "noprom2":
                userInfo.name = "noprom2"
                userInfo.portraitUri = "http://img4.duitang.com/uploads/item/201407/20/20140720085149_zmhzh.jpeg"
            default:
            print("没有该用户")
        }
        return completion(userInfo)
    }
    
    func connectServer(completion:()-> Void) {
        // 查询保存的token
        RCIM.sharedRCIM().initWithAppKey("p5tvi9dst0ot4")
        
        //  用token测试连接
        RCIM.sharedRCIM().connectWithToken("vG3qJ2oRhaRbU2orLofNLBvCsfV0IEBWQxMMac9/Ex/kusEyUgdPWYdfoxU13c31t873u7CzQ5JtifXz6ehzhg==", success: { (_) -> Void in
                print("连接成功1!")
                // 当前登录的用户
                let currentUser = RCUserInfo(userId: "noprom", name: "noprom", portrait: "http://p3.gexing.com/G1/M00/D0/6D/rBACFFL5nm3ygtgpAAAbCjPPEXA557_200x200_3.jpg?recache=20131108")
                RCIMClient.sharedRCIMClient().currentUserInfo = currentUser

                // 在主线程中执行
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    completion()
                })
           
            }, error: { (_) -> Void in
                print("连接失败")
            }) { () -> Void in
                print("token不正确")
        }
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // 设置用户信息提供者为自己
        RCIM.sharedRCIM().userInfoDataSource = self
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was iactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


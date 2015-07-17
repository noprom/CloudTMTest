//
//  AppDelegate.swift
//  CloudTMTest
//
//  Created by noprom on 15/7/8.
//  Copyright (c) 2015年 noprom. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // 查询保存的token
        let deviceTokenCache = NSUserDefaults.standardUserDefaults().objectForKey("kDeviceToken") as? String
        //  初始化融云模块
        RCIM.sharedRCIM().initWithAppKey("p5tvi9dst0ot4", deviceToken: deviceTokenCache)
        
        //  用token测试连接
        RCIM.sharedRCIM().connectWithToken("aOie0oGDxIhZuUwg4hX5xxvCsfV0IEBWQxMMac9/Ex92VqK/Dg4tv9OJzIctO4STjwpIro5qiP5tifXz6ehzhg==", success: { (_) -> Void in
            println("连接成功")
            
            // 当前登录的用户
            let currentUser = RCUserInfo(userId: noprom, name: "小王", portrait: "http://www.huntdreams.com/templets/hunt/images/2.png"))
            
            
            RCIMClient.sharedRCIMClient().currentUserInfo = currentUser
            
            
        }, error: { (_) -> Void in
            println("连接失败")
        }) { () -> Void in
            println("token不正确")
        }
        
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
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


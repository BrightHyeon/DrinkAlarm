//
//  AppDelegate.swift
//  DrinkAlarm
//
//  Created by HyeonSoo Kim on 2022/01/31.
//

import UIKit
import NotificationCenter //알림 보내기용 (><)
import UserNotifications //알림보내기위해 사용자 승인 받기위한용 (^^)

 @main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //^^
    let userNotificationCenter = UNUserNotificationCenter.current()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UNUserNotificationCenter.current().delegate = self //><
        
        //^^  권한부여옵션
        let authorizationOptions = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
        //^^ 설정한 옵션에 대한 승인요구 - 이게 잘 작성되어야 함. 승인을 받아야 만든 알림을 보낼 수 있는 것!
        userNotificationCenter.requestAuthorization(options: authorizationOptions, completionHandler: { _, error in
            if let error = error {
                print("ERROR: notification authorization request \(error.localizedDescription)")
            }
        })
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate: UNUserNotificationCenterDelegate { //><
    //Notification을 보내기 전에 어떤 handling을 해줄지를 작성.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .list, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}


/*

UNNotification : NSNotification이랑은 다른 용도.

1. AppDelegate에서 import NotificationCenter
2. didFinishLaunchingWithOptions에 Delegate 선언 = self
3. (extension으로 빼서) Delegate 프로토콜 준수
   : willPresent 및 didReceive 함수 채택.
 
* 그리고 사용자에게 로컬알림을 받으려면 먼저 사용자의 승인을 받아야함.

*/

//
//  UNNotificationCenter.swift
//  DrinkAlarm
//
//  Created by HyeonSoo Kim on 2022/02/03.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter {
    //Alert객체를 받아서 알림을 만들고, 최종적으로 Notification에 추가하는 함수를 구현
    func addNotificationRequest(by alert: Alert) {
        let content = UNMutableNotificationContent()
        content.title = "물 마실 시간이예요💦"
        content.body = "세계보건기구(WHO)가 권장하는 하루 물 섭취량은 1.5~2리터 입니다."
        content.sound = .default
        content.badge = 1 //뱃지 사라지게 하는 코드는 따로 작성해줘야함.
        //어떤 시점에 뱃지를 사라지게 할지. -> SceneDelegate에서 고고.
        
        //Calendar trigger 구성.
        let component = Calendar.current.dateComponents([.hour, .minute], from: alert.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: alert.isOn) //스위치 on이면 매칭되는 시간에 계속 방아쇠 당기고, off면 당기지 않고.
        
        let request = UNNotificationRequest(identifier: alert.id, content: content, trigger: trigger)
        
        //self는 UNUserNotificationCenter를 가르킴.
        self.add(request, withCompletionHandler: nil)
    }
}

//request의 identifier, content, trigger를 구성하고, 만들어진 요청을 UNUserNotificationCenter에 추가.
//이제 이런 로컬알림 추가함수를 알람이 만들어지는 곳, 스위치가 켜지는 곳에 각각 추가해줘야함. 

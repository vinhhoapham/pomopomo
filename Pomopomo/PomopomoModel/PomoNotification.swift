//
//  NotificationCenter.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/17/20.
//

import Foundation
import NotificationCenter

struct pomoNotification {
    var content = UNMutableNotificationContent()
    var time : Double
    
    init(content: Content, time: Double){
        self.content.title = content.title
        self.content.subtitle = content.subtitle
        self.time = time
        let requestAnAuthorization = UNUserNotificationCenter.current()
        requestAnAuthorization.requestAuthorization(options: [.alert, .sound, .badge]){ granted, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func push() {
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
}

struct Content {
    var title : String
    var subtitle : String
}

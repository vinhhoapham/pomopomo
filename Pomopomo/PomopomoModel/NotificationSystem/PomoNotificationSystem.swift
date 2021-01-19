//
//  PomoNotificationSystem.swift
//  Pomopomo
//
//  Created by Vinh Pham on 12/24/20.
//

import Foundation
import NotificationCenter


class pomoNotificationSystem {
    var availiableNotifications = [pomoNotification]()
    let center = UNUserNotificationCenter.current()
    
    init() {
        center.requestAuthorization(options: [.alert, .badge, .announcement, .sound]) { success, error in
            if success {
                print("Success")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func push(notification: pomoNotification){
        
        availiableNotifications.append(notification)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: notification.time, repeats: false)
        let request = UNNotificationRequest(identifier: notification.id.uuidString, content: notification.content, trigger: trigger)
        center.add(request)
        print(availiableNotifications)
    }
    
    func remove(notification: pomoNotification) {
        center.removePendingNotificationRequests(withIdentifiers: [notification.id.uuidString])
        
        if let indexOfNotification = availiableNotifications.firstIndex(where: {$0.id == notification.id}) {
            availiableNotifications.remove(at: indexOfNotification)
        }
        
        
        
    }
    
    func update(period: PomoPeriod) {
        let periodsNotification = pomoNotification(period: period)
        
        self.remove(notification: periodsNotification)
        self.push(notification: periodsNotification)
       
    }
}



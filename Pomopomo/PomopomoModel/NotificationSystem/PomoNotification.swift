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
    let id : UUID
    
    
    init(content: Content, time: Double, id: UUID){
        self.content.title = content.title
        self.content.subtitle = content.subtitle
        self.content.sound = UNNotificationSound.default
        self.time = time
        self.id = id
    }
    
}

struct Content: Codable  {
    var title : String
    var subtitle : String
}


extension pomoNotification {
    init(period: PomoPeriod) {
        let periodContent = Content(title: period.name, subtitle: "")
        self.init(content: periodContent, time: Double(period.remainingTime), id: period.id)
    }
}


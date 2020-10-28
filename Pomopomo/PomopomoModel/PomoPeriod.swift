//
//  TimeInterval.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/17/20.
//

import Foundation


struct pomoPeriod {
    private(set) var startTime : Date
    private(set) var duration : DateInterval
    private(set) var supposedEndTime : Date
    private var name : String
    
    init(lasts minutes: Double, name : String) {
        startTime = Date()
        supposedEndTime = Date().advanced(by: minutes*60)
        duration = DateInterval(start: startTime, end: supposedEndTime)
        self.name = name
        let notificaition = pomoNotification(content: Content(title: name, subtitle: "Your session is over"), time: minutes * 60)
        notificaition.push()
    }
    
    
    func export(status: status){
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .full
        
        let stringalizedStartTime = formatter.string(from: startTime)
        let stringalizedSupposedEndTime = formatter.string(from: supposedEndTime)
        let stringalizedDateInterval = duration.description
        let stringalizedStauts : String
        
        switch status {
        case .active:
            stringalizedStauts = "active"
        case .finished:
            stringalizedStauts = "finished"
        }
        let message = stringalizedStartTime + "," + stringalizedSupposedEndTime + "," + stringalizedDateInterval + "," + stringalizedStauts + "\n" 
        logFile.write(content: message)
        
    }
    
}

enum status{
    case active
    case finished
}

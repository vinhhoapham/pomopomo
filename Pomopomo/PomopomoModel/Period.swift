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
    
    
    func export(to file: FILE){
        
    }
    
    func stop(){
        
    }
    
    func resume(){
        
    }
    
    mutating func cancel() {
        
    }
}

//
//  TimeInterval.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/17/20.
//

import Foundation
import SwiftUI

struct PomoPeriod : Codable, Hashable {
    
    //MARK: Information variables
    
    private(set) var startTime : Date
    private(set) var periodInterval : DateInterval
    private(set) var remainingTime : Float
    private(set) var name : String
    private(set) var originalDuration : Float
    private(set) var status : PomoStatus = .inactive
    var progress : Float {
        get { return remainingTime/originalDuration }
        set {} 
    }
    let id : UUID
    
    var json: Data? { try? JSONEncoder().encode(self) }
    
    //MARK: Initializations
    
    init(lasts minutes: Double, name : String) {
        startTime = Date()
        originalDuration = Float(minutes * 60)
        periodInterval = DateInterval(start: startTime, duration: TimeInterval(originalDuration))
        remainingTime = originalDuration
        self.name = name
        self.id = UUID()
        self.status = .active
        notificationSystem.push(notification: pomoNotification(period: self))
    }
    
    init?(json: Data?) {
        if let json = json, let loadedPeriod = try? JSONDecoder().decode(PomoPeriod.self, from: json) {
            self = loadedPeriod
        } else {
            return nil
        }
    }
    // MARK: Auxiliary functions that affects the status of the period
    
    mutating func progress(by time: Float) {
        remainingTime = remainingTime - time
        
        if remainingTime <= 0 {
            progress = 0
            self.finished()
        }
        
    }
    
    mutating func finished() {
        self.status = .finished
        storeSystem.addFinishedPeriod(period: self)
    }
    
    mutating func resumed() {
        let estimatedInterval = DateInterval(start: Date(), duration: TimeInterval(remainingTime))
        periodInterval = estimatedInterval 
    }
    
    mutating func resumedFromAppRestarting() {
        let estimatedInterval = DateInterval(start: Date(), duration: TimeInterval(remainingTime))
        
        if estimatedInterval.end != periodInterval.end {
            remainingTime = Float(DateInterval(start: Date(), end: periodInterval.end
            ).duration)
        }
    }
    
    mutating func paused() {
        self.status = .inactive
    }
    
    mutating func cancelled() {
        self.status = .cancelled
        storeSystem.addFinishedPeriod(period: self)
    }
    
    mutating func checked() {
        if Date() >= periodInterval.end  {
            self.finished()
        }
    }
    
}

enum PomoStatus : Int, Codable {
    case active
    case inactive
    case finished
    case cancelled
}

//
//  TimeInterval.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/17/20.
//

import Foundation


struct PomoPeriod : Codable {
    
    //MARK: Information variables
    
    private(set) var startTime : Date
    private(set) var periodInterval : DateInterval
    private(set) var remainingTime : Float
    private(set) var name : String
    private(set) var originalDuration : Float
    private(set) var status : PomoStatus = .inactive
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
    }
    
    init?(json: Data?) {
        if let json = json, let loadedPeriod = try? JSONDecoder().decode(PomoPeriod.self, from: json) {
            self = loadedPeriod
        } else {
            return nil
        }
    }
    // MARK: Auxiliary functions
    
    mutating func progress(by time: Float) {
        remainingTime = remainingTime - time
        
        if remainingTime == 0 {
            self.finished()
        }
        
    }
    
    mutating func finished() {
        self.status = .finished
        storeSystem.addFinishedPeriod(period: self)
    }
    
    mutating func resumed() {
        let estimatedInterval = DateInterval(start: startTime, duration: TimeInterval(remainingTime))
        
        if estimatedInterval.end != periodInterval.end {
            periodInterval = estimatedInterval
            notificationSystem.update(period: self)
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

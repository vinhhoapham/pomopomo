//
//  PomoPomoUIUpdate.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/18/20.
//

import Foundation


var currentSession = pomoSession()


struct pomoSession {
    var period : pomoPeriod? {
        willSet {
            if newValue == nil {
                period!.export(status: status)
            }
        }
    }

    var status: status{
        mutating get {
            return (getProgress().percentage > 1) ? .finished : .active
        }
    }
    mutating func start(name: String, lasts minute: Double) { period = pomoPeriod(lasts: minute, name: name) }

    // MARK: Make this into a variable
    mutating func getProgress() -> (minute: Int, second: Int, percentage: Float){
        guard (period != nil) else {
            return(0,0,0)
        }
        let timePassed = Calendar.current.dateComponents([.minute, .second], from: period!.startTime, to: Date())
        let percentageOfTimePassed = Double( (timePassed.minute! * 60 + timePassed.second!))/period!.duration.duration
        
        if percentageOfTimePassed > 1 {
            period = nil
        }
        return (timePassed.minute!, timePassed.second!, Float(percentageOfTimePassed))
    }
    
    mutating func cancel(){
        period = nil
    }
    
    
    
}




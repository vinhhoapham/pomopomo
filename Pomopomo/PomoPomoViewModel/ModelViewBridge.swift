//
//  PomoPomoUIUpdate.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/18/20.
//

import Foundation

var currentSession : pomoPeriod?

func startASession(name: String, lasts minute: Double) {
    currentSession = pomoPeriod(lasts: minute, name: name)
}

func getProgress() -> (minute: Int, second: Int, percentage: Float){
    guard (currentSession != nil) else {
        return(0,0,0)
    }
    let timePassed = Calendar.current.dateComponents([.minute, .second], from: currentSession!.startTime, to: Date())
    let percentageOfTimePassed =  Double((timePassed.minute!*60+timePassed.second!))/currentSession!.duration.duration
    
    if percentageOfTimePassed > 1 {
        currentSession = nil
    }
    return (timePassed.minute!, timePassed.second!, Float(percentageOfTimePassed))
}







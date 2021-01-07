//
//  PomoPomoUIUpdate.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/18/20.
//
import Foundation


var pomopomoViewModel = PomoViewModel()


class PomoViewModel {
    var currentPeriod : PomoPeriod?
    var isPaused = true
    
    func start(name: String, lasts minute: Double) {
        currentPeriod = PomoPeriod(lasts: minute, name: name)
        isPaused = false
    }

    
    
    func cancel(){
        currentPeriod?.cancelled()
        currentPeriod = nil
        
    }
    
    func resume() {
        currentPeriod?.resumed()
        isPaused = false
    }
    
    func pause() {
        currentPeriod?.paused()
        isPaused = true
    }
    
    
}




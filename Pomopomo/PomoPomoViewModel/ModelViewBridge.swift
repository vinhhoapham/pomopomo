//
//  PomoPomoUIUpdate.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/18/20.
//
import Foundation



class PomoViewModel: ObservableObject {
    @Published var currentPeriod : PomoPeriod?
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
    
    func reboot() {
        currentPeriod?.resumedFromAppRestarting()
        isPaused = false
    }
    
}




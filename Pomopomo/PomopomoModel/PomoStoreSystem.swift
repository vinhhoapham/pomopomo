//
//  PomoFileManager.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/25/20.
//

import Foundation
import Combine
import SwiftUI


class PomoStoreSystem {
    
    @Published private(set) var storedPeriods = [PomoPeriod]()
    @Published private(set) var activePeriod : PomoPeriod? = nil
    
    private var activePeriodAutosaveCancellable : AnyCancellable?
    private var storedPeriodsAutosaveCancellable : AnyCancellable?
    private let activePeriodKey = "Pomo.activePeriod"
    private let storedPeriodsKey = "Pomo.storedPeriods"
    var storedPeriodsJson: Data? { try? JSONEncoder().encode(storedPeriods) }
    
    
    init() {
        
        
        activePeriod = PomoPeriod(json: UserDefaults.standard.data(forKey: self.activePeriodKey)) ?? nil
        
        storedPeriods = UserDefaults.standard.array(forKey: storedPeriodsKey) as? [PomoPeriod] ?? []
        
        storedPeriodsAutosaveCancellable = $storedPeriods.sink{ _ in
            UserDefaults.standard.set(self.storedPeriodsJson, forKey: self.storedPeriodsKey)
        }
        
        activePeriodAutosaveCancellable = $activePeriod.sink { period in
            UserDefaults.standard.set(period?.json ?? nil, forKey: self.activePeriodKey)
            }
        
    }
    
    func addFinishedPeriod(period: PomoPeriod) {
        storedPeriods.append(period)
        activePeriod = nil
    }
    
    func removePeriod(period: PomoPeriod) {
        if let indexOfPeriod = storedPeriods.firstIndex(where: { $0.id == period.id}) {
            storedPeriods.remove(at: indexOfPeriod)
        }
    }
    
    func updateActivePeriod(with period: PomoPeriod?) {
        activePeriod = period
    }
    
    func isThereAnActivePeriod() -> Bool {
        activePeriod?.checked()
        if (activePeriod != nil) { return true}
        else{ return false}
    }
    
}




 

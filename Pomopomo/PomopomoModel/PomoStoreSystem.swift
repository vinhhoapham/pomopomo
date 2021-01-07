//
//  PomoFileManager.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/25/20.
//

import Foundation
import Combine
import SwiftUI


class pomoStoreSystem {
    
    @Published private(set) var storedPeriods = [PomoPeriod]()
    @Published private(set) var activePeriod : PomoPeriod? = nil
    
    private var autosaveCancellable : AnyCancellable?
    private let activePeriodKey = "Pomo.activePeriod"
    private let storedPeriodsKey = "Pomo.storedPeriods"
    var storedPeriodsjson: Data? { try? JSONEncoder().encode(storedPeriods) }
    
    
    init() {
        
        
        activePeriod = PomoPeriod(json: UserDefaults.standard.data(forKey: self.activePeriodKey)) ?? nil
        
        storedPeriods = UserDefaults.standard.array(forKey: storedPeriodsKey) as? [PomoPeriod] ?? []
        
        autosaveCancellable = $activePeriod.sink { period in
            UserDefaults.standard.set(period?.json ?? nil, forKey: self.activePeriodKey)
            }
        
    }
    
    func addFinishedPeriod(period: PomoPeriod) {
        storedPeriods.append(period)
        UserDefaults.standard.set(storedPeriodsjson, forKey: storedPeriodsKey)
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

var storeSystem = pomoStoreSystem()


 

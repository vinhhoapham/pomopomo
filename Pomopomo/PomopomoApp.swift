//
//  PomopomoApp.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/17/20.
//

import SwiftUI

let checkingInterval = Float(0.1)
var storeSystem = PomoStoreSystem()
let checkingTimer = Timer.publish(every: Double(checkingInterval), on: .main, in: .common).autoconnect()
var notificationSystem = pomoNotificationSystem()

@main
struct PomopomoApp: App {
    @State var pomopomoViewModel = PomoViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: $pomopomoViewModel).onAppear(){
                if storeSystem.isThereAnActivePeriod() {
                    pomopomoViewModel.currentPeriod = storeSystem.activePeriod
                    pomopomoViewModel.reboot()
                }
            }.onReceive(checkingTimer) { _ in
                
                if pomopomoViewModel.currentPeriod != nil{
                    if !pomopomoViewModel.isPaused {
                        pomopomoViewModel.currentPeriod!.progress(by: checkingInterval)
                        if (pomopomoViewModel.currentPeriod!.status == .finished) {
                            pomopomoViewModel.currentPeriod = nil
                        }
                        storeSystem.updateActivePeriod(with: pomopomoViewModel.currentPeriod ?? nil)
                    }
                }
            }
        }
    }
}





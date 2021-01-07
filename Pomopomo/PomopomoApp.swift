//
//  PomopomoApp.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/17/20.
//

import SwiftUI

@main
struct PomopomoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear(){
                if storeSystem.isThereAnActivePeriod() {
                    pomopomoViewModel.currentPeriod = storeSystem.activePeriod
                }
            }
        }
    }
}





//
//  PomoMenu.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/18/20.
//

import SwiftUI
import Foundation

struct PomoMenu: View {
    
    let automaticTimer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    let checkingInterval = 0.1
    @State var progress: Float = 0.0
    @State var durationOfPeriod : String = ""
    var nameOfPeriod : String = ""
    
    var body: some View {
        VStack(spacing: 30){
            
            TextField("Timer", text: $durationOfPeriod)
                .keyboardType(.decimalPad)
                .border(Color.blue)
                .frame(width: 300, height: 150, alignment: .center)
            
            
            HStack(spacing: 20){
                PomoMenu_Button(name: "Start", color: Color.green) {
                    if let duration = Double(durationOfPeriod), duration > 0 {
                        print("Clicked")
                        pomopomoViewModel.start(name: "", lasts: duration)
                    }
                }
                PomoMenu_Button(name: "Stop", color: Color.red) {
                    pomopomoViewModel.cancel()
                }
                PomoMenu_Button(name: "Pause", color: Color.blue) {
                    pomopomoViewModel.pause()
                }
                
            }.frame(alignment: .topLeading)
            
            progressCircle(progress: self.$progress).onReceive(automaticTimer) {_ in
                if pomopomoViewModel.currentPeriod != nil{
                    if !pomopomoViewModel.isPaused {
                        pomopomoViewModel.currentPeriod!.progress(by: Float(checkingInterval))
                        storeSystem.updateActivePeriod(with: pomopomoViewModel.currentPeriod ?? nil)
                    }
                    
                    progress = Float(pomopomoViewModel.currentPeriod!.remainingTime ) / pomopomoViewModel.currentPeriod!.originalDuration
                } else {
                    progress = 0.0
                }
            }
            
            Spacer()
            
        }
    }
    
    
}






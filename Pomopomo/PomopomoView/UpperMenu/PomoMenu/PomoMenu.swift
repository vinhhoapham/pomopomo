//
//  PomoMenu.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/18/20.
//

import SwiftUI
import Foundation

struct PomoMenu: View {
    
    @Binding var viewModel : PomoViewModel
    @State var durationOfPeriod : String = ""
    var nameOfPeriod : String = ""
    @State var progress : Float = 0.0
    
    var body: some View {
        VStack(spacing: 30){
            
            TextField("Timer", text: $durationOfPeriod)
                .keyboardType(.decimalPad)
                .border(Color.blue)
                .frame(width: 300, height: 150, alignment: .center)
            
            
            HStack(spacing: 20){
                PomoMenu_Button(name: "Start", color: Color.green) {
                    if let duration = Double(durationOfPeriod), duration > 0 {
                        viewModel.start(name: "", lasts: duration)
                    }
                }
                PomoMenu_Button(name: "Stop", color: Color.red) {
                    viewModel.cancel()
                }
                PomoMenu_Button(name: "Pause", color: Color.blue) {
                    viewModel.pause()
                }
            
            }.frame(alignment: .topLeading)
            
            progressCircle(progress: self.$progress).onReceive(checkingTimer)  { _ in
                if viewModel.currentPeriod != nil{
                                    progress = Float(viewModel.currentPeriod!.remainingTime ) / viewModel.currentPeriod!.originalDuration
                                } else {
                                    progress = 0.0
                                }
            }
            
            Spacer()
            
        }
    }
    
    
}






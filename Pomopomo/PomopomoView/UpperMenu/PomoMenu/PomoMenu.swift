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
                        currentSession.start(name: "", lasts: duration)
                    } else {
                        print("WRONG!!!")
                    }
                    
                }
                PomoMenu_Button(name: "Stop", color: Color.red) {
                    currentSession.cancel()
                }
                
            }.frame(alignment: .topLeading)
            
            progressCircle(progress: self.$progress).onReceive(automaticTimer) {_ in
                progress = currentSession.getProgress().percentage
            }
            
            Spacer()
            
        }
    }
    
    
}




struct PomoMenu_Previews: PreviewProvider {
    static var previews: some View {
        PomoMenu()
    }
}

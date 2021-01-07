//
//  ContentView.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/17/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewUI = currentUI
  
    var body: some View {
        VStack(){
          
            switch currentUI.chosenMenu {
                case .pomoMenu:
                    PomoMenu()
                case .setting:
                    SettingMenu()
                case .history:
                    HistoryMenu()
            }
            
            Spacer()
            
            BottomMenu()
            
        }.ignoresSafeArea(edges: .bottom)
    }
}


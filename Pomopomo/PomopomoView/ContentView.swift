//
//  ContentView.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/17/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewUI = currentUI
    @Binding var viewModel : PomoViewModel
    var body: some View {
        VStack(){
          
            switch viewUI.pickedMenu {
                case .pomoMenu:
                    PomoMenu(viewModel: $viewModel)
                case .setting:
                    SettingMenu()
                case .history:
                    HistoryMenu(historyOfPeriods: storeSystem.storedPeriods)
            }
            
            Spacer()
            
            BottomMenu()
            
        }.ignoresSafeArea(edges: .bottom)
    }
}


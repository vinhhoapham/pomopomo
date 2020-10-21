//
//  ContentView.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/17/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(){
            PomoMenu()
            Spacer()
            BottomMenu()
        }.ignoresSafeArea(edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

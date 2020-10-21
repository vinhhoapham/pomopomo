//
//  PomoMenu_progressCircle.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/19/20.
//

import SwiftUI

struct progressCircle : View{
    @Binding var progress : Float
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .frame(width: 350, height: 350)
                .foregroundColor(.gray)
            Circle()
                .trim(from: 0.0, to: CGFloat(progress))
                .stroke(lineWidth: 20.0)
                .frame(width: 350, height: 350)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeIn)
            Text(String(Int(progress*100))+"%")
                .font(.largeTitle)
                .bold()
        }
       
    }
}









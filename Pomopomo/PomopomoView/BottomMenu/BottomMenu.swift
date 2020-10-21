//
//  BottomMenu.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/18/20.
//

import SwiftUI

struct BottomMenu: View {
    var body: some View {
            HStack(){
                Spacer()
                BottomMenu_button(name: "History", functionality: {print("Ok")}, withDivider: true)
                BottomMenu_button(name: "Pomo", functionality: {print("Ok")}, withDivider: true)
                BottomMenu_button(name: "Setting", functionality: {print("Ok")}, withDivider: false)
                Spacer()
                
            }.background(Color(#colorLiteral(red: 0.9459628463, green: 0.1294037402, blue: 0, alpha: 1)))
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width,height: 70)
            .scaledToFit()
            .ignoresSafeArea()
    }
}



struct BottomMenu_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Color.black.opacity(0.5)
            BottomMenu()
        }.ignoresSafeArea(.all)
        
    }
}

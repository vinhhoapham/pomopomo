//
//  ButtonMenusButton.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/20/20.
//

import SwiftUI

struct BottomMenu_button: View{
    
    var name : String
    var functionality : () -> ()
    var isDividerIncluded = true
    
    init(name: String,functionality: @escaping ()-> (), withDivider divider: Bool){
        self.name = name
        self.functionality = functionality
        self.isDividerIncluded = divider
    }
    
    var body: some View{
        HStack{
            Button(action: {functionality()}, label: {
                Text(name)
                    .font(.system(size: 20)).fontWeight(.regular)
                    .padding(.trailing, 30)
                    .padding(.leading, 30)
            })
            
            if (isDividerIncluded) {
                Divider().border(Color.white, width: 10)
            }
            
        }
        
        
    }
    
    
}

struct ButtonMenusButton_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenu_button(name: "Test", functionality: {}, withDivider: true)
    }
}

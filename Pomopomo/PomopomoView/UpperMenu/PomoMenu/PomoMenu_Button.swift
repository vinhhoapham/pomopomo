//
//  PomoMenu_Button.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/20/20.
//

import SwiftUI

struct PomoMenu_Button: View {
    
    var name : String
    var functionality : () -> ()
    var color: Color
    
    init(name: String, color: Color,content: @escaping ()-> ()){
        self.name = name
        self.functionality = content
        self.color = color
    }
    
    var body: some View{
        HStack{
            Button(action: {functionality()}) {
                Text(name)
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(color)
                    .foregroundColor(.white)
                    .padding(10)
                    .border(color, width: 5)
            }
            
            
        }
        
        
    }
}



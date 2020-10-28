//
//  UIInternal.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/18/20.
//
// This file handles the interactions inside of the UI, which don't involve anything from model

import Foundation
import SwiftUI

var currentUI = PomoUI()


enum menu {
    case pomoMenu
    case setting
    case history
}

class PomoUI: ObservableObject {
    
    @Published var chosenMenu = menu.pomoMenu
    
    func switchMenu(to menu: menu) {
        switch menu{
            case .history: chosenMenu = .history
            case .pomoMenu : chosenMenu = .pomoMenu
            case .setting : chosenMenu = .setting
        }
    }
    
}





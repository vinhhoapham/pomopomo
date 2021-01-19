//
//  HistoryMenu.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/26/20.
//

import SwiftUI

struct HistoryMenu: View {
    @State var historyOfPeriods : [PomoPeriod]
    var body: some View {
        List{
            ForEach(historyOfPeriods, id: \.self) {period in
                Text(String(period.originalDuration))
            }
        }
       Text("")
    }
}



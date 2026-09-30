//
//  ListItemView.swift
//  Tickers
//
//  Created by Neftali Samarey on 9/30/26.
//

import SwiftUI

struct ListItemView: View {
    
    private let stockName: String
    private let timerValue: String
    
    init(stockName: String, timerValue: String) {
        self.stockName = stockName
        self.timerValue = timerValue
    }
    
    var body: some View {
        HStack {
            Text(stockName)
                .font(.title3)
            Spacer()
            Text(timerValue)
                .font(.title3)
                .bold()
        }
        .padding()
    }
}

#Preview {
    ListItemView(stockName: "ACME", timerValue: "0.45")
}

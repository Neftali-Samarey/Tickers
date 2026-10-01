//
//  ListItemView.swift
//  Tickers
//
//  Created by Neftali Samarey on 9/30/26.
//

import SwiftUI

struct ListItemView: View {
    
    private let stockName: String
    private let timerValue: TimeInterval
    
    private var isExpired: Bool {
        timerValue <= 0
    }
    
    init(stockName: String, timerValue: TimeInterval) {
        self.stockName = stockName
        self.timerValue = timerValue
    }
    
    var body: some View {
        HStack {
            Text(stockName)
                .font(.title3)
            Spacer()
            Text(format(timerValue))
                .monospacedDigit()
                .font(.title3)
                .bold()
        }
        .opacity(isExpired ? 0.5 : 1)
        .padding()
    }
    
    private func format(_ time: TimeInterval) -> String {
        let totalSeconds = Int(time)
        
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        
        return String(
            format: "%02d:%02d",
            minutes,
            seconds
        )
    }
}

#Preview {
    ListItemView(stockName: "ACME", timerValue: .zero)
}

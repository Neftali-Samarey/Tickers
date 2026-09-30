//
//  TickerItem.swift
//  Tickers
//
//  Created by Neftali Samarey on 9/30/26.
//

import Foundation

struct TickerItem: Identifiable {
    let id = UUID()
    let title: String
    let counter: Double
}

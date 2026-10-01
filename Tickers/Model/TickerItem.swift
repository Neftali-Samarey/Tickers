//
//  TickerItem.swift
//  Tickers
//
//  Created by Neftali Samarey on 9/30/26.
//

import Foundation

///  Paremeters
///  `title` - usage for passing in ticker item title (string)
///  `duration` - a double value that can be passed as part of ticket item
struct TickerItem: Identifiable {
    let id = UUID()
    let title: String
    let duration: TimeInterval
    var endDate: Date
}

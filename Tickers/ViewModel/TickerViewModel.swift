//
//  TickerViewModel.swift
//  Tickers
//
//  Created by Neftali Samarey on 9/30/26.
//

import Foundation
import Combine
import Observation

@MainActor
@Observable
final class TickerViewModel: ObservableObject {
    struct TimerState: Identifiable {
        let id: UUID
        let title: String
        let endDate: Date
        
        var remainingTime: TimeInterval {
            max(0, endDate.timeIntervalSinceNow)
        }
    }
    
    var timers: [TimerState] = []
    private(set) var now = Date()
    private var timerCancellable: AnyCancellable?
    
    init() {
        timers = [
            TimerState(
                id: UUID(),
                title: "TKYO",
                endDate: Date().addingTimeInterval(2 * 60)
            ),
            TimerState(
                id: UUID(),
                title: "NYC",
                endDate: Date().addingTimeInterval(14)
            ),
            TimerState(
                id: UUID(),
                title: "SFO",
                endDate: Date().addingTimeInterval(5)
            ),
            TimerState(
                id: UUID(),
                title: "GNVA",
                endDate: Date().addingTimeInterval(60)
            )
        ]
        
        startClock()
    }
    
    private func startClock() {
        timerCancellable = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] date in
                self?.now = date
            }
    }
    
    func remainingTime(for timer: TimerState) -> TimeInterval {
        max(0, timer.endDate.timeIntervalSince(now))
    }
    
    /// AI Generated sortedTimers computed property
    /// to save time and ensure correctness of sorting animation
    var sortedTimers: [TimerState] {
        timers.sorted { lhs, rhs in
            
            let lhsExpired = lhs.endDate <= now
            let rhsExpired = rhs.endDate <= now
            
            // Active timers always come before expired timers
            if lhsExpired != rhsExpired {
                return !lhsExpired
            }
            
            // Within the same group, sort by expiration
            return lhs.endDate < rhs.endDate
        }
    }
    
    isolated deinit {
        timerCancellable?.cancel()
    }
}

extension TickerViewModel.TimerState {
    func isExpired(at now: Date) -> Bool {
        endDate <= now
    }
}

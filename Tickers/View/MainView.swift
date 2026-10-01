import SwiftUI

struct MainView: View {
    
    // Since this is the root view, implement the router here.
    @State private var router = Router()
    
    // Test view model that contains all elements to display on the view
    @State private var tickerViewModel = TickerViewModel()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            List {
                ForEach(tickerViewModel.sortedTimers) { timer in
                    ListItemView(
                        stockName: timer.title,
                        timerValue: tickerViewModel.remainingTime(for: timer)
                    )
                }
                /*ForEach(tickerViewModel.mocks) { item in
                    ListItemView(stockName: item.title, timerValue: "\(item.duration)")
                }*/
            }
            .navigationTitle("Tickers")
            .animation(
                .easeInOut(duration: 0.5),
                value: tickerViewModel.sortedTimers.map(\.id)
            )
            /*.navigationDestination(for: AppRoute.self) { destination in
                switch destination {
                case .home:
                    Text("Home")
                case .detail:
                    Text("Navigating to details")
                }
            }*/
        }
        .environment(router)
    }
}

#Preview {
    MainView()
}

import SwiftUI

struct MainView: View {
    
    // Since this is the root view, implement the router here.
    @State private var router = Router()
    
    // mock items
    let mocks: [TickerItem] = {
        return [
            TickerItem(title: "TKYO", counter: 4.0),
            TickerItem(title: "NYC", counter: 5.0),
            TickerItem(title: "SFO", counter: 7.0),
            TickerItem(title: "GNVA", counter: 11.0)
        ]
    }()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            List {
                ForEach(mocks) { item in
                    ListItemView(stockName: item.title, timerValue: "\(item.counter)")
                }
            }
            .navigationTitle("Tickers")
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

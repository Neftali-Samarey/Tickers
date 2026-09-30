//
//  Router.swift
//  Tickers
//
//  Created by Neftali Samarey on 9/30/26.
//

import Foundation
import Combine

/// Notes: Usage for this Router manager then requires its usage to configure a Navigation stack
/// for when we implement the main navigational structure

@Observable
class Router {
    // an array for AppRoute paths
    var path = [AppRoute]()
    
    func navigate(to appRoute: AppRoute) {
        path.append(appRoute)
    }
    
    // Pops back to the last destination
    func pop() {
        path.removeLast()
    }
    
    // Used to pop to root of path by removing all paths
    func popToRoot() {
        path.removeAll()
    }
}

//
//  Routing.swift
//  WetonKulo
//
//  Created by edi santoso on 10/06/23.
//

import SwiftUI

class NavigationManager: ObservableObject {
    @Published var currentView: NavigationItem?
    private var previousView: NavigationItem?
    
    func navigateTo(_ item: NavigationItem) {
            previousView = currentView
            currentView = item
            
          
            
        }
    func goBack(_ item: NavigationItem) {
            previousView = currentView
            currentView = item
            
            // Clear previous view controller stack
            DispatchQueue.main.async {
                UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
            }
        }
    
}


enum NavigationItem {
    case compabilityTips
    case card
}

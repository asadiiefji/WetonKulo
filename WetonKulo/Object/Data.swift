//
//  Data.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 09/06/23.
//

import Foundation

struct DatabaseFiveCycle: Hashable, Identifiable {
    // MARK: properties
    let id: UUID = UUID()
    let result: String
    let interpretation: String
    let tips: String
}

struct DatabaseSevenCycle: Hashable, Identifiable {
    // MARK: properties
    let id: UUID = UUID()
    let result: String
    let interpretation: String
    let tips: String
}

struct DatabaseEightCycle: Hashable, Identifiable {
    // MARK: properties
    let id: UUID = UUID()
    let result: String
    let interpretation: String
    let tips: String
}

enum currentView {
    case center
    case top
    case bottom
    
}

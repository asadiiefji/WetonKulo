//
//  Data.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 09/06/23.
//

import Foundation

struct DatabaseGoodDates: Hashable, Identifiable {
    // MARK: properties
    let id: UUID = UUID()
    let result: String
    let interpretation: String
}

struct DatabaseFiveCycle: Hashable, Identifiable {
    // MARK: properties
    let id: UUID = UUID()
    let result: String
    let interpretation: String
    let tips: String
    let image: String
}

struct DatabaseSevenCycle: Hashable, Identifiable {
    // MARK: properties
    let id: UUID = UUID()
    let result: String
    let interpretation: String
    let tips: String
    let image: String
}

struct DatabaseEightCycle: Hashable, Identifiable {
    // MARK: properties
    let id: UUID = UUID()
    let result: String
    let interpretation: String
    let tips: String
    let image: String
}

enum currentView {
    case center
    case top
    case bottom
}

//
//  ModelHasilKecocokan.swift
//  WetonKulo
//
//  Created by edi santoso on 10/06/23.
//

import SwiftUI
 
struct Card : Identifiable {
    @ObservedObject var weton : Weton
    var id : Int
    var title111 : String
    var imageName : String
    var title222 : String
    var title333 : String
}

var weton = Weton()
 
var cards = [
    Card(weton: Weton(), id: 0, title111: "5 Siklus", imageName: "image0", title222: "\(weton.getFiveCycles().result)", title333: "\(weton.getFiveCycles().interpretation)"),
    Card(weton: Weton(), id: 1, title111: "7 Siklus", imageName: "image1", title222: "\(weton.getSevenCycles().result)", title333: "\(weton.getSevenCycles().interpretation)"),
    Card(weton: Weton(), id: 2, title111: "8 Siklus", imageName: "image2", title222: "\(weton.getEightCycles().result)", title333: "\(weton.getEightCycles().interpretation)"),
             ]

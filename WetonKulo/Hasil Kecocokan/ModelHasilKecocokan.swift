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
 


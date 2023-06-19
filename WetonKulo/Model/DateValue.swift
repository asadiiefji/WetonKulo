//
//  DateValue.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 17/06/23.
//

import SwiftUI

struct DateValue: Identifiable, Hashable {
    var id = UUID().uuidString
    var day: Int
//    var month: String
    var date: Date
}


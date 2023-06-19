//
//  ContentView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 07/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentDate = Date()
    var body: some View {
        VStack {
            CalendarGoodDateView(currentDate: $currentDate)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

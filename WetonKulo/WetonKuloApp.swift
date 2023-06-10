//
//  WetonKuloApp.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 07/06/23.
//

import SwiftUI

@main
struct WetonKuloApp: App {
    var body: some Scene {
        WindowGroup {
            let weton = Weton()
            TipsView(weton: weton)
        }
    }
}

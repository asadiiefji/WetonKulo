//
//  MarriageDateView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 17/06/23.
//

import SwiftUI

struct MarriageDateView: View {
    
    @State var currentDate = Date()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                CalendarGoodDateView(currentDate: $currentDate)
            }
        }
    }
}

struct MarriageDateView_Previews: PreviewProvider {
    static var previews: some View {
        MarriageDateView()
    }
}

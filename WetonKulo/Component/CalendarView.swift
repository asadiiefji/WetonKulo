//
//  CalendarView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 07/06/23.
//

import SwiftUI

struct CalendarView: View {
    @ObservedObject var weton: Weton
    var profileType: ProfileType
    
    var body: some View {
        return VStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 120, height: 4)
                .padding(8)
            
            Text("Select a date for \(profileType.text)")
            DatePicker("Select a date", selection: profileType.isMan ? $weton.dateMan : $weton.dateWoman, in: dateRange, displayedComponents: .date)
                .onChange(of: profileType) { _ in
                    if profileType.isMan {
                        weton.fullDateMan = weton.dateMan
                        weton.dayMan = weton.dateMan
                    } else {
                        weton.fullDateWoman = weton.dateWoman
                        weton.dayWoman = weton.dateWoman
                    }
                }
                .datePickerStyle(GraphicalDatePickerStyle())
                .accentColor(Color("tertiary"))
                .padding(20)
            
            Text("weton pria: \(weton.getWetonMan())")
            Text("weton wanita: \(weton.getWetonWoman())")
            
        }
        .frame(width: screenWidth, height: screenHeight * 0.6)
        .background(Color("secondary"))
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        let weton = Weton()
        let profileType = ProfileType.man
        CalendarView(weton: weton, profileType: profileType)
    }
}

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
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        return ZStack {
            
            Button {
                withAnimation {
                    dismiss()
                }
            } label: {
                Image(systemName: "x.circle")
                    .font(.system(size: 36, weight: .regular))
                    .foregroundColor(Color("tertiary"))
            }
            .position(x: 40, y: 60)
            .zIndex(2)
            
            
            VStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 120, height: 4)
                    .padding(8)
                
                Text("Tanggal Lahir \(profileType.text)")
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
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .accentColor(Color("tertiary"))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
//                    .onAppear {
//                            let dateFormatter = DateFormatter()
//                            dateFormatter.dateFormat = "yyyy MM dd"
//                            weton.dateMan = dateFormatter.string(from: weton.dateMan)
//                            weton.dateWoman = dateFormatter.string(from: weton.dateWoman)
//                        }
                
                //            Text("weton pria: \(weton.getWetonMan())")
                //            Text("weton wanita: \(weton.getWetonWoman())")
            }
            .frame(width: screenWidth, height: screenHeight * 0.4)
            .background(Color("secondary"))
        }
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        let weton = Weton()
        let profileType = ProfileType.man
        CalendarView(weton: weton, profileType: profileType)
    }
}

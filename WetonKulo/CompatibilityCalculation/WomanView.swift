//
//  WomanView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 09/06/23.
//

import SwiftUI

struct WomanView: View {
    @State var activeView: currentView
    
    @ObservedObject var weton : Weton
    @State var isModal = false
    
    let profileType: ProfileType
    
    var body: some View {
        
        VStack {
            Text("Pick a date of birth")
            Text("tanggal: \((profileType == .man ) ? weton.dateMan : weton.dateWoman, formatter: dateFormatter)")
                .padding(20)
            
            Image(profileType.image)
                .resizable()
                .frame(width: screenWidth * 0.7, height: screenHeight * 0.4)
                .padding()
            
            Toggle(isOn: $weton.isMaghribWoman ) {
                Text("Lahir setelah maghrib?")
            }
            .onChange(of: weton.isMaghribWoman ) { newValue in
                if newValue {
                    if let updatedDate = Calendar.current.date(byAdding: .day, value: 1, to: weton.dateWoman) {
                        weton.dateWoman = updatedDate
                        print("dateMan: \(weton.dateWoman)")
                    }
                }
                else {
                    if let updatedDate = Calendar.current.date(byAdding: .day, value: -1, to: weton.dateWoman) {
                        weton.dateWoman = updatedDate
                        print("dateMan: \(weton.dateWoman)")
                    }
                }
            }
            .padding(20)
            
            Button {
                isModal = true
                print("isMaghribMan: \(weton.isMaghribMan)")
                print("isMaghribWoman: \(weton.isMaghribWoman)")
                
            } label: {
                Text("Pick a date for \(profileType.text)")
                    .padding(12)
                    .frame(width: screenWidth * 0.8)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .foregroundColor(.white)
            }
        }
        .sheet(isPresented: $isModal) {
            CalendarView(weton: weton, profileType: profileType)
                .presentationDetents([.fraction(0.6)])
                .transition(.move(edge: .bottom))
                .animation(.easeInOut, value: 10)
                .presentationCornerRadius(40)
                .zIndex(2)
        }
        .animation(.spring(), value: 0)
        .frame(width: screenWidth, height: screenHeight)
        .background(Color("primary"))
    }
}

struct WomanView_Previews: PreviewProvider {
    static var previews: some View {
        let weton = Weton()
        WomanView(activeView: .bottom, weton: weton, profileType: .woman)
    }
}

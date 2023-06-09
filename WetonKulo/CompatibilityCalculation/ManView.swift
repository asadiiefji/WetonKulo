//
//  ManView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 09/06/23.
//

import SwiftUI

struct ManView: View {
    
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
            
            Toggle(isOn: $weton.isMaghribMan ) {
                Text("Lahir setelah maghrib?")
            }
            .onChange(of: weton.isMaghribMan ) { newValue in
                if newValue {
                    if let updatedDate = Calendar.current.date(byAdding: .day, value: 1, to: weton.dateMan) {
                        weton.dateMan = updatedDate
                        print("dateMan: \(weton.dateMan)")
                    }
                }
                else {
                    if let updatedDate = Calendar.current.date(byAdding: .day, value: -1, to: weton.dateMan) {
                        weton.dateMan = updatedDate
                        print("dateMan: \(weton.dateMan)")
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
        .background(Color("quaternary"))
        
        
    }
    
}

struct ManView_Previews: PreviewProvider {
    static var previews: some View {
        let weton = Weton()
        ManView(activeView: .top, weton: weton, profileType: .man)
    }
}

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
    @State var isAlert = false
    
    let profileType: ProfileType
    
    var body: some View {
        
        VStack {
            
            Toggle(isOn: $weton.isMaghribMan ) {
                Text("Lahir setelah maghrib?")
            }
            .onChange(of: weton.isMaghribMan ) { newValue in
                if newValue {
                    isAlert = true
                    if let updatedDate = Calendar.current.date(byAdding: .day, value: 1, to: weton.dateMan) {
                        weton.dateMan = updatedDate
                        weton.currentDateMan = Calendar.current.date(byAdding: .day, value: 1, to: weton.currentDateMan)!
                    }
                }
                else {
                    isAlert = false
                    if let updatedDate = Calendar.current.date(byAdding: .day, value: -1, to: weton.dateMan) {
                        weton.dateMan = updatedDate
                        weton.currentDateMan = Calendar.current.date(byAdding: .day, value: -1, to: weton.currentDateMan)!
                    }
                }
            }
            .padding(20)
            
            .alert(isPresented: $isAlert) {
                Alert(
                    title: Text("Informasi"),
                    message: Text("Pergantian hari kalendar Jawa terjadi setelah maghrib, sehingga weton dihitung ke hari berikutnya.")
                )
            }
            
            Button {
                isModal = true
                print(weton.dateMan)
                print(type(of: Date()))
                print(Date())
            } label: {
                Text( (weton.dateMan.description.components(separatedBy: " ")[0] != weton.currentDateMan.description.components(separatedBy: " ")[0]) ? "\(weton.dateMan, formatter: dateFormatter)" : "Tanggal Lahir \(profileType.text)")
                    .font(.system(size: 18, weight: .semibold))
                    .padding(15)
                    .frame(width: screenWidth * 0.8)
                    .background(Color("primary").opacity(0.4))
                    .cornerRadius(30, corners: .allCorners)
                    .foregroundColor(Color("tertiary"))
            }
            
            Image(systemName: "chevron.up")
                .font(.system(size: 20, weight: .semibold))
                .padding(.top, 10)
                .foregroundColor((weton.isMaghribMan == true) ? Color("tertiary") : Color("secondary"))
            Image(systemName: "chevron.up")
                .font(.system(size: 20, weight: .semibold))
                .padding(.top, 5)
                .foregroundColor((weton.isMaghribMan == true) ? Color("secondary") : Color("tertiary"))
            Text("Kembali")
                .padding(.top, 5)
                .font(.system(size: 16, weight: .semibold))
                .padding(.bottom, 30)
                .foregroundColor((weton.isMaghribMan == true) ? Color("secondary") : Color("tertiary"))
            
        }
        .foregroundColor(Color("textColor"))
        .sheet(isPresented: $isModal) {
            CalendarView(weton: weton, profileType: profileType)
                .presentationDetents([.fraction(0.6)])
                .transition(.move(edge: .bottom))
                .animation(.easeInOut, value: 10)
                .presentationCornerRadius(40)
                .zIndex(2)
                .background(Color("secondary"))
        }
        .animation(.spring(), value: 0)
        .frame(width: screenWidth, height: screenHeight, alignment: .bottom)
        .background(
            (weton.isMaghribMan == true) ?
            Image("NightAtas").resizable() :
                Image("DayAtas").resizable()
        ).ignoresSafeArea()
    }
    
}

struct ManView_Previews: PreviewProvider {
    static var previews: some View {
        let weton = Weton()
        ManView(activeView: .top, weton: weton, profileType: .man)
    }
}

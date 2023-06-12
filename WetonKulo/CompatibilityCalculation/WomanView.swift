//
//  WomanView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 09/06/23.
//

import SwiftUI

struct WomanView: View {
    
    @State var activeView: currentView
    //    @State var currentDate: Date = Date()
    
    @ObservedObject var weton : Weton
    @State var isModal = false
    @State var isAlert = false
    
    let profileType: ProfileType
    
    var body: some View {
        
        VStack {
            
            Group {
                Text("Informasi Weton")
                    .padding(.top, 50)
                    .font(.system(size: 16, weight: .semibold))
                Image(systemName: "chevron.down")
                    .font(.system(size: 20, weight: .semibold))
                Image(systemName: "chevron.down")
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.top, 5)
                    .foregroundColor(Color("secondary"))
            }
            .foregroundColor(Color("tertiary"))
            Spacer()
            
            Toggle(isOn: $weton.isMaghribWoman ) {
                Text("Lahir setelah maghrib?")
            }
            .onChange(of: weton.isMaghribWoman ) { newValue in
                
                if newValue {
                    isAlert = true
                    if let updatedDate = Calendar.current.date(byAdding: .day, value: 1, to: weton.dateWoman) {
                        weton.dateWoman = updatedDate
                        weton.currentDateWoman = Calendar.current.date(byAdding: .day, value: 1, to: weton.currentDateWoman)!
                    }
                }
                else {
                    isAlert = false
                    if let updatedDate = Calendar.current.date(byAdding: .day, value: -1, to: weton.dateWoman) {
                        weton.dateWoman = updatedDate
                        weton.currentDateWoman = Calendar.current.date(byAdding: .day, value: -1, to: weton.currentDateWoman)!
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
            } label: {
                Text( (weton.dateWoman.description.components(separatedBy: " ")[0] != weton.currentDateWoman.description.components(separatedBy: " ")[0]) ? "\(weton.dateWoman, formatter: dateFormatter)" : "Tanggal Lahir \(profileType.text)")
                    .font(.system(size: 18, weight: .semibold))
                    .padding(15)
                    .frame(width: screenWidth * 0.8)
                    .background(Color("primary").opacity(0.4))
                    .cornerRadius(30, corners: .allCorners)
                    .foregroundColor(Color("tertiary"))
            }
            .padding(.bottom, 105)
            
//            Image(systemName: "chevron.up")
//                .font(.system(size: 20, weight: .semibold))
//                .padding(.top, 10)
//                .foregroundColor((weton.isMaghribWoman == true) ? Color("tertiary") : Color("secondary"))
//            Image(systemName: "chevron.up")
//                .font(.system(size: 20, weight: .semibold))
//                .padding(.top, 5)
//                .foregroundColor((weton.isMaghribWoman == true) ? Color("secondary") : Color("tertiary"))
//            Text("Kembali")
//                .padding(.top, 5)
//                .font(.system(size: 20, weight: .semibold))
//                .padding(.bottom, 30)
//                .foregroundColor((weton.isMaghribWoman == true) ? Color("secondary").opacity(0.8) : Color("secondary"))
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
            (weton.isMaghribWoman == true) ?
            Image("NightBawah").resizable() :
                Image("DayBawah").resizable()
        ).ignoresSafeArea()
    }
}

struct WomanView_Previews: PreviewProvider {
    static var previews: some View {
        let weton = Weton()
        WomanView(activeView: .bottom, weton: weton, profileType: .woman)
    }
}

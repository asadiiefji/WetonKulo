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
            
            
            
            ZStack {
                
                VStack {
                    Group {
                        Text("Kembali")
                            
                            .font(.system(size: 16, weight: .semibold))
                        Image(systemName: "chevron.down")
                            .font(.system(size: 20, weight: .semibold))
                        Image(systemName: "chevron.down")
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.top, 5)
                            .foregroundColor(Color("secondary"))
                    }
                    .foregroundColor(Color("tertiary"))
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button {
                        isAlert = true
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(Color("tertiary"))
                    }
                
                }
                .padding(.trailing, 40)
                
            }.padding(.top, 50)
            
            Spacer()
//            Text("total weton: \( weton.getWetonWoman())")
//                .foregroundColor(Color.white)
            
            Button {
                isModal = true
            } label: {
                Text( (weton.dateWoman.description.components(separatedBy: " ")[0] != weton.currentDateWoman.description.components(separatedBy: " ")[0]) ? "\(weton.dateWoman, formatter: dateFormatter)" : "Tanggal Lahir \(profileType.text)")
                    .font(.system(size: 18, weight: .semibold))
                    .padding(15)
                    .frame(width: screenWidth * 0.8)
                    .background(Color("primary").opacity(0.6))
                    .cornerRadius(30, corners: .allCorners)
                    .foregroundColor(Color("tertiary"))
            }
            
            Toggle(isOn: $weton.isMaghribWoman ) {
                Text("Lahir setelah maghrib?")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color("tertiary"))
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .frame(width: screenWidth * 0.8)
            .background(Color("primary").opacity(0.6))
            .cornerRadius(30, corners: .allCorners)
            .onChange(of: weton.isMaghribWoman ) { newValue in
                
                if newValue {
//                    isAlert = true
                    if let updatedDate = Calendar.current.date(byAdding: .day, value: 1, to: weton.dateWoman) {
                        weton.dateWoman = updatedDate
                        weton.currentDateWoman = Calendar.current.date(byAdding: .day, value: 1, to: weton.currentDateWoman)!
                    }
                }
                else {
//                    isAlert = false
                    if let updatedDate = Calendar.current.date(byAdding: .day, value: -1, to: weton.dateWoman) {
                        weton.dateWoman = updatedDate
                        weton.currentDateWoman = Calendar.current.date(byAdding: .day, value: -1, to: weton.currentDateWoman)!
                    }
                }
            }
            .padding(20)
            .padding(.bottom, 35)
            .alert(isPresented: $isAlert) {
                Alert(
                    title: Text("Informasi"),
                    message: Text("Pergantian hari kalendar Jawa terjadi setelah maghrib, sehingga weton dihitung ke hari berikutnya.")
                )
            }
            
            
            
            
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

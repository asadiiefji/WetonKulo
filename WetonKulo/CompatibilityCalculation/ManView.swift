//
//  ManView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 09/06/23.
//

import SwiftUI

struct ManView: View {
    @State var activeView: currentView
    @ObservedObject var weton: Weton
    @State var isModal = false
    @State var clockValue: CGFloat = 0.0
    @State var circleColor: Color = .orange
    
    let profileType: ProfileType
    
    var body: some View {
        VStack {
            Text("Pilih Waktu Lahir")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color("textColor"))
                .padding(.bottom, 80)
            
//            Text("Pick a date of birth")
            var beforeMaghribDate: Date = (profileType == .man) ? weton.dateMan : weton.dateWoman
            // convert to after maghrib
            let calendar = Calendar.current
            let afterMaghribDate = calendar.date(byAdding: .day, value: 1, to: beforeMaghribDate)!
            
            Text("tanggal: \(circleColor == .blue ? afterMaghribDate : beforeMaghribDate, formatter: dateFormatter)")
            
            Image(profileType.image)
                .resizable()
                .frame(width: screenWidth * 0.7, height: screenHeight * 0.4)
                .padding(.bottom, 80)
            
//            Toggle(isOn: $weton.isMaghribMan) {
//                Text("Lahir setelah maghrib?")
//            }
//            .onChange(of: weton.isMaghribMan) { newValue in
//                if newValue {
//                    if let updatedDate = Calendar.current.date(byAdding: .day, value: 1, to: weton.dateMan) {
//                        weton.dateMan = updatedDate
//                    }
//                } else {
//                    if let updatedDate = Calendar.current.date(byAdding: .day, value: -1, to: weton.dateMan) {
//                        weton.dateMan = updatedDate
//                    }
//                }
//            }
//            .padding(20)
            
            ZStack {
                //                circleColor
                //                    .ignoresSafeArea(.all)
                VStack {
                    //                    Text("Pilih Waktu Lahir")
                    //                        .font(.largeTitle)
                    //                        .bold()
                    //                        .foregroundColor(ColorConstant.textColorPrimary)
                    
                    ClockControlView(clockValue: $clockValue, circleColor: $circleColor) { newColor in
                        circleColor = newColor
                    }
                    .padding(.top, 0)
                    
                    HStack(alignment: .firstTextBaseline, spacing: 2) {
                        Text(circleColor == .blue ? "After Maghrib" : "Before Maghrib")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(ColorConstant.textColorPrimary)
                    }
                    .padding(.top, -100)
                }
            }
            
            //            Spacer()
            
            Button {
                isModal = true
            } label: {
                Text("Pilih Tanggal Lahir")
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(12)
                    .frame(width: 220)
                    .background(Color("secondary"))
                    .cornerRadius(10)
                    .foregroundColor(Color("textColor"))
            }
            .padding(.top, -80)
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
        .frame(width: screenWidth, height: screenHeight)
        .background(Color("quaternary"))
    }
    
    struct ColorConstant {
        static let greenCircle = Color(red: 168/255, green: 226/255, blue: 93/255)
        static let grayCircle = Color(red: 239/255, green: 241/255, blue: 245/255)
        static let knobBackground = Color(red: 246/255, green: 247/255, blue: 249/255)
        static let tempBackground = Color(red: 62/255, green: 187/255, blue: 0/255)
        static let textColorPrimary = Color(red: 69/255, green: 74/255, blue: 86/255)
        static let textColorSecondary = Color(red: 180/255, green: 183/255, blue: 189/255)
    }
}

struct ManView_Previews: PreviewProvider {
    static var previews: some View {
        let weton = Weton()
        ManView(activeView: .top, weton: weton, profileType: .man)
    }
}

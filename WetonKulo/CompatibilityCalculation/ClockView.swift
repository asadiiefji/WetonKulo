//
//  ClockView.swift
//  ClockCircularSlider
//
//  Created by edi santoso on 04/06/23.
//

import SwiftUI

struct ClockView: View {
    @State var clockValue: CGFloat  = 0.0
    @State var circleColor: Color = .orange
    var body: some View{
        ZStack { // Menggunakan ZStack sebagai wadah utama
            circleColor // Menggunakan warna latar belakang sebagai layer terdepan
                .ignoresSafeArea(.all)
            VStack {
                Text("Waktu Kelahiran")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(ColorConstant.textColorPrimary)
                Text("Sebelum Maghrib atau Setelah Maghrib")
                    .font(.body)
                    .foregroundColor(ColorConstant.textColorSecondary)
                
                ClockControlView(clockValue: $clockValue, circleColor: $circleColor) { newColor in
                    circleColor = newColor}
                .padding(.top, 500)
                
                HStack(alignment: .firstTextBaseline, spacing: 2){
                    Text(circleColor == .blue ? "After Maghrib" : "Before Maghrib")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(ColorConstant.textColorPrimary)
                }
                Spacer()
            }
        }
    }
}

struct ColorConstant {
    static let greenCirle           = Color(red: 168/255, green: 226/255, blue: 93/255)
    static let grayCircle           = Color(red: 239/255, green: 241/255, blue: 245/255)
    static let knobBackground       = Color(red: 246/255, green: 247/255, blue: 249/255)
    static let tempBackground       = Color(red: 62/255, green: 187/255, blue: 0/255)
    
    static let textColorPrimary     = Color(red: 69/255, green: 74/255, blue: 86/255)
    static let textColorSecondary   = Color(red: 180/255, green: 183/255, blue: 189/255)
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}

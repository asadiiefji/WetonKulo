//
//  GoodDateView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 12/06/23.
//

import SwiftUI

struct GoodDateView: View {
    @ObservedObject var weton: Weton
    var profileType: ProfileType
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedMonth: Date
    @State private var isAlert = false
    
    init(weton: Weton, profileType: ProfileType) {
        self.weton = weton
        self.profileType = profileType
        
        _selectedMonth = State(initialValue: Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Date()))!)
        
    }
    @Environment(\.calendar) var calendar
    @Environment(\.timeZone) var timeZone
    var body: some View {
//        ZStack {
            
            VStack(spacing: 0){
    //            ZStack {
                ZStack {
                    
                    Text("Hasil Perhitungan Tanggal Baik")
                            .font(.system(size: 26, weight: .bold))
                            .padding(.horizontal, 40)
                            .multilineTextAlignment(.center)
                        
        //            }
                    .padding(EdgeInsets(top: 60, leading: 0, bottom: 30, trailing: 0))
                .foregroundColor(Color("textColor"))
                    HStack {
                        Button {
                            dismiss()
                        } label: {
    //                        HStack(spacing: 0){
                                Image(systemName: "chevron.backward.circle")
                                    .font(.system(size: 30, weight: .regular))
    //                            Text("Back")
    //                        }
                            .foregroundColor(Color("tertiary"))
                            
                        }
                        
                        
                        Spacer()
                        Button {
                            isAlert = true
                        } label: {
                            Image(systemName: "info.bubble.fill")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(containsTuesdayKliwon ? "secondary" : "merah"))
                    }
                        .padding(.trailing, 25)
                    }
                    .padding(.horizontal, 20)
                }.frame(alignment: .top)
//                    .background(Color.red)
                    
                
                let dates = datesInSelectedMonth()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: screenWidth * 0.1) {
                        
                        VStack(spacing: 10){
                            Text("Sandang")
                                .font(.system(size: 22, weight: .medium))
                                .padding(.top, 20)
                                .padding(.horizontal, 10)
                                .multilineTextAlignment(.center)
                            
                            Image("sandang")
                                .resizable()
                                .frame(width: screenWidth * 0.5, height: screenWidth * 0.55)
                            
                            Text("‘Sandang’ atau pakaian yang memiliki arti ‘Bagus’. Jika menikah pada tanggal ini, Kamu dan pasanganmu akan dilimpahkan rejeki dan kebahagiaan.")
                                .padding(.horizontal, 20)
                                .font(.system(size: 16, weight: .regular))
                                .multilineTextAlignment(.center)
                            
                            List {
                                let filteredDates = dates.filter { date in
                                    let dayValue = weton.getDayValue(for: date)
                                    let javaDay = weton.getJavaDay(for: date)
                                    let javaDayValue = weton.getJavaDayValue(for: javaDay)
                                    let totalWeton = dayValue + javaDayValue + weton.getTotalWeton()
                                    
                                    return (totalWeton % 5 == 1)
                                }
                                
                                if !filteredDates.isEmpty {
                                    Section(header:
                                                Text("Pilihan Tanggal")
                                        .foregroundColor(Color("textColor"))
                                            
                                    ) {
                                        ForEach(filteredDates, id: \.self) { date in
                                            Text("\(date, formatter: dateFormatter)")
                                                .foregroundColor(Color("textColor"))
                                            
                                            
                                        }
                                    }
                                    .multilineTextAlignment(.center)
                                    .frame(width: screenWidth * 0.75)
                                }
                            }
                            .listStyle(.inset)
                            
                            .frame(width: screenWidth * 0.6, height: screenHeight * 0.15, alignment: .center)
                            
                            .cornerRadius(20, corners: .allCorners)
                        }
                        .frame(width: screenWidth * 0.75, height: screenHeight * 0.65, alignment: .top)
                        .background(Color.white)
                        .cornerRadius(80, corners: .bottomLeft)
                        .cornerRadius(80, corners: .topRight)
                        .padding(.bottom, 30)
                        .padding(.leading, 10)
                        
                        VStack(spacing: 10){
                            Text("Pangan")
                                .font(.system(size: 22, weight: .medium))
                                .padding(.top, 20)
                                .padding(.horizontal, 10)
                                .multilineTextAlignment(.center)
                            
                            Image("pangan")
                                .resizable()
                                .frame(width: screenWidth * 0.6, height: screenWidth * 0.56)
                            
                            Text("‘Pangan’ atau makanan memiliki arti ‘Bagus’. Jika menikah pada daftar tanggal ini akan diberi kemudahan dalam memperoleh rezeki, dan ketika terjadi pertengkaran di dalam rumah tangga tidak akan bercerai.")
                                .padding(.horizontal, 10)
                                .font(.system(size: 16, weight: .regular))
                                .multilineTextAlignment(.center)
                            
                            List {
                                let filteredDates = dates.filter { date in
                                    let dayValue = weton.getDayValue(for: date)
                                    let javaDay = weton.getJavaDay(for: date)
                                    let javaDayValue = weton.getJavaDayValue(for: javaDay)
                                    let totalWeton = dayValue + javaDayValue + weton.getTotalWeton()
                                    
                                    return (totalWeton % 5 == 2)
                                }
                                
                                if !filteredDates.isEmpty {
                                    Section(header:
                                                Text("Pilihan Tanggal")
                                        .foregroundColor(Color("textColor"))
                                            
                                    ) {
                                        ForEach(filteredDates, id: \.self) { date in
                                            Text("\(date, formatter: dateFormatter)")
                                                .foregroundColor(Color("textColor"))
                                            
                                        }
                                    }
                                    .multilineTextAlignment(.center)
                                    .frame(width: screenWidth * 0.75)
                                }
                            }
                            .listStyle(.inset)
                            .frame(width: screenWidth * 0.6, height: screenHeight * 0.15, alignment: .center)
                            .cornerRadius(20, corners: .allCorners)
                        }
                        .frame(width: screenWidth * 0.75, height: screenHeight * 0.65, alignment: .top)
                        .background(Color.white)
                        .cornerRadius(80, corners: .bottomLeft)
                        .cornerRadius(80, corners: .topRight)
                        .padding(.bottom, 30)

                        
                        VStack(spacing: 10){
                            Text("Papan")
                                .font(.system(size: 22, weight: .medium))
                                .padding(.top, 20)
                                .padding(.horizontal, 10)
                                .multilineTextAlignment(.center)
                            
                            Image("papan")
                                .resizable()
                                .frame(width: screenWidth * 0.6, height: screenWidth * 0.55)
                            
                            Text("‘Papan’ atau rumah yang memiliki arti ‘Bagus dan sangat dianjurkan’. Jika menikah pada tanggal ini, Kamu dan pasanganmu akan selalu memperoleh rejeki berlimpah di dalam rumah yang kalian tempati.")
                                .padding(.horizontal, 15)
                                .font(.system(size: 16, weight: .regular))
                                .multilineTextAlignment(.center)
                            
                            List {
                                let filteredDates = dates.filter { date in
                                    let dayValue = weton.getDayValue(for: date)
                                    let javaDay = weton.getJavaDay(for: date)
                                    let javaDayValue = weton.getJavaDayValue(for: javaDay)
                                    let totalWeton = dayValue + javaDayValue + weton.getTotalWeton()
                                    
                                    return (totalWeton % 5 == 3)
                                }
                                
                                if !filteredDates.isEmpty {
                                    Section(header:
                                                Text("Pilihan Tanggal")
                                        .foregroundColor(Color("textColor"))
                                            
                                    ) {
                                        ForEach(filteredDates, id: \.self) { date in
                                            Text("\(date, formatter: dateFormatter)")
                                                .foregroundColor(Color("textColor"))
                                            
                                        }
                                    }
                                    .multilineTextAlignment(.center)
                                    .frame(width: screenWidth * 0.75)
                                }
                            }
                            .listStyle(.inset)
                            .frame(width: screenWidth * 0.6, height: screenHeight * 0.15, alignment: .center)
                            .cornerRadius(20, corners: .allCorners)
                        }
                        .frame(width: screenWidth * 0.75, height: screenHeight * 0.65, alignment: .top)
//                        .background(Color("kuning"))
                        .background(Color.white)
                        .cornerRadius(80, corners: .bottomLeft)
                        .cornerRadius(80, corners: .topRight)
                        .padding(.bottom, 30)

                        
                        VStack(spacing: 10){
                            Text("Lara")
                                .font(.system(size: 22, weight: .medium))
                                .padding(.top, 20)
                                .padding(.horizontal, 10)
                                .multilineTextAlignment(.center)
                            
                            Image("loro")
                                .resizable()
                                .frame(width: screenWidth * 0.6, height: screenWidth * 0.6)
                            
                            Text("‘Lara’ memiliki arti ‘Sakit / Musibah’. Resiko jika menikah pada tanggal ini, Kamu dan pasanganmu akan mengalami musibah yang berpotensi hingga perceraian.")
                                .padding(.horizontal, 15)
                                .font(.system(size: 16, weight: .regular))
                                .multilineTextAlignment(.center)
                            
                            List {
                                let filteredDates = dates.filter { date in
                                    let dayValue = weton.getDayValue(for: date)
                                    let javaDay = weton.getJavaDay(for: date)
                                    let javaDayValue = weton.getJavaDayValue(for: javaDay)
                                    let totalWeton = dayValue + javaDayValue + weton.getTotalWeton()
                                    
                                    return (totalWeton % 5 == 4)
                                }
                                
                                if !filteredDates.isEmpty {
                                    Section(header:
                                                Text("Pilihan Tanggal")
                                        .foregroundColor(Color("textColor"))
                                            
                                    ) {
                                        ForEach(filteredDates, id: \.self) { date in
                                            Text("\(date, formatter: dateFormatter)")
                                                .foregroundColor(Color("textColor"))
                                            
                                        }
                                    }
                                    .multilineTextAlignment(.center)
                                    .frame(width: screenWidth * 0.75)
                                }
                            }
                            .listStyle(.inset)
                            .frame(width: screenWidth * 0.6, height: screenHeight * 0.15, alignment: .center)
                            .cornerRadius(20, corners: .allCorners)
                        }
                        .frame(width: screenWidth * 0.75, height: screenHeight * 0.65, alignment: .top)
                        .background(Color.white)
                        .cornerRadius(80, corners: .bottomLeft)
                        .cornerRadius(80, corners: .topRight)
                        .padding(.bottom, 30)

                        
                        VStack(spacing: 10){
                            Text("Pati")
                                .font(.system(size: 22, weight: .medium))
                                .padding(.top, 20)
                                .padding(.horizontal, 10)
                                .multilineTextAlignment(.center)
                            
                            Image("pati")
                                .resizable()
                                .frame(width: screenWidth * 0.6, height: screenWidth * 0.5)
                            
                            Text("‘Pati’ memiliki arti ‘Mati’. Jika menikah pada tanggal ini, Kamu dan pasanganmu akan mengalami musibah kematian baik salah satu diantara kedua pasangan dan/atau terjadi pada keluarganya.")
                                .padding(.horizontal, 15)
                                .font(.system(size: 16, weight: .regular))
                                .multilineTextAlignment(.center)
                            
                            List {
                                let filteredDates = dates.filter { date in
                                    let dayValue = weton.getDayValue(for: date)
                                    let javaDay = weton.getJavaDay(for: date)
                                    let javaDayValue = weton.getJavaDayValue(for: javaDay)
                                    let totalWeton = dayValue + javaDayValue + weton.getTotalWeton()
                                    
                                    return (totalWeton % 5 == 0)
                                }
                                
                                if !filteredDates.isEmpty {
                                    Section(header:
                                                Text("Pilihan Tanggal")
                                        .foregroundColor(Color("textColor"))
                                            
                                    ) {
                                        ForEach(filteredDates, id: \.self) { date in
                                            Text("\(date, formatter: dateFormatter)")
                                                .foregroundColor(Color("textColor"))
                                            
                                        }
                                    }
                                    .multilineTextAlignment(.center)
                                    .frame(width: screenWidth * 0.75)
                                }
                            }
                            .listStyle(.inset)
                            .frame(width: screenWidth * 0.6, height: screenHeight * 0.15, alignment: .center)
                            .cornerRadius(20, corners: .allCorners)
                        }
                        .frame(width: screenWidth * 0.75, height: screenHeight * 0.65, alignment: .top)
                        .background(Color.white)
                        .cornerRadius(80, corners: .bottomLeft)
                        .cornerRadius(80, corners: .topRight)
                        .padding(.bottom, 30)
                        .padding(.trailing, 40)

                                            }
                    
                }
                .padding(.leading, screenWidth * 0.06)
                .frame(width: screenWidth)
                
                DatePicker("Select a month", selection: $selectedMonth, displayedComponents: .date)
                    .accentColor(Color("tertiary"))
                    .labelsHidden()
                    .padding(.bottom, 10)
                
                Text("Pilih bulan dengan memilih tanggal")
                    .foregroundColor(Color("textColor"))
                Spacer()
                
            }
    //        .frame(width: screenWidth, height: screenHeight, alignment: .top)
            
//        }
            .navigationBarBackButtonHidden(true)
        .frame(width: screenWidth, height: screenHeight)
        .background(Color("primary"))
        .foregroundColor(Color("textColor"))
    .ignoresSafeArea()
    .alert(isPresented: $isAlert) {
        Alert(
            title:
                Text("\(containsTuesdayKliwon ? "Informasi" : "Petunjuk")"),
            message: Text("\(containsTuesdayKliwon ? "Anda dapat memilih  daftar tanggal bulan ini karena memenuhi syarat terdapat hari Selasa Kliwon." : "Anda disarankan memilih bulan lain karena tidak memenuhi syarat terdapat hari Selasa Kliwon")")
        )
    }
        
    }
    
    // Helper method to generate an array of all dates in the selected month
    func datesInSelectedMonth() -> [Date] {
        let calendar = Calendar.current
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedMonth))!
        let range = calendar.range(of: .day, in: .month, for: startOfMonth)!
        
        return range.compactMap {
            calendar.date(byAdding: .day, value: $0 - 1, to: startOfMonth)
        }
    }
    
    // Function to determine if the selected month contains Tuesday Kliwon
    func calculateContainsTuesdayKliwon() -> Bool {
        let dates = datesInSelectedMonth()
        
        for date in dates {
            let weekday = Calendar.current.component(.weekday, from: date)
            let weekdaySymbol = Calendar.current.weekdaySymbols[weekday - 1]
            let javaDay = weton.getJavaDay(for: date)
            if weekdaySymbol == "Tuesday" && javaDay == "Kliwon" {
                return true
            }
            
        }
        
        return false
    }
    
    var containsTuesdayKliwon: Bool {
        calculateContainsTuesdayKliwon()
    }
}


struct GoodDateView_Previews: PreviewProvider {
    static var previews: some View {
        let weton = Weton()
        GoodDateView(weton: weton, profileType: .man)
    }
}

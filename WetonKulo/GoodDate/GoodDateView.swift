//
//  GoodDateView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 11/06/23.
//

import SwiftUI

struct GoodDateView: View {
    @ObservedObject var weton: Weton
    var profileType: ProfileType
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedMonth: Date
    
    init(weton: Weton, profileType: ProfileType) {
        self.weton = weton
        self.profileType = profileType
        
        _selectedMonth = State(initialValue: Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Date()))!)
        
    }
    
    @Environment(\.calendar) var calendar
    @Environment(\.timeZone) var timeZone
    
    @State private var SandangDates: Set<DateComponents> = []
    @State private var PanganDates: Set<DateComponents> = []
    @State private var PapanDates: Set<DateComponents> = []
    
    @State private var TanggalBaik: Set<DateComponents> = []
    
    
    @State private var dates: Set<DateComponents> = []
    
    
    var body: some View {
        //        return VStack {
        // ... rest of your code
        
        VStack {
            
            //                let goodDates = calculateGoodDates()
            
            let totalWeton = weton.getTotalWeton()
            Text("Contains Tuesday Kliwon: \(containsTuesdayKliwon ? "Yes" : "No")")
            
            Text("Total Weton: \(totalWeton)")
            
            DatePicker("Select a month", selection: $selectedMonth, displayedComponents: .date)
            
                .accentColor(Color("tertiary"))
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
            
            
            
            let dates = datesInSelectedMonth()
            
            
            VStack {
                List {
                    ForEach(0..<5, id: \.self) { index in
//                        let goodDates = dates.filter { (weton.getDayValue(for: $0) + weton.getJavaDayValue(for: weton.getJavaDay(for: $0)) + totalWeton) % 5 == index }
                        
                        
                        
                        let filteredDates = dates.filter { date in
                            let dayValue = weton.getDayValue(for: date)
                            let javaDay = weton.getJavaDay(for: date)
                            let javaDayValue = weton.getJavaDayValue(for: javaDay)
                            let totalWeton = dayValue + javaDayValue
                            
                            return (totalWeton % 5 == index)
                        }
                        
                        if !filteredDates.isEmpty {
                            Section(header: Text("Modulus \(index)")) {
                                ForEach(filteredDates, id: \.self) { date in
                                    let dayValue = weton.getDayValue(for: date)
                                    let javaDay = weton.getJavaDay(for: date)
                                    let javaDayValue = weton.getJavaDayValue(for: javaDay)
                                    let totalWeton = dayValue + javaDayValue
                                    
                                    
                                    
                                    Text("\(date, formatter: dateFormatter): \(totalWeton)")
                                    
                                    
                                }
                            }
                            
                            
                            
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .frame(width: screenWidth, height: screenHeight * 0.2)
            
        }
        .frame(width: screenWidth, height: screenHeight )
        .background(Color("secondary"))
    }
    //    }
    
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

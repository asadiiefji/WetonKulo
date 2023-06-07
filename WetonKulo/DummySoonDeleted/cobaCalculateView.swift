//
//  cobaCalculateView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 07/06/23.
//

import SwiftUI

struct cobaCalculateView: View {
    @State private var isModal : Bool = false
    
    @State private var selectedDate = Date()
    @State private var selectedDate2 = Date()
    @State private var fullDate = Date()
    @State private var dayOnly = Date()
    @State private var fullDate2 = Date()
    @State private var dayOnly2 = Date()
    
    @State private var totalWeton = 0
    @State private var selectedPoints1 = 0
    @State private var selectedPoints2 = 0
    
    @State private var resultSiklusLima = "-"
    @State private var resultSiklusTujuh = "-"
    @State private var resultSiklusDelapan = "-"
    
    private let customDays = ["pahing", "pon", "wage", "kliwon", "legi"]
    
    private let siklusLima = ["Lungguh", "Sri", "Dunya", "Lara", "Pati"]
    
    private let siklusTujuh = ["Lebu Katiup Angin", "Wasesa Segara", "Tunggak Semi", "Satriya Wibawa", "Sumur Sinaba", "Satriya Wirang", "Bumi Kapetak"]
    
    private let siklusDelapan = ["Pesthi", "Pegat", "Ratu", "Jodoh", "Topo", "Tinaru", "Padu", "Sujanan"]
    
    private let customDayValues: [String: Int] = [
        "pahing": 9,
        "pon": 7,
        "wage": 4,
        "kliwon": 8,
        "legi": 5
    ]
    
    let pointsByDay: [String: Int] = [
        "Sunday": 5,
        "Monday": 9,
        "Tuesday": 3,
        "Wednesday": 7,
        "Thursday": 8,
        "Friday": 6,
        "Saturday": 9
    ]
    
    func selectedDayPoints(for date: Date) -> Int {
        let day = Calendar.current.component(.weekday, from: date)
        let weekday = Calendar.current.weekdaySymbols[day - 1]
        return pointsByDay[weekday] ?? 0
    }
    
    func getCustomDay(for date: Date) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        let referenceDate = dateFormatter.date(from: "1900-01-01")!
        let daysSinceReference = calendar.dateComponents([.day], from: referenceDate, to: date).day ?? 0
        
        let customDayIndex = daysSinceReference % customDays.count
        return customDays[customDayIndex]
    }
    
    func getSiklusLima() {
        resultSiklusLima = siklusLima[totalWeton % 5]
    }
    
    func getSiklusTujuh() {
        resultSiklusTujuh = siklusTujuh[totalWeton % 7]
    }
    
    func getSiklusDelapan() {
        resultSiklusDelapan = siklusDelapan[totalWeton % 8]
    }
    
    func getCustomDayValue(for customDay: String) -> Int {
        return customDayValues[customDay] ?? 0
    }
    
    func getTotalWeton() {
        totalWeton = selectedPoints1 + getCustomDayValue(for: getCustomDay(for: selectedDate)) + selectedPoints2 + getCustomDayValue(for: getCustomDay(for: selectedDate2))
    }
    
    var body: some View{
        VStack {
            DatePicker("Select a date for man", selection: $selectedDate, in: dateRange, displayedComponents: .date)
                .datePickerStyle(.compact)
                .onAppear(){
                    selectedPoints1 = selectedDayPoints(for: selectedDate)
                }
                .onChange(of: selectedDate) { newValue in
                    fullDate = newValue
                    dayOnly = newValue
                    selectedPoints1 = selectedDayPoints(for: newValue)
                    
                }
                .accentColor(.orange)
                .padding()
            
            DatePicker("Select a date for woman", selection: $selectedDate2, in: dateRange, displayedComponents: .date)
                .datePickerStyle(.compact)
                .onAppear(){
                    selectedPoints2 = selectedDayPoints(for: selectedDate2)
                }
                .onChange(of: selectedDate2) { newValue in
                    fullDate2 = newValue
                    dayOnly2 = newValue
                    selectedPoints2 = selectedDayPoints(for: newValue)
                }
                .accentColor(.orange)
                .padding()
            
            HStack {
                Text("Man")
                    .frame(width: screenWidth/2)
                Text("Woman")
                    .frame(width: screenWidth/2)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            .background(Color.orange)
            
            //full date
            HStack{
                
                Text("\(fullDate, formatter: dateFormatter)")
                    .frame(width: screenWidth/2)
                Text("\(fullDate2, formatter: dateFormatter)")
                    .frame(width: screenWidth/2)
                
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            
            //day
            HStack {
                Text("\(dayOnly, formatter: dayFormatter)")
                    .frame(width: screenWidth/2)
                Text("\(dayOnly2, formatter: dayFormatter)")
                    .frame(width: screenWidth/2)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            .background(Color.gray)
            
            //poin hari
            HStack {
                Text("\(selectedPoints1)")
                    .frame(width: screenWidth/2)
                Text("\(selectedPoints2)")
                    .frame(width: screenWidth/2)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            
            //neptu
            HStack {
                Text("\(getCustomDay(for: selectedDate))")
                    .frame(width: screenWidth/2)
                Text("\(getCustomDay(for: selectedDate2))")
                    .frame(width: screenWidth/2)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            .background(Color.gray)
            
            //poin neptu
            HStack {
                Text("\(getCustomDayValue(for: getCustomDay(for: selectedDate)))")
                    .frame(width: screenWidth/2)
                Text("\(getCustomDayValue(for: getCustomDay(for: selectedDate2)))")
                    .frame(width: screenWidth/2)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            
            Button {
                getTotalWeton()
                getSiklusLima()
                getSiklusTujuh()
                getSiklusDelapan()
            } label: {
                VStack {
                    
                    Text("Cek Result")
                        .padding(12)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    
                    Text("Totalnya ini ya: \(totalWeton)")
                        .frame(width: screenWidth)
                        .background(Color.orange)
                        .foregroundColor(.black)
                    
                    HStack{
                        Text("5 Siklus")
                            .frame(width: screenWidth / 3)
                        Text("7 Siklus")
                            .frame(width: screenWidth / 3)
                        Text("8 Siklus")
                            .frame(width: screenWidth / 3)
                    }
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    HStack{
                        Text("\(resultSiklusLima)")
                            .frame(width: screenWidth / 3)
                        Text("\(resultSiklusTujuh)")
                            .frame(width: screenWidth / 3)
                        Text("\(resultSiklusDelapan)")
                            .frame(width: screenWidth / 3)
                    }
                    .background(Color.cyan)
                    .foregroundColor(.black)
                }
            }
        }
        .padding()
    }
}
struct cobaCalculateView_Previews: PreviewProvider {
    static var previews: some View {
        cobaCalculateView()
    }
}

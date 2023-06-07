//
//  Weton.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 07/06/23.
//

import Foundation


class Weton: ObservableObject {

    @Published var dateMan = Date()
    @Published var dateWoman = Date()
    @Published var fullDateMan = Date()
    @Published var fullDateWoman = Date()
    @Published var dayMan = Date()
    @Published var dayWoman = Date()
    
    let javaDay = ["Pahing", "Pon", "Wage", "Kliwon", "Legi"]
    
    let javaDayValue: [String: Int] = [
        "Pahing": 9,
        "Pon": 7,
        "Wage": 4,
        "Kliwon": 8,
        "Legi": 5
    ]
    
    let dayValue: [String: Int] = [
        "Sunday": 5,
        "Monday": 9,
        "Tuesday": 3,
        "Wednesday": 7,
        "Thursday": 8,
        "Friday": 6,
        "Saturday": 9
    ]
    
    let fiveCycle = ["Lungguh", "Sri", "Dunya", "Lara", "Pati"]
    
    let sevenCycle = ["Lebu Katiup Angin", "Wasesa Segara", "Tunggak Semi", "Satriya Wibawa", "Sumur Sinaba", "Satriya Wirang", "Bumi Kapetak"]
    
    let eightCycle = ["Pesthi", "Pegat", "Ratu", "Jodoh", "Topo", "Tinaru", "Padu", "Sujanan"]
    
    func getDayValue(for date: Date) -> Int {
        let day = Calendar.current.component(.weekday, from: date)
        let weekday = Calendar.current.weekdaySymbols[day - 1]
        return dayValue[weekday] ?? 0
    }
    
    func getJavaDay(for date: Date) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        let referenceDate = dateFormatter.date(from: "1900-01-01")!
        let daysSinceReference = calendar.dateComponents([.day], from: referenceDate, to: date).day ?? 0
        
        let javaDayIndex = daysSinceReference % javaDay.count
        return javaDay[javaDayIndex]
    }
    
    func getJavaDayValue(for javaDay: String) -> Int {
        return javaDayValue[javaDay] ?? 0
    }
    
    func getWetonMan() -> Int {
        return getDayValue(for: dateMan) + getJavaDayValue(for: getJavaDay(for: dateMan))
    }
    
    func getWetonWoman() -> Int {
        return getDayValue(for: dateWoman) + getJavaDayValue(for: getJavaDay(for: dateWoman))
    }
    
    func getTotalWeton() -> Int {
        return getWetonMan() + getWetonWoman()
    }
    
    func getFiveCycle() -> String {
        return fiveCycle[getTotalWeton() % 5]
    }
    
    func getSevenCycle() -> String {
        return sevenCycle[getTotalWeton() % 7]
    }

    func getEightCycle() -> String {
        return eightCycle[getTotalWeton() % 8]
    }
    
}

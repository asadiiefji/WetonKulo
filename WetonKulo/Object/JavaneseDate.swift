//
//  JavaneseDate.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 07/06/23.
//

import Foundation

struct JavaneseDate: Hashable, Identifiable {
    let id: UUID = UUID()
    let dateMan: Date
    let dateWoman: Date
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()

let dayFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE"
    return formatter
}()

let dateRange: ClosedRange<Date> = {
    let calendar = Calendar.current
    let startComponents = DateComponents(year: 1900, month: 1, day: 1)
    return calendar.date(from:startComponents)! ... Date()
}()


//
//  CalendarGoodDateView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 14/06/23.
//

import SwiftUI

struct CalendarGoodDateView: View {
    
    @Binding var currentDate: Date
    
    init(currentDate: Binding<Date>) {
        _currentDate = currentDate
        let now = Date()
        _currentMonth = State(initialValue: Calendar.current.component(.month, from: now))
    }
    //    private let calendar = Calendar.current
//    @State private var selectedMonth: Date = Date()
    
    
    //Month update on arrow button
    @State var currentMonth: Int = 0
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                
                
                let days: [String] =
                ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                
                VStack(spacing: 30) {
                    HStack {
                        Button {
                            withAnimation {
                                currentMonth -= 1
                                print(currentMonth)
                                //                                print(extraDate())
                            }
                        } label: {
                            Image(systemName: "chevron.backward.circle")
                                .font(.system(size: 30, weight: .regular))
                                .foregroundColor(Color("tertiary"))
                            
                        }
                        
                        Spacer()
                        Text("Tanggal Baik Menikah")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        Button {
                            withAnimation {
                                currentMonth += 1
                                print(currentMonth)
                                //                                print(extraDate())
                            }
                        } label: {
                            Image(systemName: "chevron.forward.circle")
                                .font(.system(size: 30, weight: .regular))
                                .foregroundColor(Color("tertiary"))
                            
                        }
                    }
                    .padding(.top, 60)
                    
                    HStack{
                        ForEach(days, id: \.self) { day in
                            Text(day)
                            //                                .font(.body)
                                .fontWeight(.regular)
                                .font(.system(size: 15))
                                .frame(maxWidth: .infinity)
                        }
                    }
                    Divider()
                }
                .frame(width: screenWidth, height: screenHeight * 0.2)
                .background(Color("primary"))
                
                ScrollView(.vertical) {
                    
//                    HStack {
//                        Text("uhuy")
//                    }
                    
                    let columns = Array(repeating: GridItem(.flexible()), count: 7)
                    ForEach(extractDate(), id: \.self) { month in
                        Section(header:
                                    Text(extraDate(for: month.first!.date))
                            .padding(.top, 20)
                        ) {
                            LazyVGrid(columns: columns, spacing: 15) {
                                ForEach(month) { value in
                                    Cardview(value: value)
                                        .background(
                                            Capsule()
                                                .fill(Color("primary"))
                                                .opacity(value.day != -1 && isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                                        )
                                        .onTapGesture {
                                            currentDate = value.date
                                        }
                                }
                            }
                        }
                    }
//                    .onAppear {
//                        selectedMonth = currentDate
//                    }
//
                    
                    
                    
                }
                .frame(width: screenWidth, height: screenHeight * 0.55)
                
                
                Divider()
                VStack(spacing: 30) {
                    
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        
                        HStack(spacing: 10) {
                            
                            Group {
                                Text("Hari Terbaik")
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 15)
                                    .background(Color("warnaTerbaik"))
                                
                                Text("Hari Baik")
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 15)
                                    .background(Color("warnaBaik"))
                                
                                Text("Hari Cukup")
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 15)
//                                    .background(Color("warnaTerbaik"))
                                    .border(Color("tertiary"), width: 2)
                                    
                                
                                Text("Hari Buruk")
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 15)
//                                    .background(Color("warnaTerbaik"))
                                    .border(Color("tertiary"), width: 2)
                                
                                Text("Hari Terburuk")
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 15)
//                                    .background(Color("warnaTerbaik"))
                                    .border(Color("tertiary"), width: 2)
                            }
                            .fontWeight(.regular)
                            .font(.system(size: 15))
                            
                            
                        }
                        
                        
                        
                    }
                    
                    HStack{
                        
                        Text(getDayFormatter(for: currentDate))
                            .font(.title3)
                        Spacer()
                        Text("lihat artinya")
                        
                    }
                    
                    NavigationLink(destination: {
                        //Call View Here
                    }, label: {
                        Text("Dashboard")
                            .font(.system(size: 18, weight: .semibold))
                            .padding(15)
                            .frame(width: screenWidth * 0.8)
                            .background(Color("secondary"))
                            .cornerRadius(30, corners: .allCorners)
                            .foregroundColor(Color("tertiary"))
                    })
                    .disabled(true) //delete this

                }
                .padding(15)
                
                .frame(width: screenWidth, height: screenHeight * 0.25)
                .background(Color("primary"))
//                .padding(.bottom, 20)
                
            }
            .frame(width: screenWidth, height: screenHeight, alignment: .top)
            .onChange(of: currentMonth) { newValue in
                //updating month
                currentDate = getCurrentMonth()
                
            }
            
        }
    }
    
    @ViewBuilder
    func Cardview(value: DateValue) -> some View {
        VStack{
            if value.day != -1 {
                
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }){
                    VStack {
                        Text("\(value.day)")
                            .fontWeight(.medium)
                            .font(.system(size: 15))
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .black : Color.brown)
                        
                        Spacer()
                        Circle()
                            .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : Color("tertiary"))
                            .frame(width: 8, height: 8)
                        
                    }
//                    .background(Color(isSameDay(date1: task.taskDate, date2: currentDate) ? "primary" : "secondary" ) )
                    //                        .frame(maxWidth: .infinity)
                    
                }
                else{
                    Text("\(value.day)")
                        .fontWeight(.medium)
                        .font(.system(size: 15))
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .black : Color.brown)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }
        .padding(.vertical, 18)
        .frame(maxWidth: .infinity, minHeight: 65, alignment: .bottom)
        
        //        .background(Color("primary"))
    }
    
    //checking dates
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func headerView(for date: Date) -> some View {
        let monthName = extraDate(for: date)
        return Group {
            Text(monthName)
                .font(.headline)
                .fontWeight(.bold)
                .padding(.vertical, 8)
        }
    }
    
    //extrating year and month for display
    func extraDate(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"
        return formatter.string(from: date)
    }
    
    
    func getDayFormatter(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMMM"
        return formatter.string(from: date)
    }
    
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else{
            return Date()
        }
        return currentMonth
    }
    
    func extractDate() -> [[DateValue]] {
        var months: [[DateValue]] = []
        let calendar = Calendar.current
        
        let startDateComponents = DateComponents(year: 2023, month: 6, day: 1)
        guard let startDate = calendar.date(from: startDateComponents) else {
            return months
        }
        
        var currentDate = startDate
        while calendar.component(.year, from: currentDate) <= 2024 {
            let month = calendar.component(.month, from: currentDate)
            let day = calendar.component(.day, from: currentDate)
            let dateValue = DateValue(day: day, date: currentDate)
            
            if months.isEmpty || calendar.component(.month, from: months.last!.first!.date) != month {
                months.append([dateValue])
            } else {
                months[months.count - 1].append(dateValue)
            }
            
            guard let nextDate = calendar.date(byAdding: .day, value: 1, to: currentDate) else {
                break
            }
            currentDate = nextDate
        }
        
        return months
    }
    
    
    
}

struct CalendarGoodDateView_Previews: PreviewProvider {
    static var previews: some View {
        //        @State var currentDate = Date()
        ContentView()
    }
}

//extending date to get currentdate
extension Date{
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        //getting start date
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        //getting range
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        //        range.removeLast()
        //getting date
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}

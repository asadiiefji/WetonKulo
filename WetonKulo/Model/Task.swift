//
//  Task.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 18/06/23.
//

import SwiftUI

//Task model and sample task
//Array of task
struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

//Total task meta view
struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

//Sample data for testing
func getSampleData(offset: Int) -> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}

//sample tasks
var tasks: [TaskMetaData] = [
    
    TaskMetaData(task: [
        Task(title: "Task pertama nih bos"),
        Task(title: "Task kedua ya bro"),
        Task(title: "Task ketiga cuy")
    ], taskDate: getSampleData(offset: 1)),
    
    TaskMetaData(task: [
        Task(title: "2nd Task brow")
    ], taskDate: getSampleData(offset: -3)),
    
    TaskMetaData(task: [
        Task(title: "3rd Task ya cuy")
    ], taskDate: getSampleData(offset: -8)),
    
    TaskMetaData(task: [
        Task(title: "4th Task sih kak")
    ], taskDate: getSampleData(offset: 10)),
    
    TaskMetaData(task: [
        Task(title: "5th Task lah yaa")
    ], taskDate: getSampleData(offset: -22)),
    
    TaskMetaData(task: [
        Task(title: "6th Task dongg")
    ], taskDate: getSampleData(offset: 15)),
    
    TaskMetaData(task: [
        Task(title: "7th Task ya ges ya")
    ], taskDate: getSampleData(offset: 20)),

]

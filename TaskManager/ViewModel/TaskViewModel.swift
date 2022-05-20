//
//  TaskViewModel.swift
//  TaskManager
//
//  Created by The Ngoc on 2022/05/19.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
    @Published var currentTab: String = "Today"
    
    // MARK: New task properties
    @Published var openEditTask: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskColor: String = "Yellow"
    @Published var taskDeadline: Date = Date()
    @Published var taskType: String = "Basic"
}


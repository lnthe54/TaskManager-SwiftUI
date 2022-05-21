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

enum ColorTask: String {
    case yellow = "Yellow"
    case green = "Green"
    case blue = "Blue"
    case purple = "Purple"
    case red = "Red"
    case orange = "Orange"
    
    func getColor() -> UIColor {
        switch self {
        case .yellow:
            return .yellow
        case .green:
            return .green
        case .blue:
            return .blue
        case .purple:
            return .purple
        case .red:
            return .red
        case .orange:
            return .orange
        }
    }
}



//
//  AddTask.swift
//  TaskManager
//
//  Created by The Ngoc on 2022/05/20.
//

import SwiftUI

struct AddTask: View {
    
    @EnvironmentObject var taskModel: TaskViewModel
    
    @Environment(\.self) var env
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Edit task")
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Button {
                        env.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Task Color")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                // MARK: Sample Card Colors
                let colors: [ColorTask]  = [.yellow, .green, .blue, .purple, .red, .orange]
                
                HStack(spacing: 15) {
                    ForEach(colors, id: \.self) { color in
                        Circle()
                            .fill(Color(color.getColor()))
                            .frame(width: 25, height: 25)
                            .background {
                                if taskModel.taskColor == color.rawValue {
                                    Circle()
                                        .strokeBorder(.black)
                                        .padding(-3)
                                }
                            }
                            .contentShape(Circle())
                            .onTapGesture {
                                taskModel.taskColor = color.rawValue
                            }
                    }
                }
                .padding(.top, 10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 30)
            
            Divider()
                .padding(.vertical, 10)
            
            // MARK: Task Deadline
            VStack(alignment: .leading, spacing: 12) {
                Text("Task Deadline")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                // MARK: Text field
                Text(taskModel.taskDeadline.formatted(date: .abbreviated, time: .omitted) + ", " + taskModel.taskDeadline.formatted(date: .omitted, time: .shortened))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.top, 8)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(alignment: .bottomTrailing) {
                Button {
                    // Do something
                } label: {
                    Image(systemName: "calendar")
                        .foregroundColor(.black)
                }
            }
            
            Divider()
            
            // MARK: Task title
            VStack(alignment: .leading, spacing: 12) {
                Text("Task Title")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                // MARK: Text field
                TextField("Title", text: $taskModel.taskTitle)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 10)
                
            }
            
            Divider()
            
            // MARK: Task Type
            let taskTypes: [String] = ["Basic", "Urgent", "Important"]
            VStack(alignment: .leading, spacing: 12) {
                Text("Task Type")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack(spacing: 12) {
                    ForEach(taskTypes, id: \.self) { type in
                        Text(type)
                            .font(.callout)
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(taskModel.taskType == type ? .white : .black)
                            .background {
                                if taskModel.taskType == type {
                                    Capsule()
                                        .fill(.black)
                                        .matchedGeometryEffect(id: "TYPE", in: animation)
                                } else {
                                    Capsule()
                                        .strokeBorder(.black)
                                }
                            }
                            .contentShape(Capsule())
                            .onTapGesture {
                                withAnimation {
                                    taskModel.taskType = type
                                }
                            }
                    }
                }
                .padding(.top, 8)
            }
            .padding(.vertical, 10)
            
            Divider()
            
            // MARK: Save Button
            Button {
                
            } label: {
                Text("Save Task")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .foregroundColor(.white)
                    .background {
                        Capsule()
                            .fill(.black)
                    }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 10)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask()
            .environmentObject(TaskViewModel())
    }
}

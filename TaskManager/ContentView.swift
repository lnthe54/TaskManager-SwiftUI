//
//  ContentView.swift
//  TaskManager
//
//  Created by The Ngoc on 2022/05/19.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            Home()
                .navigationBarTitle("Task Manager")
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

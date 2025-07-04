//
//  ContentView.swift
//  ripassoIOS
//
//  Created by Guido Panzieri on 27/06/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            Tab("Todos", systemImage: "checklist") {
                TodosView()
            }

            Tab("Detail", systemImage: "person.crop.circle") {
                DetailView(todo: Todo(userId: 0, id: 0, title: "Watch your list!", completed: false))
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  DetailView.swift
//  ripassoIOS
//
//  Created by Guido Panzieri on 27/06/25.
//

import SwiftUI

struct DetailView: View {
    let todo: Todo
    var body: some View {
        NavigationStack {
            VStack {
                Text("Todos number \(todo.id ?? 0)")
                HStack(alignment: .center){
                    Text("\(todo.title)")
                    Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                }
            }
            .padding()
            .navigationTitle("Details")
        }
    }
}

#Preview {
    DetailView(todo: Todo(userId: 0, id: 0, title: "Watch your list!", completed: false))
}

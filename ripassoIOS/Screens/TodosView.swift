//
//  TodosView.swift
//  ripassoIOS
//
//  Created by Guido Panzieri on 27/06/25.
//

import SwiftUI

struct TodosView: View {
    @StateObject private var viewModel = TodosViewModel()
    @State private var isShowSheet: Bool = false
    @State private var selectedTodo: Todo? = nil
    var body: some View {
        NavigationStack {
            List(viewModel.todos) { todo in
                HStack {
                    Text(todo.title)
                    Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                        .onTapGesture {
                            viewModel.onTappedChangeValue(todo: todo)
                        }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedTodo = todo
                    isShowSheet = true
                }
                .navigationTitle("Todos")
                .padding()
            }
            .task {
                await viewModel.getTodos()
            }
            .navigationDestination(isPresented: $isShowSheet) {
                if let selected = selectedTodo {
                    DetailView(todo: selected)
                } else {
                }
            }
        }
    }
}


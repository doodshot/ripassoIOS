//
//  HomeViewModal.swift
//  ripassoIOS
//
//  Created by Guido Panzieri on 27/06/25.
//

import Foundation

class TodosViewModel: ObservableObject {
    // @Published per aggiornare la UI del VM
    @Published var todos: [Todo] = []
    
    func getTodos() async {
        do {
            let todosArr = try await NetworkManager.shared.getTodso()
            self.todos = todosArr
        } catch {
            print("Sei gays!!!")
        }
    }
    
    func onTappedChangeValue(todo: Todo) {
        if let index = todos.firstIndex(where: {$0.id == todo.id}) {
            todos[index].completed.toggle()
        }
    }
    
}

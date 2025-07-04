//
//  Todos.swift
//  ripassoIOS
//
//  Created by Guido Panzieri on 27/06/25.
//

import Foundation

struct Todo: Decodable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    var completed: Bool
}

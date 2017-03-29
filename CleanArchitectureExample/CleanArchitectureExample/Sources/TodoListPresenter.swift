//
//  TodoListPresenter.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/21.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import UIKit

struct TodoListPresenter {
    
    private let useCase: TodoListUseCase
    private let wireframe: TodoListWireframe
    
    public init(useCase: TodoListUseCase, wireframe: TodoListWireframe) {
        self.useCase = useCase
        self.wireframe = wireframe
    }
    
    public func fetchTodoList(_ complition: ((Void) -> Void)?) {
        useCase.fetchTodos { _ in
            complition?()
        }
    }
    
    public func todosCount() -> Int {
        return useCase.todos.count
    }
    
    public func todo(from row: Int) -> TodoModel {
        return useCase.todos[row]
    }
    
    public func prepare(for segue: UIStoryboardSegue) {
        if let todo = useCase.selectedTodo() {
            wireframe.showTodoDetail(to: segue.destination, model: todo)
            deselectTodo()
        }
    }
    
    public func select(_ row: Int) {
        useCase.select(row)
    }
    
    public func deselectTodo() {
        useCase.deselect()
    }
}

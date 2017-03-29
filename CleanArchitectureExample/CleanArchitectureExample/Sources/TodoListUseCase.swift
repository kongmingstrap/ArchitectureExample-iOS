//
//  TodoListUseCase.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/21.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Foundation

typealias TodoListComplitionHandler = (Void) -> Void

// MARK: - Interface
protocol TodoListUseCase {
    var todos: [TodoModel] { get }
    func fetchTodos(_ complite: TodoListComplitionHandler?)
    func select(_ row: Int)
    func deselect()
    func selectedTodo() -> TodoModel?
}

// MARK: - Implementation
final class TodoListUseCaseImpl: TodoListUseCase {
    
    private let todoRepository: TodoRepository
    private var todoModels: [TodoModel] = []
    
    var todos: [TodoModel] {
        get {
            return todoModels
        }
    }
    
    private var selected: Int? = nil
    
    public init(todoRepository: TodoRepository) {
        self.todoRepository = todoRepository
    }
    
    public func fetchTodos(_ compliton: TodoListComplitionHandler?) {
        todoRepository.get { [weak self] result in
            switch result {
            case .success(let value):
                self?.todoModels = try! TodoTranslator().translate(value)
            case .failure(let error):
                print(error)
            }
            compliton?()
        }
    }
    
    public func select(_ row: Int) {
        selected = row
    }
    
    public func deselect() {
        selected = nil
    }
    
    public func selectedTodo() -> TodoModel? {
        return selected.map { row -> TodoModel in
            todoModels[row]
        }
    }
}

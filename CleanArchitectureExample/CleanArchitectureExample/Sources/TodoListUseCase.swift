//
//  TodoListUseCase.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/21.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Foundation

typealias TodoListComplitionHandler = ([TodoModel]?) -> Void

// MARK: - Interface
protocol TodoListUseCase {
    func fetchTodos(_ complite: TodoListComplitionHandler?)
}

// MARK: - Implementation
struct TodoListUseCaseImpl: TodoListUseCase {
    
    private let todoRepository: TodoRepository
    
    public init(todoRepository: TodoRepository) {
        self.todoRepository = todoRepository
    }
    
    public func fetchTodos(_ compliton: TodoListComplitionHandler?) {
        todoRepository.get { result in
            switch result {
            case .success(let value):
                let todoModels = try! TodoTranslator().translate(value)
                compliton?(todoModels)
            case .failure(let error):
                print(error)
                compliton?(nil)
            }
        }
    }
}

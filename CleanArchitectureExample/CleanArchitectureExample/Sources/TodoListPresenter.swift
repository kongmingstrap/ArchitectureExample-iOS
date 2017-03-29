//
//  TodoListPresenter.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/21.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import UIKit

final class TodoListPresenter {
    
    private let useCase: TodoListUseCase
    private let wireframe: TodoListWireframe
    private var todoViewModels: [TodoViewModel] = []
    private var selectedRow: Int?
    
    public init(useCase: TodoListUseCase, wireframe: TodoListWireframe) {
        self.useCase = useCase
        self.wireframe = wireframe
    }
    
    public func fetchTodoList(_ complition: ((Void) -> Void)?) {
        useCase.fetchTodos { [weak self] todos in
            if let todos = todos {
                self?.todoViewModels = todos.map { TodoViewModel(model: $0) }
            }
            complition?()
        }
    }
    
    public func todosCount() -> Int {
        return todoViewModels.count
    }
    
    public func todo(from row: Int) -> TodoViewModel {
        return todoViewModels[row]
    }
    
    public func prepare(for segue: UIStoryboardSegue) {
        if let todoViewModel = selectedRow.map({ row in todoViewModels[row] }) {
            wireframe.showTodoDetail(to: segue.destination, viewModel: todoViewModel)
            deselectRow()
        }
    }
    
    public func select(_ row: Int) {
        selectedRow = row
    }
    
    public func deselectRow() {
        selectedRow = nil
    }
}

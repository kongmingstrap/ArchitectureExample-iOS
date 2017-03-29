//
//  TodoListWireframe.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/21.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import UIKit

protocol TodoListWireframe: class {
    weak var viewController: TodoListViewController? { get set }
    
    func showTodoDetail(to viewController: UIViewController, model: TodoModel)
}

// MARK: - Implementation
final class TodoListWireframeImpl: TodoListWireframe {
    weak var viewController: TodoListViewController?
    
    func showTodoDetail(to viewController: UIViewController, model: TodoModel) {
        TodoDetailBuilder.inject(with: viewController, viewModel: model)
    }
}

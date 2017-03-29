//
//  TodoListBuilder.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/21.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import UIKit

struct TodoListBuilder {
    static func inject(with viewController: UIViewController) {
        let vc = viewController as! TodoListViewController
        let wireframe = TodoListWireframeImpl()
        let todoRepository = TodoRepositoryImpl(dataStore: TodoDataStoreImpl.shared)
        let useCase = TodoListUseCaseImpl(todoRepository: todoRepository)
        let presenter = TodoListPresenter(useCase: useCase, wireframe: wireframe)
        vc.inject(with: presenter)
        wireframe.viewController = vc
    }
}

//
//  RootWireframe.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/21.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import UIKit

protocol RootWireframe: class {
    weak var viewController: RootViewController? { get set }
    
    func showTodoList(to viewController: UIViewController)
}

// MARK: - Implementation
class RootWireframeImpl: RootWireframe {
    weak var viewController: RootViewController?
    
    func showTodoList(to viewController: UIViewController) {
        TodoListBuilder.inject(with: viewController)
    }
}

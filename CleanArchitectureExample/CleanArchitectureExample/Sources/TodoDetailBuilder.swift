//
//  TodoDetailBuilder.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/22.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import UIKit

struct TodoDetailBuilder {
    static func inject(with viewController: UIViewController, viewModel: TodoModel) {
        let vc = viewController as! TodoDetailViewController
        let useCase = TodoDetailUseCaseImpl(todoModel: viewModel)
        let presenter = TodoDetailPresenter(useCase: useCase)
        vc.inject(with: presenter)
    }
}

//
//  TodoDetailBuilder.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/22.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import UIKit

struct TodoDetailBuilder {
    static func inject(with viewController: UIViewController, viewModel: TodoViewModel) {
        let vc = viewController as! TodoDetailViewController
        let useCase = TodoDetailUseCaseImpl()
        let presenter = TodoDetailPresenter(useCase: useCase, viewModel: viewModel)
        vc.inject(with: presenter)
    }
}

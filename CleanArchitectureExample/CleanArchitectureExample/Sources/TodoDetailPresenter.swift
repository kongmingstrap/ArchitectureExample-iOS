//
//  TodoDetailPresenter.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/22.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Foundation

enum TodoDetailTableType {
    
    enum Section: Int {
        case title = 0
        case description = 1
        case other = 2
        case delete = 3
    }
    
    static func sectionCount() -> Int {
        return 5
    }
    
    static func rowCount(from section: Int) -> Int {
        
        guard let sec = TodoDetailTableType.Section(rawValue: section) else {
            return 0
        }
        
        switch sec {
        case .title:
            return 1
        case .description:
            return 2
        case .other:
            return 3
        case .delete:
            return 1
        }
    }
}

final class TodoDetailPresenter {
    
    private let useCase: TodoDetailUseCase
    private let viewModel: TodoViewModel
    
    public init(useCase: TodoDetailUseCase, viewModel: TodoViewModel) {
        self.useCase = useCase
        self.viewModel = viewModel
    }
    
    public func description(from indexPath: IndexPath) -> String {
        return useCase.description(of: viewModel, from: indexPath)
    }
    
    public func sectionCount() -> Int {
        return TodoDetailTableType.sectionCount()
    }
    
    public func rowCount(from section: Int) -> Int {
        return TodoDetailTableType.rowCount(from: section)
    }
    
}

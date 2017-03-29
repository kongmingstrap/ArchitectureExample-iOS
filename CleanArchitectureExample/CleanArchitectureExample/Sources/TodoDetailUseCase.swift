//
//  TodoDetailUseCase.swift
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

// MARK: - Interface
protocol TodoDetailUseCase {
    func description(from indexPath: IndexPath) -> String
}

// MARK: - Implementation
final class TodoDetailUseCaseImpl: TodoDetailUseCase {
    
    private let todoViewModel : TodoViewModel
    
    public init(todoModel: TodoModel) {
        self.todoViewModel = TodoViewModel(model: todoModel)
    }
    
    func description(from indexPath: IndexPath) -> String {
        guard let section = TodoDetailTableType.Section(rawValue: indexPath.section) else { return "" }
        
        switch section {
        case .title:
            switch indexPath.row {
            case 0:
                return todoViewModel.title ?? "none"
            default:
                return "none"
            }
        case .description:
            switch indexPath.row {
            case 0:
                return todoViewModel.description ?? ""
            case 1:
                return todoViewModel.memo ?? ""
            default:
                return "none"
            }
        case .other:
            switch indexPath.row {
            case 0:
                return todoViewModel.type.rawValue
            case 1:
                return todoViewModel.state.rawValue
            case 2:
                return "none"
            default:
                return "none"
            }
        case .delete:
            switch indexPath.row {
            case 0:
                return "delete"
            default:
                return "none"
            }
        }
    }
}

//
//  TodoDetailUseCase.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/22.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Foundation

// MARK: - Interface
protocol TodoDetailUseCase {
    func description(of model: TodoViewModel, from indexPath: IndexPath) -> String
}

// MARK: - Implementation
struct TodoDetailUseCaseImpl: TodoDetailUseCase {
    
    func description(of model: TodoViewModel, from indexPath: IndexPath) -> String {
        guard let section = TodoDetailTableType.Section(rawValue: indexPath.section) else { return "" }
        
        switch section {
        case .title:
            switch indexPath.row {
            case 0:
                return model.title ?? "none"
            default:
                return "none"
            }
        case .description:
            switch indexPath.row {
            case 0:
                return model.description ?? ""
            case 1:
                return model.memo ?? ""
            default:
                return "none"
            }
        case .other:
            switch indexPath.row {
            case 0:
                return model.type.rawValue
            case 1:
                return model.state.rawValue
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

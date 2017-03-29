//
//  TodoDetailPresenter.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/22.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Foundation

struct TodoDetailPresenter {
    
    private let useCase: TodoDetailUseCase
    
    public init(useCase: TodoDetailUseCase) {
        self.useCase = useCase
    }
    
    public func description(from indexPath: IndexPath) -> String {
        return useCase.description(from: indexPath)
    }
    
    public func sectionCount() -> Int {
        return TodoDetailTableType.sectionCount()
    }
    
    public func rowCount(from section: Int) -> Int {
        return TodoDetailTableType.rowCount(from: section)
    }
    
}

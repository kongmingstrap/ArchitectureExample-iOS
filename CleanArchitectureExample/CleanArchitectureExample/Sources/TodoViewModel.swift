//
//  TodoViewModel.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/21.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Foundation

public struct TodoViewModel {
    let title: String?
    let description: String?
    let memo: String?
    let type: TodoType.TaskType
    let state: TodoType.State
    let done: Bool
    let expiredAt: Date?
    
    init(model: TodoModel) {
        title = model.title
        description = model.description
        memo = model.memo
        type = model.type
        state = model.state
        done = model.done
        expiredAt = model.expiredAt
    }
}

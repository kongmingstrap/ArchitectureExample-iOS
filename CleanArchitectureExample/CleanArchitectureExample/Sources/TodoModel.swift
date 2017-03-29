//
//  TodoModel.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/21.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Foundation

public struct TodoModel {
    let id: Int
    let title: String?
    let description: String?
    let memo: String?
    let type: TodoType.TaskType
    let state: TodoType.State
    let done: Bool
    let expiredAt: Date?
    let createdAt: Date?
    let updatedAt: Date?
    
    init(entity: TodoEntity) {
        id = entity.id
        title = entity.title
        description = entity.description
        memo = entity.memo
        type = TodoType.TaskType(rawValue: entity.type ?? "") ?? .privateTask
        state = TodoType.State(rawValue: entity.state ?? "") ?? .normal
        done = entity.done
        expiredAt = nil
        createdAt = nil
        updatedAt = nil
    }
}

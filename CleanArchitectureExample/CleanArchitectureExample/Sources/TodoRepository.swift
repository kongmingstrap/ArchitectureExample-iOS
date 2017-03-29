//
//  TodoRepository.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/21.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Alamofire

// MARK: - Interface
public protocol TodoRepository {
    func get(_ handler: @escaping (Result<[TodoEntity]>) -> Void)
}

// MARK: - Implementation
struct TodoRepositoryImpl: TodoRepository {
    private let dataStore: TodoDataStore
    
    public init(dataStore: TodoDataStore) {
        self.dataStore = dataStore
    }
    
    func get(_ handler: @escaping (Result<[TodoEntity]>) -> Void) {
        dataStore.get(with: ["filter": "all"]).onSuccess { entities in
            let result = Result<[TodoEntity]>.success(entities)
            handler(result)
        }.onFailure { error in
            let result = Result<[TodoEntity]>.failure(error)
            handler(result)
        }
    }
}

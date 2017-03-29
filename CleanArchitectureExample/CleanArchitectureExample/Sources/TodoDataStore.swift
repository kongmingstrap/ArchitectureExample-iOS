//
//  TodoDataStore.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/21.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Alamofire
import BrightFutures
import ObjectMapper

// MARK: - Interface
public protocol TodoDataStore: DataStore {
    func get(with parameters: [String: Any]?) -> Future<[TodoEntity], NSError>
}

// MARK: - Implementation
public struct TodoDataStoreImpl: TodoDataStore, APIClient {
    
    public static let shared: TodoDataStore = TodoDataStoreImpl()
    
    public func get(with parameters: [String: Any]? = nil) -> Future<[TodoEntity], NSError> {
        let promise = Promise<[TodoEntity], NSError>()
        
        Alamofire.request(self.endpointString(with: "todo"), parameters: parameters)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
            switch response.result {
            case .success(let value):
                let todos = Mapper<TodosEntity>().map(JSONObject: value)
                promise.success(todos!.items)
            case .failure(let error):
                promise.failure(error as NSError)
            }
        }
        
        return promise.future
    }
}

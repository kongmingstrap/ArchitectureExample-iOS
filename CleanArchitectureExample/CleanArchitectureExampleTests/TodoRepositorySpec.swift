//
//  TodoRepositorySpec.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/28.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Foundation
import BrightFutures
import Foundation
import Nimble
import ObjectMapper
import OHHTTPStubs
import Quick

@testable import CleanArchitectureExample

final class TodoRepositorySpec: QuickSpec {

    struct TodoDataStoreMock: TodoDataStore {
        
        public func get(with parameters: [String: Any]? = nil) -> Future<[TodoEntity], NSError> {
            let promise = Promise<[TodoEntity], NSError>()
            return promise.future
        }
    }
    
    override func spec() {
        var dataStore: TodoDataStoreMock!
        var todoRepository: TodoRepository!
        
        beforeEach {
            dataStore = TodoDataStoreMock()
            todoRepository = TodoRepositoryImpl(dataStore: dataStore)
        }
        
        describe("todo get method") {
            context("get method") {
                it("call get") {
                    todoRepository.get { result in
                        expect(result).notTo(beNil())
                    }
                }
            }
        }
    }
}

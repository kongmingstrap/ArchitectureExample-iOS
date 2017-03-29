//
//  TodoListUseCaseSpec.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/28.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Alamofire
import BrightFutures
import Foundation
import Nimble
import ObjectMapper
import OHHTTPStubs
import Quick

@testable import CleanArchitectureExample

final class TodoListUseCaseSpec: QuickSpec {
    
    struct TodoDataStoreMock: TodoDataStore {
        
        public func get(with parameters: [String: Any]? = nil) -> Future<[TodoEntity], NSError> {
            let promise = Promise<[TodoEntity], NSError>()
            return promise.future
        }
    }
    
    struct TodoRepositoryMock: TodoRepository {
        private let dataStore: TodoDataStore
        
        public init(dataStore: TodoDataStore) {
            self.dataStore = dataStore
        }
        
        func get(_ handler: @escaping (Result<[TodoEntity]>) -> Void) {
            
            let item1: [String : Any?] = [
                "id": 5,
                "title": "粗大ごみを出す",
                "description": "本棚",
                "memo": "シールを貼ってるかも確認する",
                "type": "private",
                "state": "normal",
                "done": false,
                "expiredAt": "2018-03-24T12:00:00+09:00",
                "createdAt": "2017-03-23T16:00:00+09:00",
                "updatedAt": "2017-03-23T16:00:00+09:00"
            ]
            
            let item2: [String : Any?] = [
                "id": 4,
                "title": "稼働管理表を提出",
                "description": nil,
                "memo": nil,
                "type": "work",
                "state": "archived",
                "done": true,
                "expiredAt": "2017-03-24T12:00:00+09:00",
                "createdAt": "2017-03-23T15:00:00+09:00",
                "updatedAt": "2017-03-23T15:00:00+09:00"
            ]
            
            let item3: [String : Any?] = [
                "id": 3,
                "title": "傘を持って帰る",
                "description": "いっつも忘れるから",
                "memo": nil,
                "type": "other",
                "state": "normal",
                "done": false,
                "expiredAt": "2017-03-24T12:00:00+09:00",
                "createdAt": "2017-03-23T14:00:00+09:00",
                "updatedAt": "2017-03-23T14:00:00+09:00"
            ]
            
            let item4: [String : Any?] = [
                "id": 2,
                "title": "ここで水を飲む",
                "description": "焦らないため",
                "memo": "いつも慌てる",
                "type": "work",
                "state": "normal",
                "done": false,
                "expiredAt": "2018-03-24T12:00:00+09:00",
                "createdAt": "2017-03-23T13:00:00+09:00",
                "updatedAt": "2017-03-23T13:00:00+09:00"
            ]
            
            let item5: [String : Any?] = [
                "id": 1,
                "title": "卵を買う",
                "description": nil,
                "memo": nil,
                "type": "private",
                "state": "normal",
                "done": true,
                "expiredAt": "2017-03-24T12:00:00+09:00",
                "createdAt": "2017-03-23T12:00:00+09:00",
                "updatedAt": "2017-03-23T12:00:00+09:00"
            ]
            
            let jsonMock: [String : Any?] = [
                "items": [
                    item1,
                    item2,
                    item3,
                    item4,
                    item5
                ],
                "count": 5
            ]
            
            let todos = Mapper<TodosEntity>().map(JSONObject: jsonMock)!
            
            handler(Result.success(todos.items))
        }
    }

    override func spec() {
        var dataStore: TodoDataStoreMock!
        var todoRepository: TodoRepository!
        var useCase: TodoListUseCase!
        
        beforeEach {
            dataStore = TodoDataStoreMock()
            todoRepository = TodoRepositoryMock(dataStore: dataStore)
            useCase = TodoListUseCaseImpl(todoRepository: todoRepository)
        }
        
        describe("fetchTodos method") {
            context("result") {
                it("call fetchTodos") {
                    var call = false
                    
                    waitUntil(action: { done in
                        
                        useCase.fetchTodos {
                            call = true
                            done()
                        }
                    })
                    
                    expect(call).to(beTrue())
                    
                    
                }
            }
        }
    }
}

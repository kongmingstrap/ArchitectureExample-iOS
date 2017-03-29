//
//  TodoDataStoreSpec.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/27.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import BrightFutures
import Foundation
import Nimble
import OHHTTPStubs
import Quick

@testable import CleanArchitectureExample

final class TodoDataStoreSpec: QuickSpec {

    override func spec() {
        
        var todoDataStore: TodoDataStore!
        
        beforeEach {
            todoDataStore = TodoDataStoreImpl.shared
        }
        
        describe("todo get method") {
            
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
            
            let jsonData = try! JSONSerialization.data(withJSONObject: jsonMock, options: [])
            
            context("success pattern") {
                var httpStub: OHHTTPStubsDescriptor?
                beforeEach {
                    httpStub = OHHTTPStubs.stubRequests(passingTest: { request -> Bool in
                        true
                    }, withStubResponse: { request -> OHHTTPStubsResponse in
                        return OHHTTPStubsResponse(data: jsonData, statusCode: 200, headers: ["Content-Type": "application/json"])
                    })
                }
                it("expect to response") {
                    waitUntil { done in
                        let f = todoDataStore.get(with: nil)
                        
                        f.onComplete { result in
                            let todoEntites = result.value!
                            expect(todoEntites.count).to(equal(5))
                            expect(todoEntites[0].id).to(equal(5))
                            expect(todoEntites[1].id).to(equal(4))
                            expect(todoEntites[2].id).to(equal(3))
                            expect(todoEntites[3].id).to(equal(2))
                            expect(todoEntites[4].id).to(equal(1))
                            done()
                        }
                        
                        return
                    }
                }
                afterEach {
                    if let httpStub = httpStub {
                        OHHTTPStubs.removeStub(httpStub)
                    }
                }
            }
            
            context("failure pattern") {
                var httpStub: OHHTTPStubsDescriptor?
                beforeEach {
                    httpStub = OHHTTPStubs.stubRequests(passingTest: { request -> Bool in
                        true
                    }, withStubResponse: { request -> OHHTTPStubsResponse in
                        return OHHTTPStubsResponse(data: jsonData, statusCode: 500, headers: ["Content-Type": "application/json"])
                    })
                }
                it("expect to response") {
                    waitUntil { done in
                        let f = todoDataStore.get(with: nil)
                        
                        f.onComplete { result in
                            let error = result.error!
                            expect(error).notTo(beNil())
                            done()
                        }
                        
                        return
                    }
                }
                afterEach {
                    if let httpStub = httpStub {
                        OHHTTPStubs.removeStub(httpStub)
                    }
                }
            }
        }
    }
}

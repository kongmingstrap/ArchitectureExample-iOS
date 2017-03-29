//
//  TodosEntity.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/21.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Foundation
import ObjectMapper

public struct TodosEntity: Mappable {
    var items: [TodoEntity] = []
    var count: Int = 0
    
    public init?(map: Map) {
    }
    
    public mutating func mapping(map: Map) {
        items <- map["items"]
        count <- map["count"]
    }
}

public struct TodoEntity: Mappable {
    var id = 0
    var title: String? = nil
    var description: String? = nil
    var memo: String? = nil
    var type: String? = nil
    var state: String? = nil
    var done: Bool = false
    var expiredAt = ""
    var createdAt = ""
    var updatedAt = ""

    public init?(map: Map) {
    }
    
    public mutating func mapping(map: Map) {
        id          <- map["id"]
        title       <- map["title"]
        description <- map["description"]
        memo        <- map["memo"]
        type        <- map["type"]
        state       <- map["state"]
        done        <- map["done"]
        expiredAt   <- map["expiredAt"]
        createdAt   <- map["createdAt"]
        updatedAt   <- map["updatedAt"]
    }
}

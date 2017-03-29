//
//  TodoTranslator.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/21.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Foundation

struct TodoTranslator: Translator {
    typealias Input = [TodoEntity]
    typealias Output = [TodoModel]
    
    func translate(_ entity: Input) throws -> Output {
        let output: Output = entity.map { TodoModel(entity: $0) }
        return output
    }
}

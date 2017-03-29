//
//  TodoType.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/22.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Foundation

public enum TodoType {
    
    enum TaskType: String {
        case privateTask = "private"
        case workTask = "work"
        case otherTask = "other"
    }
    
    enum State: String {
        case normal = "normal"
        case archived = "archived"
    }
    
}

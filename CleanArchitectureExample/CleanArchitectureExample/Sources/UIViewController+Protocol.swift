//
//  UIViewController+Protocol.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/22.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import Foundation

protocol PresenterInjectable {
    associatedtype PresenterType
    
    func inject(with presenter: PresenterType)
}

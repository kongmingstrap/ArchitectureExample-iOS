//
//  RootPresenter.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/22.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import UIKit

struct RootPresenter {
    
    private let wireframe: RootWireframe
    
    public init(wireframe: RootWireframe) {
        self.wireframe = wireframe
    }

    public func prepare(for segue: UIStoryboardSegue) {
        wireframe.showTodoList(to: segue.destination)
    }
}

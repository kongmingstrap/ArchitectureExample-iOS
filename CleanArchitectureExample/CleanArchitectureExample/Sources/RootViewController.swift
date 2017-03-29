//
//  RootViewController.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/21.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import UIKit

final class RootViewController: UITableViewController {

    fileprivate var presenter: RootPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let wireframe = RootWireframeImpl()
        wireframe.viewController = self
        let presenter = RootPresenter(wireframe: wireframe)
        self.inject(with: presenter)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.prepare(for: segue)
    }

}

// MARK: - PresenterInjectable
extension RootViewController: PresenterInjectable {
    func inject(with presenter: RootPresenter) {
        self.presenter = presenter
    }
}

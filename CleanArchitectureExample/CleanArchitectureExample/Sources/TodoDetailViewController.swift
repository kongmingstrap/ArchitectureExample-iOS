//
//  TodoDetailViewController.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/22.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import UIKit

final class TodoDetailViewController: UITableViewController {

    fileprivate var presenter: TodoDetailPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.sectionCount()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.rowCount(from: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = presenter.description(from: indexPath)

        return cell
    }

}

// MARK: - PresenterInjectable
extension TodoDetailViewController: PresenterInjectable {
    func inject(with presenter: TodoDetailPresenter) {
        self.presenter = presenter
    }
}

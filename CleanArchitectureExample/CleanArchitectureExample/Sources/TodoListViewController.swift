//
//  TodoListViewController.swift
//  CleanArchitectureExample
//
//  Created by tanaka.takaaki on 2017/03/21.
//  Copyright © 2017年 tanaka.takaaki. All rights reserved.
//

import UIKit

final class TodoListViewController: UITableViewController {

    fileprivate var presenter: TodoListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(TodoListViewController.refresh(_:)), for: .valueChanged)
    }
    
    func refresh(_ sender: AnyObject) {
        refreshControl?.beginRefreshing()
        presenter.fetchTodoList { [weak self] in
            self?.refreshControl?.endRefreshing()
            self?.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.prepare(for: segue)
    }

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return presenter.todosCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let todo = presenter.todo(from: indexPath.row)
        cell.textLabel?.text = todo.title ?? ""
        //cell.detailTextLabel?.text = todo.

        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.select(indexPath.row)
        performSegue(withIdentifier: "TodoDetail", sender: nil)
    }

}

// MARK: - PresenterInjectable
extension TodoListViewController: PresenterInjectable {
    func inject(with presenter: TodoListPresenter) {
        self.presenter = presenter
    }
}

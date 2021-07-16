import UIKit

protocol CompetitionListTableViewAdapterDelegate {
    
}

class CompetitionListTableViewAdapter: NSObject {
    private let tableView: UITableView
    private let delegate: CompetitionListTableViewAdapterDelegate
    private var viewModel: [CompetitionViewModel]?
    
    init(tableView: UITableView,
         delegate: CompetitionListTableViewAdapterDelegate) {
        self.tableView = tableView
        self.delegate = delegate
        
        super.init()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.registerCell(CompetitionListTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension CompetitionListTableViewAdapter: UITableViewDelegate {
    
}

extension CompetitionListTableViewAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let unwrapped = self.viewModel else {
            return tableView.dequeueReusableCell(for: indexPath)
        }
        
        let cell: CompetitionListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: unwrapped[indexPath.row])
        return cell
    }
}

extension CompetitionListTableViewAdapter {
    func set(competitions: [CompetitionViewModel]) {
        self.viewModel = competitions
        self.tableView.reloadData()
    }
}

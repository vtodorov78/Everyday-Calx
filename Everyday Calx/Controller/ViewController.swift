//
//  ViewController.swift
//  Everyday Calx
//
//  Created by Vladimir Todorov on 15.02.25.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = .systemBlue
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Calculators.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let callculators = Calculators(rawValue: indexPath.row)
        cell.textLabel?.text = callculators?.title
        return cell
    }
}


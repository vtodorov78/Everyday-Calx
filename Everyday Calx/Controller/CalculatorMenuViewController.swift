//
//  ViewController.swift
//  Everyday Calx
//
//  Created by Vladimir Todorov on 15.02.25.
//

import UIKit

class CalculatorMenuViewController: UITableViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNav()
    }
    
    // MARK: - Helper functions
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setupNav() {
        let appereance = UINavigationBarAppearance()
        appereance.configureWithOpaqueBackground()
        appereance.backgroundColor = .systemGroupedBackground
        self.navigationController?.navigationBar.standardAppearance = appereance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appereance
        self.navigationController?.navigationBar.compactAppearance = appereance
        
        self.view.backgroundColor = .systemBackground
    }
}

// MARK: - TableView
extension CalculatorMenuViewController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "CALCULATOR MENU"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Calculators.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let calculators = Calculators(rawValue: indexPath.row)
        cell.textLabel?.text = calculators?.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let calculators = Calculators(rawValue: indexPath.row)
        
        switch calculators {
        case .discountCalc:
            let discountVC = DiscountViewController()
            self.navigationController?.pushViewController(discountVC, animated: true)
        case .tipCalc:
            let tipVC = TipViewController()
            self.navigationController?.pushViewController(tipVC, animated: true)
        case .loanCalc:
            let loanVC = LoanViewController()
            self.navigationController?.pushViewController(loanVC, animated: true)
        case .paychekCalc:
            let paychekVC = PaycheckViewController()
            self.navigationController?.pushViewController(paychekVC, animated: true)
        case nil:
            return
        }
    }
}


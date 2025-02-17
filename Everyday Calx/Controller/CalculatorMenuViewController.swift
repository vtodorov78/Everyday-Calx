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
        
        self.view.backgroundColor = .systemBackground
        
        setupTableView()
        setupNav()
    }
    
    // MARK: - Helper functions
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CalculatorCell.self, forCellReuseIdentifier: CalculatorCell.indentifier)
    }
    
    func setupNav() {
        let appereance = UINavigationBarAppearance()
        appereance.configureWithOpaqueBackground()
        appereance.backgroundColor = .systemGroupedBackground
        self.navigationController?.navigationBar.standardAppearance = appereance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appereance
        self.navigationController?.navigationBar.compactAppearance = appereance
    }

}

// MARK: - TableView
extension CalculatorMenuViewController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "CALCULATOR MENU"
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Calculators.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CalculatorCell.indentifier, for: indexPath) as? CalculatorCell else { return UITableViewCell() }
        let calculators = Calculators(rawValue: indexPath.row)
        
        cell.configure(with: calculators?.title ?? "", and: UIImage(systemName: calculators?.image ?? "") ?? UIImage())
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
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


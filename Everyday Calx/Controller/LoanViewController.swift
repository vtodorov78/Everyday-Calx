//
//  LoanViewController.swift
//  Everyday Calx
//
//  Created by Vladimir Todorov on 16.02.25.
//

import UIKit

class LoanViewController: UIViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - Helper Functions
    func setupUI() {
        self.navigationItem.title = "Loan Calculator"
        self.view.backgroundColor = .systemBackground
    }
}

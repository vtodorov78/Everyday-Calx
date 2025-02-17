//
//  DiscountViewController.swift
//  Everyday Calx
//
//  Created by Vladimir Todorov on 16.02.25.
//

import UIKit

class DiscountViewController: UIViewController {

    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - Helper Functions
    func setupUI() {
        self.navigationItem.title = "Discount Calculator"
        self.view.backgroundColor = .systemBackground
    }
    
}

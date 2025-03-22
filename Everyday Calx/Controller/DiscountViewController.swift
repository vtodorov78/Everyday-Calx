//
//  DiscountViewController.swift
//  Everyday Calx
//
//  Created by Vladimir Todorov on 16.02.25.
//

import UIKit

class DiscountViewController: UIViewController {
    
    // MARK: - Properties
    private let itemPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price of Item"
        label.textColor = .systemMint
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private let itemPriceSignLabel: UILabel = {
        let label = UILabel()
        label.text = "$"
        label.textColor = .systemPink
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
   private let itemPriceTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "0.00"
        textField.keyboardType = .decimalPad
        textField.backgroundColor = .systemGray5
        textField.textAlignment = .center
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private let salesTaxLabel: UILabel = {
        let label = UILabel()
        label.text = "Sales Tax"
        label.textColor = .systemMint
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private let salesTaxSignLabel: UILabel = {
        let label = UILabel()
        label.text = "%"
        label.textColor = .systemPink
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let salesTaxTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "0%"
        textField.keyboardType = .decimalPad
        textField.backgroundColor = .systemGray5
        textField.textAlignment = .center
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private let salesTaxHintLabel: UILabel = {
        let label = UILabel()
        label.text = "Leave this field blank if tax is included in the price."
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    private let discountLabel: UILabel = {
        let label = UILabel()
        label.text = "Discount"
        label.textColor = .systemMint
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private let discountControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["$", "%"])
        control.selectedSegmentIndex = 1
        control.layer.cornerRadius = 8
        control.layer.borderWidth = 1.5
        control.layer.masksToBounds = true
        control.layer.borderColor = UIColor.systemPink.cgColor
        control.tintColor = .systemPink
        control.selectedSegmentTintColor = .systemPink
        control.backgroundColor = .systemBackground
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemPink, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)], for: .normal)
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)], for: .selected)
        return control
    }()
    
   private let discountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "0%"
        textField.keyboardType = .decimalPad
        textField.backgroundColor = .systemGray5
        textField.textAlignment = .center
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private let otherDiscountLabel: UILabel = {
        let label = UILabel()
        label.text = "Other Discount"
        label.textColor = .systemMint
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private let otherDiscountControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["$", "%"])
        control.selectedSegmentIndex = 1
        control.layer.cornerRadius = 8
        control.layer.borderWidth = 1.5
        control.layer.masksToBounds = true
        control.layer.borderColor = UIColor.systemPink.cgColor
        control.tintColor = .systemPink
        control.selectedSegmentTintColor = .systemPink
        control.backgroundColor = .systemBackground
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemPink, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)], for: .normal)
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)], for: .selected)
        return control
    }()
    
   private let otherDiscountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "0%"
        textField.keyboardType = .decimalPad
        textField.backgroundColor = .systemGray5
        textField.textAlignment = .center
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.backgroundColor = .systemPink
        button.tintColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let youSaveLabel: UILabel = {
        let label = UILabel()
        label.text = "You Save"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    private let youSaveTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray5
        textField.textAlignment = .center
        textField.textColor = .systemGreen
        textField.font = UIFont.systemFont(ofSize: 29)
        textField.layer.cornerRadius = 8
        textField.isEnabled = false
        return textField
    }()
    
    private let finalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Final Price"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    private let finalPriceTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray5
        textField.textAlignment = .center
        textField.textColor = .systemGreen
        textField.font = UIFont.systemFont(ofSize: 29)
        textField.layer.cornerRadius = 8
        textField.isEnabled = false
        return textField
    }()
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - Helper Functions
    @objc private func handleDiscountControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            discountTextField.placeholder = "0.00"
        case 1:
            discountTextField.placeholder = "0%"
        default:
            discountTextField.placeholder = "0%"
        }
    }
    
    @objc private func handleOtherDiscountControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            otherDiscountTextField.placeholder = "0.00"
        case 1:
            otherDiscountTextField.placeholder = "0%"
        default:
            otherDiscountTextField.placeholder = "0%"
        }
    }
    
    @objc private func calculate() {
        guard let price = Double(itemPriceTextField.text ?? "") else { return }
        let salesTax = Double(salesTaxTextField.text ?? "")
        guard let discount = Double(discountTextField.text ?? "") else { return}
        let additionalDiscount = Double(otherDiscountTextField.text ?? "")
        
        let isDiscountInPercentage = discountControl.selectedSegmentIndex == 1 ? true : false
        let isAdditionalDiscountInPercentage = otherDiscountControl.selectedSegmentIndex == 1 ? true : false
        
        let discountModel = DiscountModel(itemPrice: price, salesTax: salesTax, discount: discount, additionalDiscount: additionalDiscount, isDiscountInPercentage: isDiscountInPercentage, isAdditionalDiscountInPercentage: isAdditionalDiscountInPercentage)
        
        let calculation = discountModel.calculateDiscountAndFinalPrice(with: discountModel)
        
        youSaveTextField.text = "\(calculation.discountAmount ?? "")"
        finalPriceTextField.text = "\(calculation.finalPrice ?? "")"
        itemPriceTextField.resignFirstResponder()
        salesTaxTextField.resignFirstResponder()
        discountTextField.resignFirstResponder()
        otherDiscountTextField.resignFirstResponder()
    }
    
    private func setupUI() {
        self.navigationItem.title = "Discount Calculator"
        self.view.backgroundColor = .systemBackground
        
        view.addSubview(itemPriceLabel)
        itemPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        itemPriceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28).isActive = true
        itemPriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        itemPriceLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        view.addSubview(itemPriceTextField)
        itemPriceTextField.translatesAutoresizingMaskIntoConstraints = false
        itemPriceTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28).isActive = true
        itemPriceTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        itemPriceTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
        itemPriceTextField.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        view.addSubview(itemPriceSignLabel)
        itemPriceSignLabel.translatesAutoresizingMaskIntoConstraints = false
        itemPriceSignLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28).isActive = true
        itemPriceSignLabel.trailingAnchor.constraint(equalTo: itemPriceTextField.leadingAnchor, constant: -5).isActive = true
        itemPriceSignLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        view.addSubview(salesTaxLabel)
        salesTaxLabel.translatesAutoresizingMaskIntoConstraints = false
        salesTaxLabel.topAnchor.constraint(equalTo: itemPriceLabel.bottomAnchor, constant: 28).isActive = true
        salesTaxLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        salesTaxLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        view.addSubview(salesTaxTextField)
        salesTaxTextField.translatesAutoresizingMaskIntoConstraints = false
        salesTaxTextField.topAnchor.constraint(equalTo: itemPriceTextField.bottomAnchor, constant: 28).isActive = true
        salesTaxTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        salesTaxTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
        salesTaxTextField.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        view.addSubview(salesTaxHintLabel)
        salesTaxHintLabel.translatesAutoresizingMaskIntoConstraints = false
        salesTaxHintLabel.topAnchor.constraint(equalTo: salesTaxTextField.bottomAnchor, constant: 5).isActive = true
        salesTaxHintLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        view.addSubview(salesTaxSignLabel)
        salesTaxSignLabel.translatesAutoresizingMaskIntoConstraints = false
        salesTaxSignLabel.topAnchor.constraint(equalTo: itemPriceSignLabel.bottomAnchor, constant: 28).isActive = true
        salesTaxSignLabel.trailingAnchor.constraint(equalTo: salesTaxTextField.leadingAnchor, constant: -5).isActive = true
        salesTaxSignLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        view.addSubview(discountLabel)
        discountLabel.translatesAutoresizingMaskIntoConstraints = false
        discountLabel.topAnchor.constraint(equalTo: salesTaxHintLabel.bottomAnchor, constant: 28-salesTaxHintLabel.frame.size.height-5).isActive = true
        discountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        discountLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        view.addSubview(discountTextField)
        discountTextField.translatesAutoresizingMaskIntoConstraints = false
        discountTextField.topAnchor.constraint(equalTo: salesTaxHintLabel.bottomAnchor, constant: 28-salesTaxHintLabel.frame.size.height-5).isActive = true
        discountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        discountTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
        discountTextField.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        view.addSubview(discountControl)
        discountControl.translatesAutoresizingMaskIntoConstraints = false
        discountControl.topAnchor.constraint(equalTo: salesTaxHintLabel.bottomAnchor, constant: 28-salesTaxHintLabel.frame.size.height-5).isActive = true
        discountControl.trailingAnchor.constraint(equalTo: discountTextField.leadingAnchor, constant: -5).isActive = true
        discountControl.heightAnchor.constraint(equalToConstant: 34).isActive = true
        discountControl.widthAnchor.constraint(equalToConstant: 60).isActive = true
        discountControl.addTarget(self, action: #selector(handleDiscountControlValueChanged), for: .valueChanged)
        
        view.addSubview(otherDiscountLabel)
        otherDiscountLabel.translatesAutoresizingMaskIntoConstraints = false
        otherDiscountLabel.topAnchor.constraint(equalTo: discountLabel.bottomAnchor, constant: 28).isActive = true
        otherDiscountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        otherDiscountLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        view.addSubview(otherDiscountTextField)
        otherDiscountTextField.translatesAutoresizingMaskIntoConstraints = false
        otherDiscountTextField.topAnchor.constraint(equalTo: discountTextField.bottomAnchor, constant: 28).isActive = true
        otherDiscountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        otherDiscountTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
        otherDiscountTextField.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        view.addSubview(otherDiscountControl)
        otherDiscountControl.translatesAutoresizingMaskIntoConstraints = false
        otherDiscountControl.topAnchor.constraint(equalTo: discountTextField.bottomAnchor, constant: 28).isActive = true
        otherDiscountControl.trailingAnchor.constraint(equalTo: otherDiscountTextField.leadingAnchor, constant: -5).isActive = true
        otherDiscountControl.heightAnchor.constraint(equalToConstant: 34).isActive = true
        otherDiscountControl.widthAnchor.constraint(equalToConstant: 60).isActive = true
        otherDiscountControl.addTarget(self, action: #selector(handleOtherDiscountControlValueChanged), for: .valueChanged)
        
        view.addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.topAnchor.constraint(equalTo: otherDiscountTextField.bottomAnchor, constant: 66).isActive = true
        calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calculateButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        calculateButton.widthAnchor.constraint(equalToConstant: view.frame.width - 62).isActive = true
        calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        
        view.addSubview(youSaveLabel)
        youSaveLabel.translatesAutoresizingMaskIntoConstraints = false
        youSaveLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 50).isActive = true
        youSaveLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(youSaveTextField)
        youSaveTextField.translatesAutoresizingMaskIntoConstraints = false
        youSaveTextField.topAnchor.constraint(equalTo: youSaveLabel.bottomAnchor, constant: 15).isActive = true
        youSaveTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        youSaveTextField.heightAnchor.constraint(equalToConstant: 42).isActive = true
        youSaveTextField.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        view.addSubview(finalPriceLabel)
        finalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        finalPriceLabel.topAnchor.constraint(equalTo: youSaveTextField.bottomAnchor, constant: 40).isActive = true
        finalPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(finalPriceTextField)
        finalPriceTextField.translatesAutoresizingMaskIntoConstraints = false
        finalPriceTextField.topAnchor.constraint(equalTo: finalPriceLabel.bottomAnchor, constant: 15).isActive = true
        finalPriceTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        finalPriceTextField.heightAnchor.constraint(equalToConstant: 42).isActive = true
        finalPriceTextField.widthAnchor.constraint(equalToConstant: 180).isActive = true
    }
}

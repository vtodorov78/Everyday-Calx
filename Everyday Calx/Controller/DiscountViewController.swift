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
    
    private let otherDiscountHintLabel: UILabel = {
        let label = UILabel()
        label.text = "Use this field if you need to caluclate additional discount."
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    private let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.backgroundColor = .systemPink
        button.tintColor = .white
        button.layer.cornerRadius = 10
        return button
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
        textField.font = UIFont.boldSystemFont(ofSize: 32)
        textField.layer.cornerRadius = 8
        textField.isEnabled = false
        textField.adjustsFontSizeToFitWidth = true
        return textField
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
        textField.font = UIFont.boldSystemFont(ofSize: 32)
        textField.layer.cornerRadius = 8
        textField.isEnabled = false
        textField.adjustsFontSizeToFitWidth = true
        return textField
    }()
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Helper Functions
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
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
        finalPriceTextField.text = ""
        youSaveTextField.text = ""
        
        var itemDiscount = 0.00
        var salesTax: Double?
        var additionalDiscount: Double?
        
        let isDiscountInPercentage = discountControl.selectedSegmentIndex == 1 ? true : false
        let isAdditionalDiscountInPercentage = otherDiscountControl.selectedSegmentIndex == 1 ? true : false
        
        // check if price field is empty
        guard let price = itemPriceTextField.text, !price.isEmpty else {
            AlertManager.showPriceFieldIsEmpty(on: self)
            itemPriceTextField.becomeFirstResponder()
            return
        }
        
        // check if discount field is empty
        guard let discount = discountTextField.text, !discount.isEmpty else {
            AlertManager.showDiscountFieldIsEmpty(on: self)
            discountTextField.becomeFirstResponder()
            return
        }
        
        // check if price is valid value and convert it to double
        guard let itemPrice = Double(price.replacingOccurrences(of: ",", with: ".")) else {
            AlertManager.showInvalidPrice(on: self)
            itemPriceTextField.becomeFirstResponder()
            return
        }
        
        // check if discount is in percentage and check if its valid value and convert it to double
        if isDiscountInPercentage {
            guard let discountPercentage = Double(discount.replacingOccurrences(of: ",", with: ".")), discountPercentage <= 100.0 else {
                AlertManager.showInvalidDiscountPercentage(on: self)
                discountTextField.becomeFirstResponder()
                return
            }
            itemDiscount = discountPercentage
        } else {
            guard let discountValue = Double(discount.replacingOccurrences(of: ",", with: ".")), discountValue < itemPrice else {
                AlertManager.showInvalidDiscountValue(on: self)
                discountTextField.becomeFirstResponder()
                return
            }
            itemDiscount = discountValue
        }
        
        // Compute price after initial discount
        let priceAfterInitialDiscount: Double
        if isDiscountInPercentage {
            priceAfterInitialDiscount = itemPrice * (1 - itemDiscount / 100)
        } else {
            priceAfterInitialDiscount = itemPrice - itemDiscount
        }
        
        // if there is a tax rate check if its valid and convert it to double
        if let tax = salesTaxTextField.text, !tax.isEmpty {
            guard let taxValue = Double(tax.replacingOccurrences(of: ",", with: ".")) else {
                AlertManager.showInvalidSalesTax(on: self)
                salesTaxTextField.becomeFirstResponder()
                return
            }
            salesTax = taxValue
        }
        
        // if there is additional discount check if its valid and convert it to double
        if let addDiscount = otherDiscountTextField.text, !addDiscount.isEmpty {
            
            if isAdditionalDiscountInPercentage {
                guard let addDiscountPercentage = Double(addDiscount.replacingOccurrences(of: ",", with: ".")), addDiscountPercentage <= 100.0 else {
                    AlertManager.showInvalidAdditionalDiscountPercentage(on: self)
                    otherDiscountTextField.becomeFirstResponder()
                    return
                }
                additionalDiscount = addDiscountPercentage
            } else {
                guard let addDiscountValue = Double(addDiscount.replacingOccurrences(of: ",", with: ".")), addDiscountValue <= (priceAfterInitialDiscount + 1e-6) else {
                    AlertManager.showInvalidAdditionalDiscountValue(on: self)
                    otherDiscountTextField.becomeFirstResponder()
                    return
                }
                additionalDiscount = addDiscountValue
            }
        }

        let discountModel = DiscountModel(itemPrice: itemPrice, salesTax: salesTax, discount: itemDiscount, additionalDiscount: additionalDiscount, isDiscountInPercentage: isDiscountInPercentage, isAdditionalDiscountInPercentage: isAdditionalDiscountInPercentage)
        
        let calculation = discountModel.calculateDiscountAndFinalPrice(with: discountModel)
        
        youSaveTextField.text = "\(calculation.discountAmount ?? "")"
        finalPriceTextField.text = "\(calculation.finalPrice ?? "")"
       
        view.endEditing(true)
    }
    
    @objc private func clearTextFields() {
        itemPriceTextField.text = ""
        salesTaxTextField.text = ""
        discountTextField.text = ""
        otherDiscountTextField.text = ""
        finalPriceTextField.text = ""
        youSaveTextField.text = ""
        
        view.endEditing(true)
    }
    
    private func setupUI() {
        self.navigationItem.title = "Discount Calculator"
        self.view.backgroundColor = .systemBackground
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearTextFields))
        
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
        itemPriceTextField.delegate = self
        
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
        salesTaxTextField.delegate = self
        
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
        discountTextField.delegate = self
        
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
        otherDiscountTextField.delegate = self
        
        view.addSubview(otherDiscountHintLabel)
        otherDiscountHintLabel.translatesAutoresizingMaskIntoConstraints = false
        otherDiscountHintLabel.topAnchor.constraint(equalTo: otherDiscountTextField.bottomAnchor, constant: 7).isActive = true
        otherDiscountHintLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        view.addSubview(otherDiscountControl)
        otherDiscountControl.translatesAutoresizingMaskIntoConstraints = false
        otherDiscountControl.topAnchor.constraint(equalTo: discountTextField.bottomAnchor, constant: 28).isActive = true
        otherDiscountControl.trailingAnchor.constraint(equalTo: otherDiscountTextField.leadingAnchor, constant: -5).isActive = true
        otherDiscountControl.heightAnchor.constraint(equalToConstant: 34).isActive = true
        otherDiscountControl.widthAnchor.constraint(equalToConstant: 60).isActive = true
        otherDiscountControl.addTarget(self, action: #selector(handleOtherDiscountControlValueChanged), for: .valueChanged)
        
        view.addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.topAnchor.constraint(equalTo: otherDiscountHintLabel.bottomAnchor, constant: 50).isActive = true
        calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calculateButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        calculateButton.widthAnchor.constraint(equalToConstant: view.frame.width - 62).isActive = true
        calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        
        view.addSubview(finalPriceLabel)
        finalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        finalPriceLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 48).isActive = true
        finalPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(finalPriceTextField)
        finalPriceTextField.translatesAutoresizingMaskIntoConstraints = false
        finalPriceTextField.topAnchor.constraint(equalTo: finalPriceLabel.bottomAnchor, constant: 15).isActive = true
        finalPriceTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        finalPriceTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        finalPriceTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(youSaveLabel)
        youSaveLabel.translatesAutoresizingMaskIntoConstraints = false
        youSaveLabel.topAnchor.constraint(equalTo: finalPriceTextField.bottomAnchor, constant: 40).isActive = true
        youSaveLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(youSaveTextField)
        youSaveTextField.translatesAutoresizingMaskIntoConstraints = false
        youSaveTextField.topAnchor.constraint(equalTo: youSaveLabel.bottomAnchor, constant: 15).isActive = true
        youSaveTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        youSaveTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        youSaveTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

// MARK: - TextField Delegate
extension DiscountViewController: UITextFieldDelegate {
    
    // allow user to enter only decimal numbers
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = "0123456789,."
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        
        return allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }
}

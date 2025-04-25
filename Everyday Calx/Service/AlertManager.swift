//
//  AlertManager.swift
//  Everyday Calx
//
//  Created by Vladimir Todorov on 30.03.25.
//

import UIKit


class AlertManager {
    
    static func showTextAlert(on vc: UIViewController, with title: String, with message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
    
    public static func showPriceFieldIsEmpty(on vc: UIViewController) {
        self.showTextAlert(on: vc, with: "Price required", with: "Please enter an item price. Example: 29.99.")
    }
    
    public static func showInvalidPrice(on vc: UIViewController) {
        self.showTextAlert(on: vc, with: "Invalid Price Format", with: "Price must be a positive number. Example: 45.50.")
    }
    
    public static func showDiscountFieldIsEmpty(on vc: UIViewController) {
        self.showTextAlert(on: vc, with: "Discount Required", with: "Please enter an item discount. Example: 15.")
    }
    
    public static func showInvalidDiscountPercentage(on vc: UIViewController) {
        self.showTextAlert(on: vc, with: "Invalid Discount Percentage", with: "Discount must be between 0% and 100%.")
    }
    
    public static func showInvalidDiscountValue(on vc: UIViewController) {
        self.showTextAlert(on: vc, with: "Invalid Discount Value", with: "Discount must be a positive number and cannot exceed the item's price.")
    }
    
    public static func showInvalidSalesTax(on vc: UIViewController) {
        self.showTextAlert(on: vc, with: "Invalid Tax Rate", with: "Tax rate must be a positive number. Example: 5.")
    }
    
    public static func showInvalidAdditionalDiscountPercentage(on vc: UIViewController) {
        self.showTextAlert(on: vc, with: "Invalid Other Discount Percentage", with: "Other Discount must be between 0% and 100%.")
    }
    
    public static func showInvalidAdditionalDiscountValue(on vc: UIViewController) {
        self.showTextAlert(on: vc, with: "Invalid Other Discount Value", with: "Discount and Other Discount combined cannot exceed the item's price.")
    }
}

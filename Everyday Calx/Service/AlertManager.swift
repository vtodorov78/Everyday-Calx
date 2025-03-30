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
        self.showTextAlert(on: vc, with: "Price field is empty", with: "Please enter a valid price.")
    }
    
    public static func showDisountFieldIsEmpty(on vc: UIViewController) {
        self.showTextAlert(on: vc, with: "Discount field is empty", with: "Please enter a valid disount.")
    }
}

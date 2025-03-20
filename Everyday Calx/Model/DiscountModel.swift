//
//  DiscountModel.swift
//  Everyday Calx
//
//  Created by Vladimir Todorov on 20.03.25.
//

import Foundation

struct DiscountModel {
    let itemPrice: Double
    let salesTax: Double?
    let discount: Double
    let additionalDiscount: Double?
    
    func calculateDiscountAndFinalPrice(with model: DiscountModel) -> (discountAmount: String?, finalPrice: String?) {
        // Apply first discount
        let priceAfterFirstDiscount = itemPrice * (1 - discount / 100)
        
        // Apply additional discount
        let priceAfterAdditionalDiscount = priceAfterFirstDiscount * (1 - (additionalDiscount ?? 0) / 100)
        
        // Calculate total discount amount
        let discountAmount = itemPrice - priceAfterAdditionalDiscount
        
        // Calculate final price before tax
        var finalPrice = priceAfterAdditionalDiscount
        
        // Add sales tax if provided (price didn't include tax)
        if let taxRate = salesTax {
            let taxAmount = priceAfterAdditionalDiscount * taxRate / 100
            finalPrice += taxAmount
        }
        
        // Format result to currency
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        
        let discountAmountFormatted = formatter.string(from: discountAmount as NSNumber)
        let finalPriceFormatted = formatter.string(from: finalPrice as NSNumber)
        
        return (discountAmountFormatted, finalPriceFormatted)
    }
}

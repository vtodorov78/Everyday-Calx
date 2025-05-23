//
//  Calculators.swift
//  Everyday Calx
//
//  Created by Vladimir Todorov on 16.02.25.
//

import Foundation

enum Calculators: Int, CaseIterable {
    case discountCalc
    case tipCalc
    case loanCalc
    case paychekCalc
    
    var title: String {
        switch self {
        case .discountCalc:
            return "Discount"
        case .tipCalc:
            return "Tip"
        case .loanCalc:
            return "Loan"
        case .paychekCalc:
            return "Paycheck"
        }
    }
    
    var image: String {
        switch self {
        case .discountCalc:
            return "percent"
        case .tipCalc:
            return "fork.knife.circle"
        case .loanCalc:
            return "dollarsign.bank.building"
        case .paychekCalc:
            return "dollarsign.circle"
        }
    }
}

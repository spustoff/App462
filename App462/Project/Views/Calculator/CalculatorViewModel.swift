//
//  CalculatorViewModel.swift
//  App462
//
//  Created by IGOR on 08/04/2024.
//

import SwiftUI

final class CalculatorViewModel: ObservableObject {

    @Published var isCalculate: Bool = false
    
    @Published var fee: String = ""
    @Published var equipment: String = ""
    @Published var initial_inventory_cost: String = ""
    @Published var operating_capital: String = ""
    @Published var monthly_sales_estimate: String = ""
    @Published var monthly_operating_expenses: String = ""
    @Published var profit_margin: String = ""
}

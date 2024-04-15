//
//  CalculatorView.swift
//  App462
//
//  Created by IGOR on 08/04/2024.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                
                VStack(spacing: 40) {
                    
                    HStack(alignment: .top) {
                        
                        Text("Calculator")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Spacer()
                    }
                    
                    Button(action: {
                        
                        if viewModel.isCalculate {
                            
                            viewModel.fee = ""
                            viewModel.equipment = ""
                            viewModel.initial_inventory_cost = ""
                            viewModel.operating_capital = ""
                            viewModel.monthly_sales_estimate = ""
                            viewModel.monthly_operating_expenses = ""
                            viewModel.profit_margin = ""
                        }
                        
                        viewModel.isCalculate.toggle()
                        
                    }, label: {
                        
                        Text(viewModel.isCalculate ? "Reset" : "Calculate")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .opacity(viewModel.fee.isEmpty || viewModel.equipment.isEmpty || viewModel.initial_inventory_cost.isEmpty || viewModel.operating_capital.isEmpty || viewModel.monthly_sales_estimate.isEmpty || viewModel.monthly_operating_expenses.isEmpty || viewModel.profit_margin.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.fee.isEmpty || viewModel.equipment.isEmpty || viewModel.initial_inventory_cost.isEmpty || viewModel.operating_capital.isEmpty || viewModel.monthly_sales_estimate.isEmpty || viewModel.monthly_operating_expenses.isEmpty || viewModel.profit_margin.isEmpty ? true : false)
                }
                .padding()
                .background(Image("card2").resizable())
                .padding(.horizontal)
                
                Text(viewModel.isCalculate ? "Result" : "Input Data")
                    .foregroundColor(.white)
                    .font(.system(size: 19, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                if viewModel.isCalculate {
                    
                    VStack {
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Total initial investment")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("\(Int.random(in: 12000...130000))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                })
                            })
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Monthly net profit")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("\(Int.random(in: 12000...130000))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                })
                            })
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Annual net profit")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("\(Int.random(in: 12000...130000))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                })
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                        .padding([.horizontal, .bottom])
                        
                        Spacer()
                    }
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 20) {
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Fee")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter amount")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.fee.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.fee)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                        .keyboardType(.decimalPad)
                                })
                            })
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Equipment & Setup Costs")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter amount")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.equipment.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.equipment)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                        .keyboardType(.decimalPad)
                                })
                            })
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Initial Inventory Cost")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter amount")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.initial_inventory_cost.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.initial_inventory_cost)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                        .keyboardType(.decimalPad)
                                })
                            })
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Operating Capital")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter amount")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.operating_capital.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.operating_capital)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                        .keyboardType(.decimalPad)
                                })
                            })
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Monthly Sales Estimate")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter amount")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.monthly_sales_estimate.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.monthly_sales_estimate)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                        .keyboardType(.decimalPad)
                                })
                            })
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Monthly Operating Expenses")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter amount")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.monthly_operating_expenses.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.monthly_operating_expenses)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                        .keyboardType(.decimalPad)
                                })
                            })
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Profit Margin (%)")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter amount")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.profit_margin.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.profit_margin)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                        .keyboardType(.decimalPad)
                                })
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                        .padding([.horizontal, .bottom])
                    }
                }
            }
        }
    }
}

#Preview {
    CalculatorView()
}

//
//  HomeViewModel.swift
//  App462
//
//  Created by IGOR on 08/04/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @Published var isEditBalance: Bool = false
    @AppStorage("balance") var balance: String = ""
    @AppStorage("change") var change: String = ""
    @AppStorage("direction") var direction: String = ""
    
    @Published var transactions: [TransactionModel] = []
    @Published var isTransactions: Bool = false
    @Published var isAddTransactions: Bool = false
    
    @Published var transaction_amount: String = ""
    @Published var transaction_buyer: String = ""
    @Published var transaction_franchise: String = ""
    @Published var transaction_direction: String = ""
    
    @Published var buyers: [BuyerModel] = []
    @Published var isBuyers: Bool = false
    @Published var isAddBuyers: Bool = false
    
    @Published var buyer_firstName: String = ""
    @Published var buyer_secondName: String = ""
    
    @Published var franchises: [FranchiseModel] = []
    @Published var isFranchisesDetail: Bool = false
    @Published var isAddFranchise: Bool = false
    @Published var franchiseSelected: FranchiseModel? = nil
    
    @Published var fran_something: String = ""
    @Published var avg_annual_sales: String = ""
    @Published var avg_profit_margine: String = ""
    @Published var category: String = ""
    @Published var geo_presence: String = ""
    @Published var initital_investmne: String = ""
    @Published var min_liq_capital: String = ""
    @Published var name: String = ""
    @Published var royalty_fee: String = ""
    @Published var text: String = ""
    
    func addFranchise() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "FranchiseModel", into: context) as! FranchiseModel
        
        loan.something = fran_something
        loan.avg_annual_sales = avg_annual_sales
        loan.avg_profit_margine = avg_profit_margine
        loan.category = category
        loan.geo_presence = geo_presence
        loan.initital_investmne = initital_investmne
        loan.min_liq_capital = min_liq_capital
        loan.name = name
        loan.royalty_fee = royalty_fee
        loan.text = text
            
        CoreDataStack.shared.saveContext()
    }
    
    func fetchFranchies() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FranchiseModel>(entityName: "FranchiseModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.franchises = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.franchises = []
        }
    }
    
    func addTransaction() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TransactionModel", into: context) as! TransactionModel
        
        loan.amount = Int16(transaction_amount) ?? 0
        loan.buyer = transaction_buyer
        loan.franchise = transaction_franchise
        loan.direction = transaction_direction
            
        CoreDataStack.shared.saveContext()
    }
    
    func fetchTransactions() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TransactionModel>(entityName: "TransactionModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.transactions = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.transactions = []
        }
    }

    func addBuyer() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "BuyerModel", into: context) as! BuyerModel
        
        loan.first_name = buyer_firstName
        loan.second_name = buyer_secondName
            
        CoreDataStack.shared.saveContext()
    }
    
    func fetchBuyers() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<BuyerModel>(entityName: "BuyerModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.buyers = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.buyers = []
        }
    }
}

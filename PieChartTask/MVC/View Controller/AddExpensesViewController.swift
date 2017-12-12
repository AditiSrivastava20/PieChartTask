//
//  ViewController.swift
//  PieChartTask
//
//  Created by Sierra 4 on 20/03/17.
//  Copyright © 2017 codebrew2. All rights reserved.
//

import UIKit
import CoreData

class AddExpensesViewController: UIViewController
{
    var expenses : [NSManagedObject] = []
    var contentsForPicker : [String] = []
    var flag = 0
    var selectedExpenseType : String = ""
    var expensesId = 0
    var subExpensesId = 0
    @IBOutlet var txtPrice: UITextField!
    @IBOutlet var txtQuantity: UITextField!
    @IBOutlet var txtItemName: UITextField!
    @IBOutlet var expensesPickerView: UIPickerView!
    @IBOutlet var txtExpenseType: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func btnAddExpenses(_ sender: Any)
    {
        saveExpenseInCoreData()
        loadpickerview()
    }
    
    @IBAction func btnAddSubExpenses(_ sender: Any)
    {
        saveSubExpensesCoreData()
    }

    func loadpickerview()
    {
        contentsForPicker = []
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ExpensesList")
        do
        {
            let fetchedValues = try managedContext.fetch(fetchRequest)
            if fetchedValues.count == 0
            {
                contentsForPicker.insert("", at: 0)
            }
                
            else
            {
                print(contentsForPicker)
                for  cname in fetchedValues
                {
                    contentsForPicker.append(cname.value(forKeyPath: "expense") as! String? ?? "")
                }
            }
        }
        catch
        {
            fatalError("Could not fetch")
        }
        self.expensesPickerView.reloadAllComponents()
    }

    func saveExpenseInCoreData()
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
        {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let list = NSEntityDescription.entity(forEntityName: "ExpensesList",in: context)!
        let expenses = NSManagedObject(entity: list, insertInto: context)
        let expensesType = txtExpenseType.text ?? ""
        print(expensesType)
        if strcmp(expensesType, "") == 0
        {
            flag = 1
            CommonFunctionClass.alertMessage(title1: "failure", messageString: "Field is Empty", title2: "try agian", obj: self)
        }
    
        if flag == 0
        {
            txtExpenseType.text = ""
            expenses.setValue(expensesType, forKey: "expense")
            expenses.setValue(String(expensesId), forKey: "id")
            expensesId += 1
           CommonFunctionClass.alertMessage(title1: "Success", messageString: "Added Successfully", title2: "😇", obj: self)
        }
    }
    
    func saveSubExpensesCoreData()
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
        {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let list = NSEntityDescription.entity(forEntityName: "SubExpensesList",in: context)!
        let subExpenses = NSManagedObject(entity: list, insertInto: context)
        let itemName = txtItemName.text ?? ""
        print(itemName)
        let price = txtPrice.text ?? ""
        print(price)
        let quantity = txtQuantity.text ?? ""
        print(quantity)
        if (strcmp(itemName, "") == 0 || strcmp(price, "") == 0 || strcmp(quantity, "") == 0)
        {
            flag = 1
            CommonFunctionClass.alertMessage(title1: "failure", messageString: "Field is Empty", title2: "try agian", obj: self)
        }
        
        if flag == 0
        {
            txtExpenseType.text = ""
            subExpenses.setValue(itemName, forKey: "itemName")
            subExpenses.setValue(price, forKey: "price")
            subExpenses.setValue(quantity, forKey: "quantity")
            subExpenses.setValue(String(subExpensesId), forKey: "id")
            subExpensesId += 1
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ExpensesList")
            do
            {
                var expenseName = ""
                var expenseIdentity = ""
                let fetchedValues = try context.fetch(fetchRequest)
                for  cname in fetchedValues
                {
                    expenseName = ""
                    expenseIdentity = ""
                    expenseName.append(cname.value(forKeyPath: "expense") as! String? ?? "")
                    expenseIdentity.append(cname.value(forKeyPath: "id") as! String? ?? "")
                    if (strcmp(selectedExpenseType, expenseName) == 0)
                    {
                        subExpenses.setValue(expenseIdentity, forKey: "parentId")
                        break
                    }
                }
                do
                {
                    try context.save()
                     CommonFunctionClass.alertMessage(title1: "Success", messageString: "Added Successfully", title2: "😇", obj: self)
                }
                catch
                {
                    fatalError("error in storing data")
                }
            }
            catch
            {
                fatalError("error")
            }
        }
    }
}

extension AddExpensesViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return contentsForPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return contentsForPicker[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectedExpenseType = contentsForPicker[row]
        loadpickerview()
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        var pickerLabel = view as! UILabel!
        pickerLabel = UILabel()
        if view == nil || row % 2 == 0
        {
            pickerLabel?.backgroundColor = .darkGray
        }
        else
        {
            pickerLabel?.backgroundColor = .clear
        }
        let titleData = contentsForPicker[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 26.0)!,NSForegroundColorAttributeName:UIColor.black])
        pickerLabel!.attributedText = myTitle
        pickerLabel!.textAlignment = .center
        return pickerLabel!
    }
}


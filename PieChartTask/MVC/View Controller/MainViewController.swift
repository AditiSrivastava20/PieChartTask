//
//  ViewController.swift
//  piechartManager
//
//  Created by Sierra 4 on 20/03/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit
var salary = 0
class MainViewController: UIViewController {

    @IBOutlet weak var viewpreviousDb: UIView!
    @IBOutlet weak var viewAddDB: UIView!
    @IBOutlet weak var viewupdateDB: UIView!
    @IBOutlet weak var viewSummaryReport: UIView!
    var alert : UIAlertController?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if(salary == 0)
        {
            print("alert")
            self.alert = UIAlertController(title: "Some Title", message: "Enter a text", preferredStyle: .alert)
            alert?.addTextField
            { (textField) in
                textField.placeholder = "Enter Your Salary"
            }
            alert?.addAction(UIAlertAction(title: "OK", style: .default, handler:
            { [weak alert] (_) in
                let textField = alert?.textFields![0]
                print("Text field: \(textField?.text)")
                salary = Int((textField?.text)!) ?? 0
            }))
            self.present(alert!, animated: true, completion: nil)
        }
        let tap = UITapGestureRecognizer(target: self, action:#selector(handleTap))
        viewpreviousDb.addGestureRecognizer(tap)
        let tapright = UITapGestureRecognizer(target: self, action:#selector(handleTap2))
        viewAddDB.addGestureRecognizer(tapright)
        let tapbottomleft = UITapGestureRecognizer(target: self, action:#selector(handleTap3))
        viewupdateDB.addGestureRecognizer(tapbottomleft)
        let tapbottomright = UITapGestureRecognizer(target: self, action:#selector(handleTap4))
        viewSummaryReport.addGestureRecognizer(tapbottomright)
    }
    
    func handleTap() {
        if (salary == 0)
        {
            let alert = UIAlertController(title: "Alert", message: "Enter your Salary", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
        print("tapped")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let secondViewController = storyBoard.instantiateViewController(withIdentifier: "ShowExpenseViewController") as! ShowExpenseViewController
        self.present(secondViewController, animated:true, completion:nil)
        }}
    
    func handleTap2() {
        if (salary == 0)
        {
            let alert = UIAlertController(title: "Alert", message: "Enter your Salary", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
        print("tapped")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let secondViewController = storyBoard.instantiateViewController(withIdentifier: "AddExpensesViewController") as! AddExpensesViewController
        self.present(secondViewController, animated:true, completion:nil)
    }
    }
    func handleTap3() {
        print("tapped")
//       let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let secondViewController = storyBoard.instantiateViewController(withIdentifier: "LeftSlideViewController") as! previousViewController
//        self.present(secondViewController, animated:true, completion:nil)
        let alert = UIAlertController(title: "Alert", message: "Enter your Salary", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = "0"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            print("Text field: \(textField?.text)")
            salary = Int((textField?.text)!)!
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func handleTap4() {
        if (salary == 0)
        {
            let alert = UIAlertController(title: "Alert", message: "Enter your Salary", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
        print("tapped")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let secondViewController = storyBoard.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
        self.present(secondViewController, animated:true, completion:nil)
    }
    }
    @IBAction func unwindToMain(segue: UIStoryboardSegue)
    {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


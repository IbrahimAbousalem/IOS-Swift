//
//  ViewController.swift
//  Employee-Manager
//
//  Created by Esraa Hassan on 3/25/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var salaryTextField: UITextField!
    @IBOutlet weak var answer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func employeeButton(_ sender: UIButton) {
        let text = salaryTextField.text ?? ""
        if(validateata(textData: text)){
            let employee = Employee()
            employee.salary = Double(text)!
            answer.text = String(employee.getSalary())
        }else{
            answer.text = "Please enter a number"
        }
        
    }
    
    @IBAction func managerButton(_ sender: UIButton) {
        let text = salaryTextField.text ?? ""
        if(validateata(textData: text)){
            let manager = Manager()
            manager.salary = Double(text)!
            answer.text = String(manager.getSalary())
        }else{
            answer.text = "Please enter a number"
        }
    }
    
  
    func validateata(textData: String)->Bool{
        return !textData.isEmpty && (Double(textData) != nil)
    }

}


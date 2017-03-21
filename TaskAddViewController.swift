//
//  TaskAddViewController.swift
//  Doit
//
//  Created by Ali on 18/03/2017.
//  Copyright © 2017 compume. All rights reserved.
//

import UIKit

class TaskAddViewController: UIViewController {

    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskImportant: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        //access context of core data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let task = Task(context: context)
        
        task.taskName = taskName.text!
        task.taskImportant = taskImportant.isOn
        
        //save into coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
       //pop back
        navigationController!.popViewController(animated: true)
        
    }
    
    
    
}

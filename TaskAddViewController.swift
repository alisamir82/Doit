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
    
    var previousVC = ViewController()
    
    
    
    @IBAction func addButton(_ sender: Any) {
        
        let task = Task()
        task.taskName = taskName.text!
        task.taskImportant = taskImportant.isOn
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
        }
  


}

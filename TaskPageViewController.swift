//
//  TaskAddPageViewController.swift
//  Doit
//
//  Created by Ali on 18/03/2017.
//  Copyright © 2017 compume. All rights reserved.
//

import UIKit

    class TaskPageViewController: UIViewController {

    var previousVC = ViewController()
    
    var task = Task()
    
    

     @IBOutlet weak var taskTitleLabel: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if task.taskImportant {
            taskTitleLabel.text = "❗️\(task.taskName)"
        }else{
            taskTitleLabel.text = task.taskName
        }
        
        
        
    }

        @IBAction func buttonTapped(_ sender: Any) {
            
            previousVC.tasks.remove(at: previousVC.selectedIndex)
            previousVC.tableView.reloadData()
            navigationController!.popViewController(animated: true)
        }
   
           
            
            




}

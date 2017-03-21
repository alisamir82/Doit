//
//  TaskAddPageViewController.swift
//  Doit
//
//  Created by Ali on 18/03/2017.
//  Copyright © 2017 compume. All rights reserved.
//

import UIKit

class TaskPageViewController: UIViewController {
    
    var task : Task? = nil
    
    
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task!.taskImportant {
            taskTitleLabel.text = "❗️\(task!.taskName!)"
        }else{
            taskTitleLabel.text = task!.taskName!
        }
        
        
        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        navigationController!.popViewController(animated: true)
        
        context.delete((task!))
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
    
    
    
    
    
    
    
}

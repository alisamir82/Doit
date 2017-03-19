//
//  ViewController.swift
//  Doit
//
//  Created by Ali on 18/03/2017.
//  Copyright © 2017 compume. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tasks = makeTasks()
        
        tableView.delegate = self
        tableView.dataSource = self
    
    }

    @IBAction func addTaskButton(_ sender: Any) {
         self.performSegue(withIdentifier: "addSegue", sender: nil)
    }
   
 
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = self.tasks[indexPath.row]
        
   //     self.performSegue(withIdentifier: "viewSegue", sender: task)
        
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! TaskAddViewController;()
        
        nextVC.previousVC = self
 
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell()
        
        let task = self.tasks[indexPath.row]
        
        if task.taskImportant {
            cell.textLabel?.text = "❗️ \(task.taskName)"
        }else{
            cell.textLabel?.text = task.taskName
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func makeTasks() -> [Task]{
        
        
        let task1 = Task()
        task1.taskName = "Pick the kids"
        task1.taskImportant = true
        
        let task2 = Task()
        task2.taskName = "parent meeting"
        task2.taskImportant = false
        
        let task3 = Task()
        task3.taskName = "buy eggs"
        task3.taskImportant = true
        
       return [task1,task2,task3]
        
        
    }
    
}


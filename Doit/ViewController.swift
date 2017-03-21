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
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    
        let task = self.tasks[indexPath.row]
        self.performSegue(withIdentifier: "viewSegue", sender: task)
        
    }
    
    @IBAction func addTaskButton(_ sender: Any) {
        self.performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "viewSegue"{
            let nextVC = segue.destination as! TaskPageViewController
            nextVC.task = sender as? Task
  
        }
        
    }
    
    
    func getTasks()
    {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        //error handling standard with fetch command
        do{
            tasks = try context.fetch(Task.fetchRequest()) as [Task]
            print(tasks)
        } catch{
        print("there is an issue")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let task = self.tasks[indexPath.row]
        
        if task.taskImportant {
            cell.textLabel?.text = "❗️ \(task.taskName!)"
        }else{
            cell.textLabel?.text = task.taskName!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
}


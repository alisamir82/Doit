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
        
        let task1 = Task()
        task1.taskName = "Pick the kids"
        task1.taskDetails = "need to pick them early today"
        task1.taskImportant = true
        task1.taskDate = "12/04/2016"
        
        let task2 = Task()
        task2.taskName = "parent meeting"
        task2.taskDetails = "go early"
        task2.taskImportant = false
        task2.taskDate = "01/05/2016"
        
        self.tasks = [task1,task2]
    
    }

    @IBAction func addTaskButton(_ sender: Any) {
       
        self.performSegue(withIdentifier: "addSegue", sender: sender)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = self.tasks[indexPath.row]
        
        self.performSegue(withIdentifier: "viewSegue", sender: task)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let viewVC = segue.destination as! TaskPageViewController
        
        viewVC.task = sender as! Task
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell()
        cell.textLabel?.text = self.tasks[indexPath.row].taskName
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
}


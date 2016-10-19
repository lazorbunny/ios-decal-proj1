//
//  TodoListItemsTableViewController.swift
//  Todo List
//
//  Created by chena on 10/17/16.
//  Copyright © 2016 julie. All rights reserved.
//

import UIKit

class TodoListItemsTableViewController: UITableViewController {

    var itemList: [TodoItem] = []
    var completeCount = 0
    var timeCounter = 0
    let TIMETOEXPIRE = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimerCount), userInfo: nil, repeats: true)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempCell = tableView.dequeueReusableCell(withIdentifier: "ListPrototypeCell")! as UITableViewCell
        let item = itemList[indexPath.row]
        
        let cell = tempCell.textLabel as UILabel!
        cell?.text = item.itemLabel
        
        if (item.isComplete) {
            tempCell.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            tempCell.accessoryType = UITableViewCellAccessoryType.none
        }
        
        print("donk")
        
        return tempCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let selectedItem = itemList[indexPath.row] as TodoItem
        selectedItem.isComplete = !selectedItem.isComplete
        if (selectedItem.isComplete) {
            completeCount += 1
            selectedItem.timeSinceCompleted = timeCounter
            
        } else {
            completeCount -= 1
            selectedItem.timeSinceCompleted = 0
        }
        
        print("complete count after selection or deselection: \(completeCount)")
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let tdItem = itemList[indexPath.row]
            itemList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if (completeCount > 0 && tdItem.isComplete) {
                completeCount -= 1
            }
            print("complete count after deletion: \(completeCount)")
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    @IBAction func unwindAndAddToList(segue: UIStoryboardSegue) {
        let source = segue.source as! AddTodoItemViewController
        let tdItem: TodoItem = source.tdItem
        
        if tdItem.itemLabel != "" {
            self.itemList.append(tdItem)
            print("Adding new todo item")
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueShowStats" {
            let destViewController = segue.destination as! StatsViewController
            destViewController.completeCount = self.completeCount
        }
    }
    
    /*
    func updateTimerCount() {
        timeCounter += 1
        print("time elapsed: \(timeCounter)")
    }
     */
    
    
    func updateTimerCount(_ tableView: UITableView) {
        timeCounter += 1
        print("time elapsed: \(timeCounter)")
        
        
        
        /*
        let tdItem = itemList[indexPath.row]
        if tdItem.isComplete && ((timeCounter - tdItem.timeSinceCompleted) > TIMETOEXPIRE) {
            print("item \(tdItem.itemLabel) expired, started at \(tdItem.timeSinceCompleted)")
            itemList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completeCount -= 1
        }
         */
    }

}

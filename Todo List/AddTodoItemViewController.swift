//
//  AddTodoItemViewController.swift
//  Todo List
//
//  Created by chena on 10/17/16.
//  Copyright © 2016 julie. All rights reserved.
//

import UIKit

class AddTodoItemViewController: UIViewController {
    @IBOutlet weak var todoText: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    var tdItem: TodoItem = TodoItem(itemLabel: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Prepare to send data to list
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ((self.todoText.text?.characters.count)! > 0) {
            self.tdItem = TodoItem(itemLabel: self.todoText.text!)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
